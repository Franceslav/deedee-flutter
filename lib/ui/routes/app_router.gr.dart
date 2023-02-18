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
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:latlong2/latlong.dart' as _i23;

import '../../model/user.dart' as _i24;
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
import '../main_topic/enum/topic_screens_enum.dart' as _i25;
import '../main_topic/main_topic_screen.dart' as _i20;
import '../map_cubit/map_screen.dart' as _i7;
import '../place_tag/map_set_location_screen.dart' as _i8;
import '../place_tag/place_tag_screen.dart' as _i5;
import '../referral/referral_screen.dart' as _i13;
import '../settings/connection_settings/connection_settings_screen.dart'
    as _i15;
import '../settings/settings_screen.dart' as _i14;
import '../top_up/top_up_screen.dart' as _i11;

class AppRouter extends _i21.RootStackRouter {
  AppRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    LauncherScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LauncherScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnBoardingScreen(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    PlaceTagScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PlaceTagScreen(),
      );
    },
    FilterPageRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FilterPage(),
      );
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i21.MaterialPageX<dynamic>(
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
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.MapSetLocationScreen(
          key: args.key,
          userLocation: args.userLocation,
        ),
      );
    },
    AccountScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AccountScreen(),
      );
    },
    VerifyScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.VerifyScreen(),
      );
    },
    TopUpPageRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.TopUpPage(),
      );
    },
    BookmarksScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.BookmarksScreen(),
      );
    },
    ReferralScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ReferralScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.SettingsScreen(),
      );
    },
    ConnectionSettingsScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.ConnectionSettingsScreen(),
      );
    },
    HelpScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.HelpScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.SignUpScreen(),
      );
    },
    ResetPasswordScreenRoute.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.ResetPasswordScreen(),
      );
    },
    MainTopicPageRoute.name: (routeData) {
      final args = routeData.argsAs<MainTopicPageRouteArgs>();
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.MainTopicPage(
          key: args.key,
          screenType: args.screenType,
        ),
      );
    },
  };

  @override
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig(
          LauncherScreenRoute.name,
          path: '/',
        ),
        _i21.RouteConfig(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        ),
        _i21.RouteConfig(
          WelcomeScreenRoute.name,
          path: '/welcome',
        ),
        _i21.RouteConfig(
          HomeScreenRoute.name,
          path: '/main',
        ),
        _i21.RouteConfig(
          PlaceTagScreenRoute.name,
          path: '/place-tag',
        ),
        _i21.RouteConfig(
          FilterPageRoute.name,
          path: '/filter',
        ),
        _i21.RouteConfig(
          MapScreenRoute.name,
          path: '/map',
        ),
        _i21.RouteConfig(
          MapSetLocationScreenRoute.name,
          path: '/map-set-location',
        ),
        _i21.RouteConfig(
          AccountScreenRoute.name,
          path: '/account',
        ),
        _i21.RouteConfig(
          VerifyScreenRoute.name,
          path: '/verify',
        ),
        _i21.RouteConfig(
          TopUpPageRoute.name,
          path: '/account/top-up',
        ),
        _i21.RouteConfig(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        ),
        _i21.RouteConfig(
          ReferralScreenRoute.name,
          path: '/referral',
        ),
        _i21.RouteConfig(
          SettingsScreenRoute.name,
          path: '/settings',
        ),
        _i21.RouteConfig(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        ),
        _i21.RouteConfig(
          HelpScreenRoute.name,
          path: '/help',
        ),
        _i21.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i21.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up',
        ),
        _i21.RouteConfig(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        ),
        _i21.RouteConfig(
          MainTopicPageRoute.name,
          path: 'main-topic',
        ),
      ];
}

/// generated route for
/// [_i1.LauncherScreen]
class LauncherScreenRoute extends _i21.PageRouteInfo<void> {
  const LauncherScreenRoute()
      : super(
          LauncherScreenRoute.name,
          path: '/',
        );

  static const String name = 'LauncherScreenRoute';
}

/// generated route for
/// [_i2.OnBoardingScreen]
class OnBoardingScreenRoute extends _i21.PageRouteInfo<void> {
  const OnBoardingScreenRoute()
      : super(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        );

  static const String name = 'OnBoardingScreenRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeScreenRoute extends _i21.PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(
          WelcomeScreenRoute.name,
          path: '/welcome',
        );

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i21.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/main',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i5.PlaceTagScreen]
class PlaceTagScreenRoute extends _i21.PageRouteInfo<void> {
  const PlaceTagScreenRoute()
      : super(
          PlaceTagScreenRoute.name,
          path: '/place-tag',
        );

