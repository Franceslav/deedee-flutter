import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';
import '../biometric_prefs.dart';

part 'biometric_event.dart';
part 'biometric_state.dart';

class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  late LocalAuthentication auth;
  late bool biometric, canAuthenticateWithBiometrics;
  late String email, password;
  BiometricBloc() : super(BiometricInitial()) {
    on<ToggleBiometric>(_onToogleBiometric);
  }
  _onToogleBiometric(
    ToggleBiometric event,
    Emitter<BiometricState> emit,
  ) async {
    try {
      auth = LocalAuthentication();
      canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      biometric = event.biometric;
      if (canAuthenticateWithBiometrics) {
        BiometricPrefs().userBiometric = biometric;
        emit(BiometricOn(biometric: biometric));
      }
    } on PlatformException catch (error) {
      emit(BiometricFailure(error: error.toString()));
    }
  }
}
