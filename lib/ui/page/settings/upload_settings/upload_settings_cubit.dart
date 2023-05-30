import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'upload_settings_state.dart';

class UploadSettingsCubit extends Cubit<UploadSettingsState> {
  UploadSettingsCubit() : super(UploadSettingsInitial());

  checkValidField(GlobalKey<FormState> key, String ipAddress, String port) {
    if (key.currentState?.validate() ?? false) {
      key.currentState!.save();
      emit(ValidUploadSettingsField(ipAddress, port));
    } else {
      emit(UploadSettingsFailureState(
          errorMessage: 'Invalid instagram id.'));
    }
  }
}
