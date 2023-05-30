part of 'upload_settings_cubit.dart';

abstract class UploadSettingsState {}

class UploadSettingsInitial extends UploadSettingsState {}

class ValidUploadSettingsField extends UploadSettingsState {
  String host;
  String port;

  ValidUploadSettingsField(this.host, this.port);
}

class UploadSettingsFailureState extends UploadSettingsState {
  String errorMessage;

  UploadSettingsFailureState({required this.errorMessage});
}

class UploadSettingsDone extends UploadSettingsState {}

