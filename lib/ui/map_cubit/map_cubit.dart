import 'package:bloc/bloc.dart';
import 'package:deedee/model/user.dart';
import 'package:flutter/material.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final User user;

  MapCubit(this.user) : super(MapInitial());

  checkValidField(GlobalKey<FormState> key) {
    if (key.currentState?.validate() ?? false) {
      key.currentState!.save();
      emit(ValidMapField());
    } else {
      emit(MapFailureState(errorMessage: 'Invalid instagram id.'));
    }
  }
}
