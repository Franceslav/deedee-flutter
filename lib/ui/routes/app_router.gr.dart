// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;
import 'package:latlong2/latlong.dart' as _i22;

import '../../model/user.dart' as _i23;
import '../account/account_screen.dart' as _i9;
import '../account/account_verify_screen.dart' as _i10;
import '../auth/launcherScreen/launcher_screen.dart' as _i1;
import '../auth/login/login_screen.dart' as _i17;
import '../auth/onBoarding/on_boarding_screen.dart' as _i2;
import '../auth/resetPasswordScreen/reset_password_screen.dart' as _i19;
import '../auth/signUp/sign_up_screen.dart' as _i18;
import '../auth/welcome/welcome_screen.dart' as _i3;
import '../bookmarks/bookmarks_screen.dart' as _i12;
import '../filter/filter_screen.dart' as _i6;
import '../help/help_screen.dart' as _i16;
import '../home/home_screen.dart' as _i4;
import '../map_cubit/map_screen.dart' as _i7;
import '../place_tag/map_set_location_screen.dart' as _i8;
import '../place_tag/place_tag_screen.dart' as _i5;
import '../referral/referral_screen.dart' as _i13;
import '../settings/connection_settings/connection_settings_screen.dart'
    as _i15;
import '../settings/settings_screen.dart' as _i14;
import '../top_up/top_up_screen.dart' as _i11;

class AppRouter extends _i20.RootStackRouter {
  AppRouter([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    LauncherScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LauncherScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnBoardingScreen(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    PlaceTagScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PlaceTagScreen(),
      );
    },
    FilterPageRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FilterPage(),
      );
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.MapScreen(
          key: args.key,
          tagDescriptionMap: args.tagDescriptionMap,
          user: args.user,
        ),
      );
    },
    MapSetLocationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapSetLocationScreenRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.MapSetLocationScreen(
          key: args.key,
          userLocation: args.userLocation,
        ),
      );
    },
    AccountScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AccountScreen(),
      );
    },
    VerifyScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.VerifyScreen(),
      );
    },
    TopUpPageRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.TopUpPage(),
      );
    },
    BookmarksScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.BookmarksScreen(),
      );
    },
    ReferralScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ReferralScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.SettingsScreen(),
      );
    },
    ConnectionSettingsScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.ConnectionSettingsScreen(),
      );
    },
    HelpScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.HelpScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.SignUpScreen(),
      );
    },
    ResetPasswordScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.ResetPasswordScreen(),
      );
    },
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig(
          LauncherScreenRoute.name,
          path: '/',
        ),
        _i20.RouteConfig(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        ),
        _i20.RouteConfig(
          WelcomeScreenRoute.name,
          path: '/welcome',
        ),
        _i20.RouteConfig(
          HomeScreenRoute.name,
          path: '/main',
        ),
        _i20.RouteConfig(
          PlaceTagScreenRoute.name,
          path: '/place-tag',
        ),
        _i20.RouteConfig(
          FilterPageRoute.name,
          path: '/filter',
        ),
        _i20.RouteConfig(
          MapScreenRoute.name,
          path: '/map',
        ),
        _i20.RouteConfig(
          MapSetLocationScreenRoute.name,
          path: '/map-set-location',
        ),
        _i20.RouteConfig(
          AccountScreenRoute.name,
          path: '/account',
        ),
        _i20.RouteConfig(
          VerifyScreenRoute.name,
          path: '/verify',
        ),
        _i20.RouteConfig(
          TopUpPageRoute.name,
          path: '/account/top-up',
        ),
        _i20.RouteConfig(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        ),
        _i20.RouteConfig(
          ReferralScreenRoute.name,
          path: '/referral',
        ),
        _i20.RouteConfig(
          SettingsScreenRoute.name,
          path: '/settings',
        ),
        _i20.RouteConfig(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        ),
        _i20.RouteConfig(
          HelpScreenRoute.name,
          path: '/help',
        ),
        _i20.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i20.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up',
        ),
        _i20.RouteConfig(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        ),
      ];
}

/// generated route for
/// [_i1.LauncherScreen]
class LauncherScreenRoute extends _i20.PageRouteInfo<void> {
  const LauncherScreenRoute()
      : super(
          LauncherScreenRoute.name,
          path: '/',
        );

  static const String name = 'LauncherScreenRoute';
}

/// generated route for
/// [_i2.OnBoardingScreen]
class OnBoardingScreenRoute extends _i20.PageRouteInfo<void> {
  const OnBoardingScreenRoute()
      : super(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        );

