import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:deedee/generated/VerificationService.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:latlong2/latlong.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(User.empty)) {
    on<UserAuthenticated>(_onUserAuthenticated);
    on<UserGetBalance>(_onUserGetBalance);
    on<UserSwitchAccountType>(_onUserSwitchAccountType);
    on<UserTogglePremium>(_onUserTogglePremium);
    on<UserEmailVerification>(_onUserEmailVerification);
    on<UserDocVerification>(_onUserDocVerification);
    on<UserSetLastGeolocation>(_onUserSetLastGeolocation);
  }

  _onUserAuthenticated(UserAuthenticated event, Emitter<UserState> emit) {
    emit(UserState(event.user));
  }

  _onUserGetBalance(UserGetBalance event, Emitter<UserState> emit) async {
    try {
      final balance =
          await locator.get<GRCPUtils>().getUserBalance(state.user.userId);
      emit(UserState(state.user.copyWith(balance: balance)));
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserSwitchAccountType(
      UserSwitchAccountType event, Emitter<UserState> emit) {
    emit(UserState(state.user.copyWith(accountType: event.accountType)));
  }

  _onUserTogglePremium(UserTogglePremium event, Emitter<UserState> emit) async {
    emit(
        UserState(state.user.copyWith(premiumStatus: PremiumStatus.isPremium)));

    try {
      final response = await locator
          .get<GRCPUtils>()
          .toggleUserPremiumStatus(state.user.userId);

      if (response) {}
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserEmailVerification(
      UserEmailVerification event, Emitter<UserState> emit) async {
    emit(UserState(state.user
        .copyWith(emailVerification: EmailVerificationStatus.verified)));
    try {
      final response =
          await locator.get<GRCPUtils>().verifyUserEmail(state.user.email);
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserDocVerification(UserDocVerification event, Emitter<UserState> emit) async {
    try {
      emit(UserState(state.user
          .copyWith(docVerification: DocVerificationStatus.verified)));
      final response =
          await locator.get<GRCPUtils>().verifyUserIdentity(event.files);
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserSetLastGeolocation(
      UserSetLastGeolocation event, Emitter<UserState> emit) {
    emit(UserState(state.user.copyWith(lastGeolocation: event.location)));
  }
}
