import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:latlong2/latlong.dart';
import '../generated/LocationService.pb.dart';
import 'contact.dart';

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

enum ContactType {
  email,
  phone,
  instagram,
  telegram,
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
  final Map<ContactType, Contact>? contacts;
  final String firstName;
  final String lastName;
  final String? profilePictureURL;
  final EmailVerificationStatus emailVerification;
  final DocVerificationStatus docVerification;
  final PremiumStatus premiumStatus;
  final double balance;
  final int availableTags;
  final AccountType accountType;
  final List<Place>? availablePlaces;
  final List<String>? savedFilters;

  LatLng lastUserGeoLocation;

  static User empty = User(
    LatLng(0, 0),
    userId: '',
    email: '',
    firstName: '',
    lastName: '',
  );

  LatLng get lastGeoLocation => lastUserGeoLocation;

  set lastGeoLocation(LatLng lastGeoLocation) =>
      lastUserGeoLocation = lastGeoLocation;

  String fullName() => '$firstName $lastName';

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  User(
    this.lastUserGeoLocation, {
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

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      LatLng(0, 0),
      userId: parsedJson['userId'] ?? '',
      email: parsedJson['email'] ?? '',
      firstName: parsedJson['firstName'] ?? '',
      lastName: parsedJson['lastName'] ?? '',
      profilePictureURL: parsedJson['profilePictureURL'] ?? '',
      balance: parsedJson['balance'] ?? 0.0,
      availableTags: parsedJson['availableTags'] ?? 0,
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
      'lastLat': lastGeoLocation.latitude ?? 0.0,
      'lastLon': lastGeoLocation.longitude ?? 0.0,
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
    Map<ContactType, Contact>? contacts,
  }) {
    return User(
      lastGeoLocation,
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
      availablePlaces: availablePlaces,
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