  static const String name = 'OnBoardingScreenRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeScreenRoute extends _i20.PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(
          WelcomeScreenRoute.name,
          path: '/welcome',
        );

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i20.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/main',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i5.PlaceTagScreen]
class PlaceTagScreenRoute extends _i20.PageRouteInfo<void> {
  const PlaceTagScreenRoute()
      : super(
          PlaceTagScreenRoute.name,
          path: '/place-tag',
        );

  static const String name = 'PlaceTagScreenRoute';
}

/// generated route for
/// [_i6.FilterPage]
class FilterPageRoute extends _i20.PageRouteInfo<void> {
  const FilterPageRoute()
      : super(
          FilterPageRoute.name,
          path: '/filter',
        );

  static const String name = 'FilterPageRoute';
}

/// generated route for
/// [_i7.MapScreen]
class MapScreenRoute extends _i20.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute({
    _i21.Key? key,
    required Map<_i22.LatLng, String> tagDescriptionMap,
    required _i23.User user,
  }) : super(
          MapScreenRoute.name,
          path: '/map',
          args: MapScreenRouteArgs(
            key: key,
            tagDescriptionMap: tagDescriptionMap,
            user: user,
          ),
        );

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({
    this.key,
    required this.tagDescriptionMap,
    required this.user,
  });

  final _i21.Key? key;

  final Map<_i22.LatLng, String> tagDescriptionMap;

  final _i23.User user;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, tagDescriptionMap: $tagDescriptionMap, user: $user}';
  }
}

/// generated route for
/// [_i8.MapSetLocationScreen]
class MapSetLocationScreenRoute
    extends _i20.PageRouteInfo<MapSetLocationScreenRouteArgs> {
  MapSetLocationScreenRoute({
    _i21.Key? key,
    required _i22.LatLng userLocation,
  }) : super(
          MapSetLocationScreenRoute.name,
          path: '/map-set-location',
          args: MapSetLocationScreenRouteArgs(
            key: key,
            userLocation: userLocation,
          ),
        );

  static const String name = 'MapSetLocationScreenRoute';
}

class MapSetLocationScreenRouteArgs {
  const MapSetLocationScreenRouteArgs({
    this.key,
    required this.userLocation,
  });

  final _i21.Key? key;

  final _i22.LatLng userLocation;

  @override
  String toString() {
    return 'MapSetLocationScreenRouteArgs{key: $key, userLocation: $userLocation}';
  }
}

/// generated route for
/// [_i9.AccountScreen]
class AccountScreenRoute extends _i20.PageRouteInfo<void> {
  const AccountScreenRoute()
      : super(
          AccountScreenRoute.name,
          path: '/account',
        );

  static const String name = 'AccountScreenRoute';
}

/// generated route for
/// [_i10.VerifyScreen]
class VerifyScreenRoute extends _i20.PageRouteInfo<void> {
  const VerifyScreenRoute()
      : super(
          VerifyScreenRoute.name,
          path: '/verify',
        );

  static const String name = 'VerifyScreenRoute';
}

/// generated route for
/// [_i11.TopUpPage]
class TopUpPageRoute extends _i20.PageRouteInfo<void> {
  const TopUpPageRoute()
      : super(
          TopUpPageRoute.name,
          path: '/account/top-up',
        );

  static const String name = 'TopUpPageRoute';
}

/// generated route for
/// [_i12.BookmarksScreen]
class BookmarksScreenRoute extends _i20.PageRouteInfo<void> {
  const BookmarksScreenRoute()
      : super(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        );

  static const String name = 'BookmarksScreenRoute';
}

/// generated route for
/// [_i13.ReferralScreen]
class ReferralScreenRoute extends _i20.PageRouteInfo<void> {
  const ReferralScreenRoute()
      : super(
          ReferralScreenRoute.name,
          path: '/referral',
        );

  static const String name = 'ReferralScreenRoute';
}

/// generated route for
/// [_i14.SettingsScreen]
class SettingsScreenRoute extends _i20.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i15.ConnectionSettingsScreen]
class ConnectionSettingsScreenRoute extends _i20.PageRouteInfo<void> {
  const ConnectionSettingsScreenRoute()
      : super(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        );

  static const String name = 'ConnectionSettingsScreenRoute';
}

/// generated route for
/// [_i16.HelpScreen]
class HelpScreenRoute extends _i20.PageRouteInfo<void> {
  const HelpScreenRoute()
      : super(
          HelpScreenRoute.name,
          path: '/help',
        );

  static const String name = 'HelpScreenRoute';
}

/// generated route for
/// [_i17.LoginScreen]
class LoginScreenRoute extends _i20.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i18.SignUpScreen]
class SignUpScreenRoute extends _i20.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i19.ResetPasswordScreen]
class ResetPasswordScreenRoute extends _i20.PageRouteInfo<void> {
  const ResetPasswordScreenRoute()
      : super(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        );

  static const String name = 'ResetPasswordScreenRoute';
}
