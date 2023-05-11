import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:latlong2/latlong.dart';

import 'contact.dart';

enum AccountType {
  buy,
  sell,
}

enum EmailVerificationStatus {
  verified(0),
  unverified(1),
  sent(2);

  final int value;
  const EmailVerificationStatus(this.value);

  static EmailVerificationStatus fromInt(int value) {
    return EmailVerificationStatus.values.firstWhere((e) => e.value == value);
  }
}

enum DocVerificationStatus {
  verified(0),
  unverified(1),
  verificationRequestSent(2),
  verificationInProgress(3);

  final int value;
  const DocVerificationStatus(this.value);

  static DocVerificationStatus fromInt(int value) {
    return DocVerificationStatus.values.firstWhere((e) => e.value == value);
  }
}

enum PremiumStatus {
  isPremium(0),
  notPremium(1);

  final int value;
  const PremiumStatus(this.value);

  static PremiumStatus fromInt(int value) {
    return PremiumStatus.values.firstWhere((e) => e.value == value);
  }
}

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

class User extends Equatable {
  final String userId;
  final String email;
  final List<Contact>? contacts;
  final String firstName;
  final String lastName;
  final String? profilePictureURL;
  final EmailVerificationStatus emailVerification;
  final DocVerificationStatus docVerification;
  final PremiumStatus premiumStatus;
  final double balance;
  final int availableTags;
  AccountType accountType;
  final List<Location>? availablePlaces;
  final List<String>? savedFilters;
  LatLng? lastUserGeoLocation;

  static User empty = User(
    lastUserGeoLocation: LatLng(0, 0),
    userId: '',
    email: '',
    firstName: '',
    lastName: '',
  );

  LatLng get lastGeoLocation => lastUserGeoLocation!;

  set lastGeoLocation(LatLng lastGeoLocation) =>
      lastUserGeoLocation = lastGeoLocation;

  String fullName() => '$firstName $lastName';

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  User({
    this.lastUserGeoLocation,
    required this.userId,
    required this.email,
    this.contacts,
    required this.firstName,
    required this.lastName,
    this.profilePictureURL,
    this.emailVerification = EmailVerificationStatus.unverified,
    this.docVerification = DocVerificationStatus.unverified,
    this.premiumStatus = PremiumStatus.notPremium,
    this.balance = 0.0,
    this.availableTags = 3,
    this.accountType = AccountType.buy,
    this.availablePlaces,
    this.savedFilters,
  });

  factory User.fromJson(
    Map<String, dynamic> parsedJson,
  ) {
    return User(
      lastUserGeoLocation: LatLng(0, 0),
      userId: parsedJson['userId'] ?? '',
      email: parsedJson['email'] ?? '',
      firstName: parsedJson['firstName'] ?? '',
      lastName: parsedJson['lastName'] ?? '',
      profilePictureURL: parsedJson['profilePictureURL'] ?? '',
      balance: parsedJson['balance'] ?? 0.0,
      availableTags: parsedJson['availableTags'] ?? 0,
      availablePlaces: null,
      savedFilters: null,
      emailVerification:
          EmailVerificationStatus.fromInt(parsedJson['emailVerification'] ?? 1),
      docVerification:
          DocVerificationStatus.fromInt(parsedJson['docVerification'] ?? 1),
      premiumStatus: PremiumStatus.fromInt(parsedJson['premiumStatus'] ?? 1),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'profilePictureURL': profilePictureURL,
      'emailVerification': emailVerification.value,
      'docVerification': docVerification.value,
      'premiumStatus': premiumStatus.value,
      'balance': balance,
      'availableTags': availableTags,
      'lastLat': lastGeoLocation.latitude,
      'lastLon': lastGeoLocation.longitude,
    };
  }

  User copyWith({
    String? profilePictureURL,
    EmailVerificationStatus? emailVerification,
    DocVerificationStatus? docVerification,
    PremiumStatus? premiumStatus,
    double? balance,
    int? availableTags,
    AccountType? accountType,
    LatLng? lastGeoLocation,
    List<Location>? availablePlaces,
    List<String>? savedFilters,
    List<Contact>? contacts,
  }) {
    return User(
      lastUserGeoLocation: lastGeoLocation ?? this.lastGeoLocation,
      userId: userId,
      email: email,
      firstName: firstName,
      lastName: lastName,
      profilePictureURL: profilePictureURL ?? this.profilePictureURL,
      emailVerification: emailVerification ?? this.emailVerification,
      docVerification: docVerification ?? this.docVerification,
      premiumStatus: premiumStatus ?? this.premiumStatus,
      balance: balance ?? this.balance,
      availableTags: availableTags ?? this.availableTags,
      accountType: accountType ?? this.accountType,
      availablePlaces: availablePlaces ?? this.availablePlaces,
      savedFilters: savedFilters,
      contacts: contacts ?? this.contacts,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        email,
        firstName,
        lastName,
        profilePictureURL,
        emailVerification,
        docVerification,
        premiumStatus,
        balance,
        availableTags,
        accountType,
        availablePlaces,
        savedFilters,
      ];
}
