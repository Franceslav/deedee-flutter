import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:latlong2/latlong.dart';

enum AccountType { buy, sell }

extension AccountTypeExtension on AccountType {
  String stringType(BuildContext context) {
    switch (this) {
      case AccountType.buy:
        return AppLocalizations.of(context)!.accountTypeBuyTitle;
      case AccountType.sell:
        return AppLocalizations.of(context)!.accountTypeSellTitle;
    }
  }

  String switchAccountStringType(BuildContext context) {
    switch (this) {
      case AccountType.buy:
        return AppLocalizations.of(context)!.accountTypeSellTitle;
      case AccountType.sell:
        return AppLocalizations.of(context)!.accountTypeBuyTitle;
    }
  }
}

class User {
  String email;

  String firstName;

  String lastName;

  String userID;

  String profilePictureURL;

  String appIdentifier;

  late LatLng lastGeoLocation;

  late String selectedTopic;

  AccountType accountType = AccountType.buy;

  User(
      {this.email = '',
      this.firstName = '',
      this.lastName = '',
      this.userID = '',
      this.profilePictureURL = ''})
      : appIdentifier = 'DeeDee for ${Platform.operatingSystem}';

  String fullName() => '$firstName $lastName';

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        email: parsedJson['email'] ?? '',
        firstName: parsedJson['firstName'] ?? '',
        lastName: parsedJson['lastName'] ?? '',
        userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
        profilePictureURL: parsedJson['profilePictureURL'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'id': userID,
      'profilePictureURL': profilePictureURL,
      'appIdentifier': appIdentifier
    };
  }
}
