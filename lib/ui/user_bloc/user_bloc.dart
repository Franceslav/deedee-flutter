import 'package:bloc/bloc.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/locator.dart';
import 'package:latlong2/latlong.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(User.empty)) {
    on<UserAuthenticated>(_onUserAuthenticated);
    on<UserGetBalance>(_onUserGetBalance);
    on<UserSwitchAccountType>(_onUserSwitchAccountType);
    on<UserTogglePremium>(_onUserTogglePremium);
    on<UserVerify>(_onUserVerify);
    on<UserSetLastGeolocation>(_onUserSetLastGeolocation);
  }

  _onUserAuthenticated(UserAuthenticated event, Emitter<UserState> emit) {
    emit(UserState(event.user));
  }

  _onUserGetBalance(UserGetBalance event, Emitter<UserState> emit) async {
    try {
      final balance = await serviceLocator
          .get<GRCPUtils>()
          .getUserBalance(state.user.userId);
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
    try {
      final response = await serviceLocator
          .get<GRCPUtils>()
          .toggleUserPremiumStatus(state.user.userId);
      if (response) {
        emit(UserState(state.user.copyWith(isPremium: true)));
      }
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserVerify(UserVerify event, Emitter<UserState> emit) {
    try {
      //depends on verification system
      emit(UserState(state.user.copyWith(isVerified: true)));
    } catch (error) {
      print(error.toString());
    }
  }

  _onUserSetLastGeolocation(
      UserSetLastGeolocation event, Emitter<UserState> emit) {
    emit(UserState(state.user.copyWith(lastGeolocation: event.location)));
  }
}
