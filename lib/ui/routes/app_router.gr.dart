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
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:latlong2/latlong.dart' as _i27;

import '../../model/user.dart' as _i28;
import '../account/account_screen.dart' as _i9;
import '../account/account_verify_screen.dart' as _i10;
import '../auth/launcherScreen/launcher_screen.dart' as _i1;
import '../auth/login/login_screen.dart' as _i18;
import '../auth/onBoarding/on_boarding_screen.dart' as _i2;
import '../auth/resetPasswordScreen/reset_password_screen.dart' as _i20;
import '../auth/signUp/sign_up_screen.dart' as _i19;
import '../auth/welcome/welcome_screen.dart' as _i3;
import '../bookmarks/bookmarks_screen.dart' as _i12;
import '../filter/filter_screen.dart' as _i6;
import '../help/help_screen.dart' as _i17;
import '../home/home_screen.dart' as _i4;
import '../main_topic/enum/topic_screens_enum.dart' as _i29;
import '../main_topic/main_topic_screen.dart' as _i22;
import '../map_cubit/map_screen.dart' as _i7;
import '../place_tag/map_set_location_screen.dart' as _i8;
import '../place_tag/place_tag_screen.dart' as _i5;
import '../referral/referral_screen.dart' as _i14;
import '../saved_filters/saved_filters_screen.dart' as _i13;
import '../settings/connection_settings/connection_settings_screen.dart'
    as _i16;
import '../settings/settings_screen.dart' as _i15;
import '../subscribed_filters/subscribed_filters_page.dart' as _i21;
import '../top_up/top_up_screen.dart' as _i11;
import '../user_tag_details/user_tag_details_screen.dart' as _i24;
import '../user_tags/user_tags_screen.dart' as _i23;

class AppRouter extends _i25.RootStackRouter {
  AppRouter([_i26.GlobalKey<_i26.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    LauncherScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LauncherScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnBoardingScreen(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    PlaceTagScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PlaceTagScreen(),
      );
    },
    FilterPageRoute.name: (routeData) {
      final args = routeData.argsAs<FilterPageRouteArgs>();
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.FilterPage(
          key: args.key,
          topicsName: args.topicsName,
        ),
      );
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i25.MaterialPageX<dynamic>(
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
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.MapSetLocationScreen(
          key: args.key,
          userLocation: args.userLocation,
        ),
      );
    },
    AccountScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AccountScreen(),
      );
    },
    VerifyScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.VerifyScreen(),
      );
    },
    TopUpPageRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.TopUpPage(),
      );
    },
    BookmarksScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.BookmarksScreen(),
      );
    },
    SavedFiltersScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.SavedFiltersScreen(),
      );
    },
    ReferralScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ReferralScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.SettingsScreen(),
      );
    },
    ConnectionSettingsScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ConnectionSettingsScreen(),
      );
    },
    HelpScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.HelpScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.SignUpScreen(),
      );
    },
    ResetPasswordScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.ResetPasswordScreen(),
      );
    },
    SubscribedFiltersPageRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.SubscribedFiltersPage(),
      );
    },
    MainTopicScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MainTopicScreenRouteArgs>();
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i22.MainTopicScreen(
          key: args.key,
          screenType: args.screenType,
        ),
      );
    },
    UserTagsScreenRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.UserTagsScreen(),
      );
    },
    UserTagDetailsScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserTagDetailsScreenRouteArgs>(
          orElse: () => UserTagDetailsScreenRouteArgs(
                userId: pathParams.getString('userId'),
                tagId: pathParams.getString('tagId'),
              ));
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.UserTagDetailsScreen(
          key: args.key,
          userId: args.userId,
          tagId: args.tagId,
        ),
      );
    },
  };

  @override
  List<_i25.RouteConfig> get routes => [
        _i25.RouteConfig(
          LauncherScreenRoute.name,
          path: '/',
        ),
        _i25.RouteConfig(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        ),
        _i25.RouteConfig(
          WelcomeScreenRoute.name,
          path: '/welcome',
        ),
        _i25.RouteConfig(
          HomeScreenRoute.name,
          path: '/main',
        ),
        _i25.RouteConfig(
          PlaceTagScreenRoute.name,
          path: '/place-tag',
        ),
        _i25.RouteConfig(
          FilterPageRoute.name,
          path: '/filter',
        ),
        _i25.RouteConfig(
          MapScreenRoute.name,
          path: '/map',
        ),
        _i25.RouteConfig(
          MapSetLocationScreenRoute.name,
          path: '/map-set-location',
        ),
        _i25.RouteConfig(
          AccountScreenRoute.name,
          path: '/account',
        ),
        _i25.RouteConfig(
          VerifyScreenRoute.name,
          path: '/verify',
        ),
        _i25.RouteConfig(
          TopUpPageRoute.name,
          path: '/account/top-up',
        ),
        _i25.RouteConfig(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        ),
        _i25.RouteConfig(
          SavedFiltersScreenRoute.name,
          path: '/saved-filters',
        ),
        _i25.RouteConfig(
          ReferralScreenRoute.name,
          path: '/referral',
        ),
        _i25.RouteConfig(
          SettingsScreenRoute.name,
          path: '/settings',
        ),
        _i25.RouteConfig(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        ),
        _i25.RouteConfig(
          HelpScreenRoute.name,
          path: '/help',
        ),
        _i25.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i25.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up',
        ),
        _i25.RouteConfig(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        ),
        _i25.RouteConfig(
          SubscribedFiltersPageRoute.name,
          path: '/subscribed-filter',
        ),
        _i25.RouteConfig(
          MainTopicScreenRoute.name,
          path: 'main-topic',
        ),
        _i25.RouteConfig(
          UserTagsScreenRoute.name,
          path: '',
        ),
        _i25.RouteConfig(
          UserTagDetailsScreenRoute.name,
          path: ':userId/:tagId',
        ),
      ];
}

