import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/verification.pb.dart';
import 'package:deedee/generated/deedee/api/service/verification_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/authenticate.dart';
import 'package:deedee/services/fake/api/tag_service_api.dart';
import 'package:deedee/ui/auth/biometric/biometric_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/types/auth_messages_ios.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  User? user;
  late SharedPreferences prefs;
  late bool finishedOnBoarding, authenticated;
  late LocalAuthentication authLocal;
  late String userEmail, userPassword;
  bool biometric = BiometricPrefs().userBiometric;

  AuthenticationBloc({this.user})
      : super(const AuthenticationState.unauthenticated()) {
    on<CheckFirstRunEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      finishedOnBoarding = prefs.getBool(FINISHED_ON_BOARDING) ?? false;
      if (!finishedOnBoarding) {
        emit(const AuthenticationState.onboarding());
      } else {
        user = await FireStoreUtils.getAuthUser();
        if (user == null) {
          emit(const AuthenticationState.unauthenticated());
        } else {
          emit(AuthenticationState.authenticated(user!));
          locator.get<TagServiceApi>().setUserEmail(user!.email);
        }
      }
    });
    on<FinishedOnBoardingEvent>((event, emit) async {
      await prefs.setBool(FINISHED_ON_BOARDING, true);
      emit(const AuthenticationState.unauthenticated());
    });
    on<LoginWithEmailAndPasswordEvent>((event, emit) async {
      if (true /*GRCPUtils.verifyAuthCode(SHAUtils.generateShaHash(SHA_PHRASE))*/) {
        // TODO: extract check
        dynamic result = await FireStoreUtils.loginWithEmailAndPassword(
            event.email, event.password);
        if (result != null && result is User) {
          user = result;
          BiometricPrefs().userEmail = event.email;
          BiometricPrefs().userPassword = event.password;
          emit(AuthenticationState.authenticated(user!));
        } else if (result != null && result is String) {
          emit(AuthenticationState.unauthenticated(message: result));
        } else {
          emit(const AuthenticationState.unauthenticated(
              message: 'Login failed, Please try again.'));
        }
      }
    });
    /*
    on<LoginWithFacebookEvent>((event, emit) async {
      dynamic result = await FireStoreUtils.loginWithFacebook();
      if (result != null && result is User) {
        user = result;
        //Optional: adding a checking method for new users on backend
        locator.get<GRCPUtils>().sendVerificationEmail(user!.email);
        emit(AuthenticationState.authenticated(user!));
      } else if (result != null && result is String) {
        emit(AuthenticationState.unauthenticated(message: result));
      } else {
        emit(const AuthenticationState.unauthenticated(
            message: 'Facebook login failed, Please try again.'));
      }
    });
    */
    on<LoginWithBiometricEvent>((event, emit) async {
      if (biometric) {
        try {
          authLocal = LocalAuthentication();
          authenticated = await authLocal.authenticate(
              localizedReason: event.localizedReason,
              options: const AuthenticationOptions(
                stickyAuth: true,
              ),
              authMessages: [
                AndroidAuthMessages(
                  signInTitle: event.signInTitle,
                  cancelButton: event.cancelButton,
                ),
                IOSAuthMessages(
                  cancelButton: event.cancelButton,
                ),
              ]);
          if (authenticated) {
            userEmail = BiometricPrefs().userEmail;
            userPassword = BiometricPrefs().userPassword;
            dynamic result = await FireStoreUtils.loginWithEmailAndPassword(
                userEmail, userPassword);
            if (result != null && result is User) {
              user = result;
              emit(AuthenticationState.authenticated(user!));
            } else if (result != null && result is String) {
              emit(AuthenticationState.unauthenticated(message: result));
            } else {
              emit(const AuthenticationState.unauthenticated(
                  message: 'Login failed, Please try again.'));
            }
          }
        } on PlatformException catch (error) {
          emit(AuthenticationState.unauthenticated(message: error.toString()));
        }
      }
    });

    on<LoginWithAppleEvent>((event, emit) async {
      dynamic result = await FireStoreUtils.loginWithApple();
      if (result != null && result is User) {
        user = result;
        //Optional: adding a checking method for new users on backend
        locator
            .get<VerificationServiceClient>()
            .createVerification(VerificationRequest(
              verification: Verification(status: Verification_Status.SENT),
            ));
        emit(AuthenticationState.authenticated(user!));
      } else if (result != null && result is String) {
        emit(AuthenticationState.unauthenticated(message: result));
      } else {
        emit(const AuthenticationState.unauthenticated(
            message: 'Apple login failed, Please try again.'));
      }
    });

    on<LoginWithPhoneNumberEvent>((event, emit) async {
      dynamic result =
          await FireStoreUtils.loginOrCreateUserWithPhoneNumberCredential(
              credential: event.credential,
              phoneNumber: event.phoneNumber,
              firstName: event.firstName,
              lastName: event.lastName,
              image: event.image);
      if (result is User) {
        user = result;
        emit(AuthenticationState.authenticated(result));
      } else if (result is String) {
        emit(AuthenticationState.unauthenticated(message: result));
      }
    });
    on<SignupWithEmailAndPasswordEvent>((event, emit) async {
      dynamic result = await FireStoreUtils.signUpWithEmailAndPassword(
          emailAddress: event.emailAddress,
          password: event.password,
          image: event.image,
          firstName: event.firstName,
          lastName: event.lastName);
      if (result != null && result is User) {
        user = result;
        locator
            .get<VerificationServiceClient>()
            .createVerification(VerificationRequest(
              verification: Verification(status: Verification_Status.SENT),
            ));
        BiometricPrefs().userEmail = event.emailAddress;
        BiometricPrefs().userPassword = event.password;
        emit(AuthenticationState.authenticated(user!));
      } else if (result != null && result is String) {
        emit(AuthenticationState.unauthenticated(message: result));
      } else {
        emit(const AuthenticationState.unauthenticated(
            message: 'Couldn\'t sign up'));
      }
    });
    on<LogoutEvent>((event, emit) async {
      await FireStoreUtils.logout();
      user = null;
      emit(const AuthenticationState.unauthenticated());
    });
  }
}
