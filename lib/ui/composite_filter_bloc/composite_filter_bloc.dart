import 'package:bloc/bloc.dart';
import 'package:deedee/generated/filter_service.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/filter_repository.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

import '../../generated/topic_service.pb.dart';

part 'composite_filter_event.dart';

part 'composite_filter_state.dart';

class CompositeFilterBloc
    extends Bloc<CompositeFilterEvent, CompositeFilterState> {
  CompositeFilterBloc() : super(CompositeFilterState([])) {
    on<LoadFiltersEvent>(_onLoadFilters);
    on<PushSavedFiltersEvent>(_onPushSavedFilters);
    on<AddFilterSubscriptionEvent>(_onAddFilterSubscription);
    on<GetFilterSubscription>(_onGetFilterSubscription);
    on<RemoveFilterEvent>(_onRemoveFilterEvent);
    on<SearchSavedFiltersEvent>(_onSearchFilters);
  }

  _onLoadFilters(
      LoadFiltersEvent event, Emitter<CompositeFilterState> emit) async {
    try {
      // TODO: DEEMOB-97
      final stream = await locator
              .get<FilterRepository>()
              .getUserSavedFilters(event.userId) //TODO: Filter
          as ResponseStream<CompositeFilter>;
      List<CompositeFilter> filters = await stream.toList();
      emit(CompositeFilterState(filters));
    } catch (error) {
      print(error.toString());
    }
  }

  _onPushSavedFilters(
      PushSavedFiltersEvent event, Emitter<CompositeFilterState> emit) async {
    try {
      var x = await locator.get<TagRepository>().getTags(event.topic);
      // emit(UserSavedFiltersDoneState(topic)); //TODO:
    } catch (error) {
      print(error.toString());
    }
  }

  _onRemoveFilterEvent(
      RemoveFilterEvent event, Emitter<CompositeFilterState> emit) async {
    CompositeFilterState(
      state.compositeFilterList..removeAt(event.index),
    );
    try {
      await locator.get<FilterRepository>().removeFilterSubscriptionElement(
          state.compositeFilterList[event.index]);
    } catch (error) {
      print(error.toString());
    }
  }

  _onAddFilterSubscription(AddFilterSubscriptionEvent event,
      Emitter<CompositeFilterState> emit) async {
    emit(
      CompositeFilterState(
        state.compositeFilterList
          ..add(
            CompositeFilter(
                compositeFilterId: Int64(),
                topic: Topic(),
                filterMap: {},
                status: CompositeFilter_Status.SUBSCRIBED),
          ),
      ),
    );
    try {
/*      final response = await locator
          .get<GRCPRepository>()
          .addFilterSubscriptionElement(event.userPersonalFilter);*/
    } catch (error) {
      print(error.toString());
    }
  }

  _onGetFilterSubscription(
      GetFilterSubscription event, Emitter<CompositeFilterState> emit) async {
    try {
      final stream = await locator
              .get<FilterRepository>()
              .getFilterSubscriptions(event.userId) //TODO Filter
          as ResponseStream<CompositeFilter>;

      List<CompositeFilter> filters = await stream.toList();
      emit(
        CompositeFilterState(
          state.compositeFilterList..addAll(filters),
        ),
      );
    } catch (error) {
      print(error.toString());
    }
  }

  _onSearchFilters(
      SearchSavedFiltersEvent event, Emitter<CompositeFilterState> emit) async {
    final filters = await locator
        .get<FilterRepository>()
        .getUserSavedFilters(event.filterName);
  }
}
