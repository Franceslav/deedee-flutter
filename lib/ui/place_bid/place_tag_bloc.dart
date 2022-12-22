import 'package:bloc/bloc.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/locator.dart';
import 'package:flutter/material.dart';

part 'place_tag_event.dart';

part 'place_tag_state.dart';

class PlaceTagBloc extends Bloc<PlaceTagEvent, PlaceTagState> {
  final User user;

  PlaceTagBloc(this.user) : super(PlaceTagInitial()) {
    on<PlaceTagActionEvent>((event, emit) async {
      await serviceLocator.get<GRCPUtils>().placeTag(
          user.accountType,
          event.topic,
          event.messengerId,
          event.lat,
          event.lon,
          {
            for (final key in event.predefinedFilterActiveMap.keys)
              if (event.predefinedFilterActiveMap[key]!)
                key: event.predefinedFilterActiveMap[key]
          }.keys.toList());
      emit(PlaceTagDone());
    });

    on<PlaceTagFilterChangeEvent>((event, emit) async {
      emit(PlaceTagFilterChangeState(
          event.predefinedPlaceTagActiveMap, event.accountType));
    });
  }

  checkValidField(GlobalKey<FormState> key) {
    if (key.currentState?.validate() ?? false) {
      key.currentState!.save();
      emit(ValidPlaceTagField());
    } else {
      emit(PlaceTagFailureState(errorMessage: 'Invalid instagram id.'));
    }
  }
}
