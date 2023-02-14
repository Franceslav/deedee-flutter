part of 'user_bloc.dart';

abstract class UserEvent {}

class UserAuthenticated extends UserEvent {
  final User user;

  UserAuthenticated(this.user);
}

class UserGetBalance extends UserEvent {}

class UserSwitchAccountType extends UserEvent {
  final AccountType accountType;

  UserSwitchAccountType(this.accountType);
}

class UserSetLastGeolocation extends UserEvent {
  final LatLng location;

  UserSetLastGeolocation(this.location);
}

class UserTogglePremium extends UserEvent {}

class UserVerify extends UserEvent {}
