import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:deedee/services/helper.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  showSettings() =>
      emit(ShowSettings());

}
