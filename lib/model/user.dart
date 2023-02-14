import 'package:equatable/equatable.dart';
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

class User extends Equatable {
  final String userId;
  final String email;
  final String firstName;
  final String lastName;
  final String? profilePictureURL;
  final bool isVerified;
  final bool isPremium;
  final double balance;
  final int availableTags;
  final AccountType accountType;
  final LatLng? lastGeoLocation;

  // final String? appIdentifier;

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
    this.isVerified = false,
    this.isPremium = false,
    this.balance = 0.0,
    this.availableTags = 3,
    this.accountType = AccountType.buy,
    this.lastGeoLocation,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      userId: parsedJson['userId'] ?? '',
      email: parsedJson['email'] ?? '',
      firstName: parsedJson['firstName'] ?? '',
      lastName: parsedJson['lastName'] ?? '',
      profilePictureURL: parsedJson['profilePictureURL'] ?? '',
      isVerified: parsedJson['isVerified'] ?? false,
      isPremium: parsedJson['isPremium'] ?? false,
      balance: parsedJson['balance'] ?? 0.0,
      availableTags: parsedJson['availableTags'] ?? 0,
      lastGeoLocation: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'profilePictureURL': profilePictureURL,
      'isVerified': isVerified,
      'isPremium': isPremium,
      'balance': balance,
      'availableTags': availableTags,
      'lastLat': lastGeoLocation?.latitude ?? 0.0,
      'lastLon': lastGeoLocation?.longitude ?? 0.0,
    };
  }

  User copyWith({
    String? profilePictureURL,
    bool? isVerified,
    bool? isPremium,
    double? balance,
    int? availableTags,
    AccountType? accountType,
    LatLng? lastGeolocation,
  }) {
    return User(
      userId: userId,
      email: email,
      firstName: firstName,
      lastName: lastName,
      profilePictureURL: profilePictureURL ?? this.profilePictureURL,
      isVerified: isVerified ?? this.isVerified,
      isPremium: isPremium ?? this.isPremium,
      balance: balance ?? this.balance,
      availableTags: availableTags ?? this.availableTags,
      accountType: accountType ?? this.accountType,
      lastGeoLocation: lastGeoLocation,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        email,
        firstName,
        lastName,
        profilePictureURL,
        isVerified,
        isPremium,
        balance,
        availableTags,
        accountType,
      ];
}
