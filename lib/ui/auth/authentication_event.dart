part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class LoginWithEmailAndPasswordEvent extends AuthenticationEvent {
  String email;
  String password;

  LoginWithEmailAndPasswordEvent({required this.email, required this.password});
}

class LoginWithBiometricEvent extends AuthenticationEvent {
  String email;
  String password;
  String localizedReason;
  String signInTitle;
  String cancelButton;

  LoginWithBiometricEvent(
      {required this.email,
      required this.password,
      required this.localizedReason,
      required this.signInTitle,
      required this.cancelButton});
}

class LoginWithFacebookEvent extends AuthenticationEvent {}

class LoginWithAppleEvent extends AuthenticationEvent {
  LoginWithAppleEvent();
}

class LoginWithPhoneNumberEvent extends AuthenticationEvent {
  auth.PhoneAuthCredential credential;
  String phoneNumber;
  String? firstName, lastName;
  File? image;

  LoginWithPhoneNumberEvent({
    required this.credential,
    required this.phoneNumber,
    this.firstName,
    this.lastName,
    this.image,
  });
}

class SignupWithEmailAndPasswordEvent extends AuthenticationEvent {
  String emailAddress;
  String password;
  File? image;
  String? firstName;
  String? lastName;

  SignupWithEmailAndPasswordEvent(
      {required this.emailAddress,
      required this.password,
      this.image,
      this.firstName = 'Anonymous',
      this.lastName = 'User'});
}

class LogoutEvent extends AuthenticationEvent {
  LogoutEvent();
}

class FinishedOnBoardingEvent extends AuthenticationEvent {}

class CheckFirstRunEvent extends AuthenticationEvent {}
