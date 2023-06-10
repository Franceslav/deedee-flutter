// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'biometric_bloc.dart';

@immutable
abstract class BiometricState {}

class BiometricInitial extends BiometricState {}

class BiometricOn extends BiometricState {
  final bool biometric;
  BiometricOn({
    required this.biometric,
  });
}

class BiometricFailure extends BiometricState {
  final String error;
  BiometricFailure({
    required this.error,
  });
}

class BiometricTriesExceededState extends BiometricState {
  BiometricTriesExceededState();
}