  static const String name = 'PlaceTagScreenRoute';
}

/// generated route for
/// [_i6.FilterPage]
class FilterPageRoute extends _i21.PageRouteInfo<void> {
  const FilterPageRoute()
      : super(
          FilterPageRoute.name,
          path: '/filter',
        );

  static const String name = 'FilterPageRoute';
}

/// generated route for
/// [_i7.MapScreen]
class MapScreenRoute extends _i21.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute({
    _i22.Key? key,
    required Map<_i23.LatLng, String> tagDescriptionMap,
    required _i24.User user,
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

  final _i22.Key? key;

  final Map<_i23.LatLng, String> tagDescriptionMap;

  final _i24.User user;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, tagDescriptionMap: $tagDescriptionMap, user: $user}';
  }
}

/// generated route for
/// [_i8.MapSetLocationScreen]
class MapSetLocationScreenRoute
    extends _i21.PageRouteInfo<MapSetLocationScreenRouteArgs> {
  MapSetLocationScreenRoute({
    _i22.Key? key,
    required _i23.LatLng userLocation,
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

  final _i22.Key? key;

  final _i23.LatLng userLocation;

  @override
  String toString() {
    return 'MapSetLocationScreenRouteArgs{key: $key, userLocation: $userLocation}';
  }
}

/// generated route for
/// [_i9.AccountScreen]
class AccountScreenRoute extends _i21.PageRouteInfo<void> {
  const AccountScreenRoute()
      : super(
          AccountScreenRoute.name,
          path: '/account',
        );

  static const String name = 'AccountScreenRoute';
}

/// generated route for
/// [_i10.VerifyScreen]
class VerifyScreenRoute extends _i21.PageRouteInfo<void> {
  const VerifyScreenRoute()
      : super(
          VerifyScreenRoute.name,
          path: '/verify',
        );

  static const String name = 'VerifyScreenRoute';
}

/// generated route for
/// [_i11.TopUpPage]
class TopUpPageRoute extends _i21.PageRouteInfo<void> {
  const TopUpPageRoute()
      : super(
          TopUpPageRoute.name,
          path: '/account/top-up',
        );

  static const String name = 'TopUpPageRoute';
}

/// generated route for
/// [_i12.BookmarksScreen]
class BookmarksScreenRoute extends _i21.PageRouteInfo<void> {
  const BookmarksScreenRoute()
      : super(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        );

  static const String name = 'BookmarksScreenRoute';
}

/// generated route for
/// [_i13.ReferralScreen]
class ReferralScreenRoute extends _i21.PageRouteInfo<void> {
  const ReferralScreenRoute()
      : super(
          ReferralScreenRoute.name,
          path: '/referral',
        );

  static const String name = 'ReferralScreenRoute';
}

/// generated route for
/// [_i14.SettingsScreen]
class SettingsScreenRoute extends _i21.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i15.ConnectionSettingsScreen]
class ConnectionSettingsScreenRoute extends _i21.PageRouteInfo<void> {
  const ConnectionSettingsScreenRoute()
      : super(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        );

  static const String name = 'ConnectionSettingsScreenRoute';
}

/// generated route for
/// [_i16.HelpScreen]
class HelpScreenRoute extends _i21.PageRouteInfo<void> {
  const HelpScreenRoute()
      : super(
          HelpScreenRoute.name,
          path: '/help',
        );

  static const String name = 'HelpScreenRoute';
}

/// generated route for
/// [_i17.LoginScreen]
class LoginScreenRoute extends _i21.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i18.SignUpScreen]
class SignUpScreenRoute extends _i21.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i19.ResetPasswordScreen]
class ResetPasswordScreenRoute extends _i21.PageRouteInfo<void> {
  const ResetPasswordScreenRoute()
      : super(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        );

  static const String name = 'ResetPasswordScreenRoute';
}

/// generated route for
/// [_i20.MainTopicPage]
class MainTopicPageRoute extends _i21.PageRouteInfo<MainTopicPageRouteArgs> {
  MainTopicPageRoute({
    _i22.Key? key,
    required _i25.ScreenType screenType,
  }) : super(
          MainTopicPageRoute.name,
          path: 'main-topic',
          args: MainTopicPageRouteArgs(
            key: key,
            screenType: screenType,
          ),
        );

  static const String name = 'MainTopicPageRoute';
}

class MainTopicPageRouteArgs {
  const MainTopicPageRouteArgs({
    this.key,
    required this.screenType,
  });

  final _i22.Key? key;

  final _i25.ScreenType screenType;

  @override
  String toString() {
    return 'MainTopicPageRouteArgs{key: $key, screenType: $screenType}';
  }
}
