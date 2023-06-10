
import 'package:app_settings/app_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';
import '../biometric_prefs.dart';

part 'biometric_event.dart';
part 'biometric_state.dart';

class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  late LocalAuthentication auth;
  late List<BiometricType> availableBiometrics;
  late bool biometric, canAuthenticateWithBiometrics;
  late String email, password;
  int tries = BiometricPrefs().userBiometricTries;
  BiometricBloc() : super(BiometricInitial()) {
    on<ToggleBiometric>(_onToogleBiometric);
    on<BiometricTriesEvent>(_onBiometricTries);
  }
  _onToogleBiometric(
    ToggleBiometric event,
    Emitter<BiometricState> emit,
  ) async {
    try {
      auth = LocalAuthentication();
      canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      availableBiometrics = await auth.getAvailableBiometrics();
      biometric = event.biometric;
      if (canAuthenticateWithBiometrics) {
        BiometricPrefs().userBiometric = biometric;
        emit(BiometricOn(biometric: biometric));
      }
      if (availableBiometrics.isEmpty) {
        AppSettings.openSecuritySettings();
      }
    } on PlatformException catch (error) {
      emit(BiometricFailure(error: error.toString()));
    }
  }

  _onBiometricTries(
      BiometricTriesEvent event, Emitter<BiometricState> emit) async {
    try {
      if (tries < 0) {
        emit(BiometricTriesExceededState());
        BiometricPrefs().userBiometricTries = 1;
      } else {
        BiometricPrefs().userBiometricTries -= 1;
        emit(BiometricTriesExceededState());
      }
    } catch (error) {
      emit(BiometricFailure(error: error.toString()));
    }
  }
}
