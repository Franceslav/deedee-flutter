import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:latlong2/latlong.dart';
import '../generated/LocationService.pb.dart';

enum AccountType { buy, sell }

enum EmailVerificationStatus {
  verified,
  unverified,
  sent,
}

enum DocVerificationStatus {
  verified,
  unverified,
  verificationRequestSent,
  verificationInProgress,
}

enum PremiumStatus {
  isPremium,
  notPremium,
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
  final String firstName;
  final String lastName;
  final String? profilePictureURL;
  final EmailVerificationStatus emailVerification;
  final DocVerificationStatus docVerification;
  final PremiumStatus premiumStatus;
  final double balance;
  final int availableTags;
  final AccountType accountType;
  final LatLng? lastGeoLocation;
  final List<Place>? availablePlaces;
  final List<String>? savedFilters;

  static const empty = User(
    userId: '',
    email: '',
    firstName: '',
    lastName: '',
  );

  String fullName() => '$firstName $lastName';

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  const User({
    required this.userId,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.profilePictureURL,
    this.emailVerification = EmailVerificationStatus.unverified,
    this.docVerification = DocVerificationStatus.unverified,
    this.premiumStatus = PremiumStatus.notPremium,
    this.balance = 0.0,
    this.availableTags = 3,
    this.accountType = AccountType.buy,
    this.lastGeoLocation,
    this.availablePlaces,
    this.savedFilters,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      userId: parsedJson['userId'] ?? '',
      email: parsedJson['email'] ?? '',
      firstName: parsedJson['firstName'] ?? '',
      lastName: parsedJson['lastName'] ?? '',
      profilePictureURL: parsedJson['profilePictureURL'] ?? '',
      balance: parsedJson['balance'] ?? 0.0,
      availableTags: parsedJson['availableTags'] ?? 0,
      lastGeoLocation: null,
      availablePlaces: null,
      savedFilters: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'profilePictureURL': profilePictureURL,
      'emailVerification': emailVerification,
      'docVerification': docVerification,
      'premiumStatus': premiumStatus,
      'balance': balance,
      'availableTags': availableTags,
      'lastLat': lastGeoLocation?.latitude ?? 0.0,
      'lastLon': lastGeoLocation?.longitude ?? 0.0,
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
    LatLng? lastGeolocation,
    List<Place>? availablePlaces,
    List<String>? savedFilters,
  }) {
    return User(
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
      lastGeoLocation: lastGeoLocation,
      availablePlaces: availablePlaces,
      savedFilters: savedFilters,
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
