import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'connection_settings_state.dart';

class ConnectionSettingsCubit extends Cubit<ConnectionSettingsState> {
  ConnectionSettingsCubit() : super(ConnectionSettingsInitial());

  checkValidField(GlobalKey<FormState> key, String ipAddress, String port) {
    if (key.currentState?.validate() ?? false) {
      key.currentState!.save();
      emit(ValidConnectionSettingsField(ipAddress, port));
    } else {
      emit(ConnectionSettingsFailureState(
          errorMessage: 'Invalid instagram id.'));
    }
  }
}