/// generated route for
/// [_i1.LauncherScreen]
class LauncherScreenRoute extends _i25.PageRouteInfo<void> {
  const LauncherScreenRoute()
      : super(
          LauncherScreenRoute.name,
          path: '/',
        );

  static const String name = 'LauncherScreenRoute';
}

/// generated route for
/// [_i2.OnBoardingScreen]
class OnBoardingScreenRoute extends _i25.PageRouteInfo<void> {
  const OnBoardingScreenRoute()
      : super(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        );

  static const String name = 'OnBoardingScreenRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeScreenRoute extends _i25.PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(
          WelcomeScreenRoute.name,
          path: '/welcome',
        );

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i25.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/main',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i5.PlaceTagScreen]
class PlaceTagScreenRoute extends _i25.PageRouteInfo<void> {
  const PlaceTagScreenRoute()
      : super(
          PlaceTagScreenRoute.name,
          path: '/place-tag',
        );

  static const String name = 'PlaceTagScreenRoute';
}

/// generated route for
/// [_i6.FilterPage]
class FilterPageRoute extends _i25.PageRouteInfo<FilterPageRouteArgs> {
  FilterPageRoute({
    _i26.Key? key,
    required String topicsName,
  }) : super(
          FilterPageRoute.name,
          path: '/filter',
          args: FilterPageRouteArgs(
            key: key,
            topicsName: topicsName,
          ),
        );

  static const String name = 'FilterPageRoute';
}

class FilterPageRouteArgs {
  const FilterPageRouteArgs({
    this.key,
    required this.topicsName,
  });

  final _i26.Key? key;

  final String topicsName;

  @override
  String toString() {
    return 'FilterPageRouteArgs{key: $key, topicsName: $topicsName}';
  }
}

/// generated route for
/// [_i7.MapScreen]
class MapScreenRoute extends _i25.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute({
    _i26.Key? key,
    required Map<_i27.LatLng, _i6.TagDTO> tagDescriptionMap,
    required _i28.User user,
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

  final _i26.Key? key;

  final Map<_i27.LatLng, _i6.TagDTO> tagDescriptionMap;

  final _i28.User user;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, tagDescriptionMap: $tagDescriptionMap, user: $user}';
  }
}

