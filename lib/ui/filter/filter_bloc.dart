import 'package:bloc/bloc.dart';
import 'package:deedee/generated/BucketService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/locator.dart';
import 'package:flutter/material.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterChangeEvent>((event, emit) async {
      emit(FilterChangeState(
          event.predefinedFilterActiveMap, event.accountType));
    });

    on<FilterTagsActionEvent>((event, emit) async {
      final activeFilters = {
        for (final key in event.predefinedFilterActiveMap.keys)
          if (event.predefinedFilterActiveMap[key]!)
            key: event.predefinedFilterActiveMap[key]
      }.keys.toList();

      Bucket bucket = await serviceLocator
          .get<GRCPUtils>()
          .getFilteredTags(activeFilters[0], activeFilters, event.accountType);

      emit(FilterTagsDoneState(bucket));
    });
  }

  retrieveBucket(String _bucket) async {
    Bucket bucket = await serviceLocator
        .get<GRCPUtils>()
        .getBucket(_bucket, AccountType.buy); //TODO:
    // emit(FilterTagsDoneState(bucket, AccountType.buy));
  }

  checkValidField(GlobalKey<FormState> key) {
    if (key.currentState?.validate() ?? false) {
      key.currentState!.save();
      emit(ValidFilterField());
    } else {
      emit(FilterFailureState(errorMessage: 'Invalid instagram id.'));
    }
  }
}
