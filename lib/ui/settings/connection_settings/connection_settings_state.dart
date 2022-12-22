part of 'connection_settings_cubit.dart';

abstract class ConnectionSettingsState {}

class ConnectionSettingsInitial extends ConnectionSettingsState {}

class ValidConnectionSettingsField extends ConnectionSettingsState {
  String ipAddress;
  String port;

  ValidConnectionSettingsField(this.ipAddress, this.port);
}

class ConnectionSettingsFailureState extends ConnectionSettingsState {
  String errorMessage;

  ConnectionSettingsFailureState({required this.errorMessage});
}

class ConnectionSettingsDone extends ConnectionSettingsState {}

