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

class UserCreateVerification extends UserEvent {
  final Verification verification;
  UserCreateVerification(this.verification);
}

class UserDocVerification extends UserEvent {
  //FileChunk files;
  UserDocVerification();
}

class UserImagePicker extends UserEvent {
  final ImageSource type;
  UserImagePicker(this.type);
}

class UserAvailablePlaces extends UserEvent {}

class AddUserContact extends UserEvent {
  final Contact contact;

  AddUserContact(this.contact);
}

class UserGetGPSPosition extends UserEvent {}