/// generated route for
/// [_i8.MapSetLocationScreen]
class MapSetLocationScreenRoute
    extends _i25.PageRouteInfo<MapSetLocationScreenRouteArgs> {
  MapSetLocationScreenRoute({
    _i26.Key? key,
    required _i27.LatLng userLocation,
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

  final _i26.Key? key;

  final _i27.LatLng userLocation;

  @override
  String toString() {
    return 'MapSetLocationScreenRouteArgs{key: $key, userLocation: $userLocation}';
  }
}

/// generated route for
/// [_i9.AccountScreen]
class AccountScreenRoute extends _i25.PageRouteInfo<void> {
  const AccountScreenRoute()
      : super(
          AccountScreenRoute.name,
          path: '/account',
        );

  static const String name = 'AccountScreenRoute';
}

/// generated route for
/// [_i10.VerifyScreen]
class VerifyScreenRoute extends _i25.PageRouteInfo<void> {
  const VerifyScreenRoute()
      : super(
          VerifyScreenRoute.name,
          path: '/verify',
        );

  static const String name = 'VerifyScreenRoute';
}

/// generated route for
/// [_i11.TopUpPage]
class TopUpPageRoute extends _i25.PageRouteInfo<void> {
  const TopUpPageRoute()
      : super(
          TopUpPageRoute.name,
          path: '/account/top-up',
        );

  static const String name = 'TopUpPageRoute';
}

/// generated route for
/// [_i12.BookmarksScreen]
class BookmarksScreenRoute extends _i25.PageRouteInfo<void> {
  const BookmarksScreenRoute()
      : super(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        );

  static const String name = 'BookmarksScreenRoute';
}

/// generated route for
/// [_i13.SavedFiltersScreen]
class SavedFiltersScreenRoute extends _i25.PageRouteInfo<void> {
  const SavedFiltersScreenRoute()
      : super(
          SavedFiltersScreenRoute.name,
          path: '/saved-filters',
        );

  static const String name = 'SavedFiltersScreenRoute';
}

/// generated route for
/// [_i14.ReferralScreen]
class ReferralScreenRoute extends _i25.PageRouteInfo<void> {
  const ReferralScreenRoute()
      : super(
          ReferralScreenRoute.name,
          path: '/referral',
        );

  static const String name = 'ReferralScreenRoute';
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsScreenRoute extends _i25.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i16.ConnectionSettingsScreen]
class ConnectionSettingsScreenRoute extends _i25.PageRouteInfo<void> {
  const ConnectionSettingsScreenRoute()
      : super(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        );

  static const String name = 'ConnectionSettingsScreenRoute';
}

/// generated route for
/// [_i17.HelpScreen]
class HelpScreenRoute extends _i25.PageRouteInfo<void> {
  const HelpScreenRoute()
      : super(
          HelpScreenRoute.name,
          path: '/help',
        );

  static const String name = 'HelpScreenRoute';
}

/// generated route for
/// [_i18.LoginScreen]
class LoginScreenRoute extends _i25.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i19.SignUpScreen]
class SignUpScreenRoute extends _i25.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i20.ResetPasswordScreen]
class ResetPasswordScreenRoute extends _i25.PageRouteInfo<void> {
  const ResetPasswordScreenRoute()
      : super(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        );

  static const String name = 'ResetPasswordScreenRoute';
}

/// generated route for
/// [_i21.SubscribedFiltersPage]
class SubscribedFiltersPageRoute extends _i25.PageRouteInfo<void> {
  const SubscribedFiltersPageRoute()
      : super(
          SubscribedFiltersPageRoute.name,
          path: '/subscribed-filter',
        );

  static const String name = 'SubscribedFiltersPageRoute';
}

/// generated route for
/// [_i22.MainTopicScreen]
class MainTopicScreenRoute
    extends _i25.PageRouteInfo<MainTopicScreenRouteArgs> {
  MainTopicScreenRoute({
    _i26.Key? key,
    required _i29.ScreenType screenType,
  }) : super(
          MainTopicScreenRoute.name,
          path: 'main-topic',
          args: MainTopicScreenRouteArgs(
            key: key,
            screenType: screenType,
          ),
        );

  static const String name = 'MainTopicScreenRoute';
}

class MainTopicScreenRouteArgs {
  const MainTopicScreenRouteArgs({
    this.key,
    required this.screenType,
  });

  final _i26.Key? key;

  final _i29.ScreenType screenType;

  @override
  String toString() {
    return 'MainTopicScreenRouteArgs{key: $key, screenType: $screenType}';
  }
}

/// generated route for
/// [_i23.UserTagsScreen]
class UserTagsScreenRoute extends _i25.PageRouteInfo<void> {
  const UserTagsScreenRoute()
      : super(
          UserTagsScreenRoute.name,
          path: '',
        );

  static const String name = 'UserTagsScreenRoute';
}

/// generated route for
/// [_i24.UserTagDetailsScreen]
class UserTagDetailsScreenRoute
    extends _i25.PageRouteInfo<UserTagDetailsScreenRouteArgs> {
  UserTagDetailsScreenRoute({
    _i26.Key? key,
    required String userId,
    required String tagId,
  }) : super(
          UserTagDetailsScreenRoute.name,
          path: ':userId/:tagId',
          args: UserTagDetailsScreenRouteArgs(
            key: key,
            userId: userId,
            tagId: tagId,
          ),
          rawPathParams: {
            'userId': userId,
            'tagId': tagId,
          },
        );

  static const String name = 'UserTagDetailsScreenRoute';
}

class UserTagDetailsScreenRouteArgs {
  const UserTagDetailsScreenRouteArgs({
    this.key,
    required this.userId,
    required this.tagId,
  });

  final _i26.Key? key;

  final String userId;

  final String tagId;

  @override
  String toString() {
    return 'UserTagDetailsScreenRouteArgs{key: $key, userId: $userId, tagId: $tagId}';
  }
}
