import 'dart:ffi';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:deedee/repository/composite_filter_repository.dart';
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';

import '../../../../generated/deedee/api/model/composite_filter.pb.dart';
import '../../../../generated/deedee/api/model/topic.pb.dart';
import '../../../../model/user.dart';

part 'composite_filter_event.dart';
part 'composite_filter_state.dart';

class CompositeFilterBloc
    extends Bloc<CompositeFilterEvent, CompositeFilterState> {
  final CompositeFilterRepository _filterRepository;
  final User _user;

  var _compositeFilterList = <CompositeFilter>[];
  CompositeFilterBloc(this._filterRepository, this._user)
      : super(CompositeFilterInitial()) {
    on<CompositeFilterCreateEvent>(_onFilterCreate);
    on<CompositeFilterSubscribeEvent>(_onFilterUpdate);
    on<CompositeFilterDeleteEvent>(_onFilterDelete);
    initialize();
  }
  initialize() async {
    final response = await _filterRepository.getAllFavorites(_user.userId);
    _compositeFilterList = response
        .where((element) => element.status != CompositeFilter_Status.DELETED)
        .toList();
    emit(CompositeFilterLoadState(_compositeFilterList));
  }

  _onFilterCreate(CompositeFilterCreateEvent event,
      Emitter<CompositeFilterState> emit) async {
    try {
      var compositeFilter = event.compositeFilter
        ..compositeFilterId = Int64(Random().nextInt(999999999));
      if (compositeFilter.title == '') {
        compositeFilter.title = 'Filter ${_compositeFilterList.length}';
      }
      await _filterRepository.addToFavorites(compositeFilter);
      emit(CompositeFilterCreateState(event.compositeFilter));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  _onFilterUpdate(CompositeFilterSubscribeEvent event,
      Emitter<CompositeFilterState> emit) {}

  _onFilterDelete(CompositeFilterDeleteEvent event,
      Emitter<CompositeFilterState> emit) async {
    try {
      final response = await _filterRepository
          .removeFromFavorites(event.compositeFilter.compositeFilterId);
      if (response.status == CompositeFilter_Status.DELETED) {
        emit(CompositeFilterDeleteSuccessfulState());
        _compositeFilterList.remove(event.compositeFilter);
      } else {
        emit(CompositeFilterDeleteErrorState(
            compositeFilter: event.compositeFilter, index: event.index));
      }
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }
}
