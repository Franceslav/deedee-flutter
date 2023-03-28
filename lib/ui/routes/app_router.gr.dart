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
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/material.dart' as _i29;
import 'package:latlong2/latlong.dart' as _i31;

import '../../model/user.dart' as _i30;
import '../account/account_language_screen.dart' as _i10;
import '../account/account_screen.dart' as _i8;
import '../account/account_verify_screen.dart' as _i9;
import '../account/personal_info/edit_pers_info.dart' as _i26;
import '../account/personal_info/personal_information.dart' as _i27;
import '../auth/launcherScreen/launcher_screen.dart' as _i1;
import '../auth/login/login_screen.dart' as _i18;
import '../auth/onBoarding/on_boarding_screen.dart' as _i2;
import '../auth/resetPasswordScreen/reset_password_screen.dart' as _i20;
import '../auth/signUp/sign_up_screen.dart' as _i19;
import '../auth/welcome/welcome_screen.dart' as _i3;
import '../bookmarks/bookmarks_screen.dart' as _i12;
import '../filter/filter_screen.dart' as _i5;
import '../help/help_screen.dart' as _i17;
import '../home/home_screen.dart' as _i4;
import '../main_topic/enum/topic_screens_enum.dart' as _i32;
import '../main_topic/main_topic_screen.dart' as _i22;
import '../map_cubit/map_screen.dart' as _i6;
import '../place_order/place_order_screen.dart' as _i25;
import '../place_tag/map_set_location_screen.dart' as _i7;
import '../referral/referral_screen.dart' as _i14;
import '../saved_filters/saved_filters_screen.dart' as _i13;
import '../settings/connection_settings/connection_settings_screen.dart'
    as _i16;
import '../settings/settings_screen.dart' as _i15;
import '../subscribed_filters/subscribed_filters_page.dart' as _i21;
import '../top_up/top_up_screen.dart' as _i11;
import '../user_tag_details/user_tag_details_screen.dart' as _i24;
import '../user_tags/user_tags_screen.dart' as _i23;

class AppRouter extends _i28.RootStackRouter {
  AppRouter([_i29.GlobalKey<_i29.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    LauncherScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LauncherScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnBoardingScreen(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    FilterPageRoute.name: (routeData) {
      final args = routeData.argsAs<FilterPageRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.FilterPage(
          key: args.key,
          topicsName: args.topicsName,
        ),
      );
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.MapScreen(
          key: args.key,
          user: args.user,
          tagDescriptionMap: args.tagDescriptionMap,
          filterKeys: args.filterKeys,
          selectedFilterKeys: args.selectedFilterKeys,
          topicsName: args.topicsName,
        ),
      );
    },
    MapSetLocationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapSetLocationScreenRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.MapSetLocationScreen(
          key: args.key,
          userLocation: args.userLocation,
        ),
      );
    },
    AccountScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AccountScreen(),
      );
    },
    VerifyScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.VerifyScreen(),
      );
    },
    AccountLanguageScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AccountLanguageScreen(),
      );
    },
    TopUpPageRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.TopUpPage(),
      );
    },
    BookmarksScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.BookmarksScreen(),
      );
    },
    SavedFiltersScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.SavedFiltersScreen(),
      );
    },
    ReferralScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ReferralScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.SettingsScreen(),
      );
    },
    ConnectionSettingsScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ConnectionSettingsScreen(),
      );
    },
    HelpScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.HelpScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.SignUpScreen(),
      );
    },
    ResetPasswordScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.ResetPasswordScreen(),
      );
    },
    SubscribedFiltersPageRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.SubscribedFiltersPage(),
      );
    },
    MainTopicScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MainTopicScreenRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i22.MainTopicScreen(
          key: args.key,
          screenType: args.screenType,
        ),
      );
    },
    UserTagsScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
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
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.UserTagDetailsScreen(
          key: args.key,
          userId: args.userId,
          tagId: args.tagId,
        ),
      );
    },
    PlaceOrderScreenRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.PlaceOrderScreen(),
      );
    },
    EditProfilePageRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.EditProfilePage(),
      );
    },
    PersonalInfoPageRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalInfoPageRouteArgs>(
          orElse: () => const PersonalInfoPageRouteArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.PersonalInfoPage(key: args.key),
      );
    },
  };

  @override
  List<_i28.RouteConfig> get routes => [
        _i28.RouteConfig(
          LauncherScreenRoute.name,
          path: '/',
        ),
        _i28.RouteConfig(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        ),
        _i28.RouteConfig(
          WelcomeScreenRoute.name,
          path: '/welcome',
        ),
        _i28.RouteConfig(
          HomeScreenRoute.name,
          path: '/main',
        ),
        _i28.RouteConfig(
          FilterPageRoute.name,
          path: '/filter',
        ),
        _i28.RouteConfig(
          MapScreenRoute.name,
          path: '/map',
        ),
        _i28.RouteConfig(
          MapSetLocationScreenRoute.name,
          path: '/map-set-location',
        ),
        _i28.RouteConfig(
          AccountScreenRoute.name,
          path: '/account',
        ),
        _i28.RouteConfig(
          VerifyScreenRoute.name,
          path: '/verify',
        ),
        _i28.RouteConfig(
          AccountLanguageScreenRoute.name,
          path: '/account-language',
        ),
        _i28.RouteConfig(
          TopUpPageRoute.name,
          path: '/account/top-up',
        ),
        _i28.RouteConfig(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        ),
        _i28.RouteConfig(
          SavedFiltersScreenRoute.name,
          path: '/saved-filters',
        ),
        _i28.RouteConfig(
          ReferralScreenRoute.name,
          path: '/referral',
        ),
        _i28.RouteConfig(
          SettingsScreenRoute.name,
          path: '/settings',
        ),
        _i28.RouteConfig(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        ),
        _i28.RouteConfig(
          HelpScreenRoute.name,
          path: '/help',
        ),
        _i28.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i28.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up',
        ),
        _i28.RouteConfig(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        ),
        _i28.RouteConfig(
          SubscribedFiltersPageRoute.name,
          path: '/subscribed-filter',
        ),
        _i28.RouteConfig(
          MainTopicScreenRoute.name,
          path: 'main-topic',
        ),
        _i28.RouteConfig(
          UserTagsScreenRoute.name,
          path: '',
        ),
        _i28.RouteConfig(
          UserTagDetailsScreenRoute.name,
          path: ':userId/:tagId',
        ),
        _i28.RouteConfig(
          SubscribedFiltersPageRoute.name,
          path: '/subscribed-filter',
        ),
        _i28.RouteConfig(
          PlaceOrderScreenRoute.name,
          path: '/place-order',
        ),
        _i28.RouteConfig(
          EditProfilePageRoute.name,
          path: '/edit-profile-page',
        ),
        _i28.RouteConfig(
          PersonalInfoPageRoute.name,
          path: '/personal-info',
        ),
      ];
}

/// generated route for
/// [_i1.LauncherScreen]
class LauncherScreenRoute extends _i28.PageRouteInfo<void> {
  const LauncherScreenRoute()
      : super(
          LauncherScreenRoute.name,
          path: '/',
        );

  static const String name = 'LauncherScreenRoute';
}

/// generated route for
/// [_i2.OnBoardingScreen]
class OnBoardingScreenRoute extends _i28.PageRouteInfo<void> {
  const OnBoardingScreenRoute()
      : super(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        );

  static const String name = 'OnBoardingScreenRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeScreenRoute extends _i28.PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(
          WelcomeScreenRoute.name,
          path: '/welcome',
        );

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i28.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/main',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i5.FilterPage]
class FilterPageRoute extends _i28.PageRouteInfo<FilterPageRouteArgs> {
  FilterPageRoute({
    _i29.Key? key,
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

  final _i29.Key? key;

  final String topicsName;

  @override
  String toString() {
    return 'FilterPageRouteArgs{key: $key, topicsName: $topicsName}';
  }
}

/// generated route for
/// [_i6.MapScreen]
class MapScreenRoute extends _i28.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute({
    _i29.Key? key,
    required _i30.User user,
    required Map<_i31.LatLng, _i5.TagDTO> tagDescriptionMap,
    required List<String> filterKeys,
    required List<String> selectedFilterKeys,
    required String topicsName,
  }) : super(
          MapScreenRoute.name,
          path: '/map',
          args: MapScreenRouteArgs(
            key: key,
            user: user,
            tagDescriptionMap: tagDescriptionMap,
            filterKeys: filterKeys,
            selectedFilterKeys: selectedFilterKeys,
            topicsName: topicsName,
          ),
        );

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({
    this.key,
    required this.user,
    required this.tagDescriptionMap,
    required this.filterKeys,
    required this.selectedFilterKeys,
    required this.topicsName,
  });

  final _i29.Key? key;

  final _i30.User user;

  final Map<_i31.LatLng, _i5.TagDTO> tagDescriptionMap;

  final List<String> filterKeys;

  final List<String> selectedFilterKeys;

  final String topicsName;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, user: $user, tagDescriptionMap: $tagDescriptionMap, filterKeys: $filterKeys, selectedFilterKeys: $selectedFilterKeys, topicsName: $topicsName}';
  }
}

/// generated route for
/// [_i7.MapSetLocationScreen]
class MapSetLocationScreenRoute
    extends _i28.PageRouteInfo<MapSetLocationScreenRouteArgs> {
  MapSetLocationScreenRoute({
    _i29.Key? key,
    required _i31.LatLng userLocation,
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

  final _i29.Key? key;

  final _i31.LatLng userLocation;

  @override
  String toString() {
    return 'MapSetLocationScreenRouteArgs{key: $key, userLocation: $userLocation}';
  }
}

/// generated route for
/// [_i8.AccountScreen]
class AccountScreenRoute extends _i28.PageRouteInfo<void> {
  const AccountScreenRoute()
      : super(
          AccountScreenRoute.name,
          path: '/account',
        );

  static const String name = 'AccountScreenRoute';
}

/// generated route for
/// [_i9.VerifyScreen]
class VerifyScreenRoute extends _i28.PageRouteInfo<void> {
  const VerifyScreenRoute()
      : super(
          VerifyScreenRoute.name,
          path: '/verify',
        );

  static const String name = 'VerifyScreenRoute';
}

/// generated route for
/// [_i10.AccountLanguageScreen]
class AccountLanguageScreenRoute extends _i28.PageRouteInfo<void> {
  const AccountLanguageScreenRoute()
      : super(
          AccountLanguageScreenRoute.name,
          path: '/account-language',
        );

  static const String name = 'AccountLanguageScreenRoute';
}

/// generated route for
/// [_i11.TopUpPage]
class TopUpPageRoute extends _i28.PageRouteInfo<void> {
  const TopUpPageRoute()
      : super(
          TopUpPageRoute.name,
          path: '/account/top-up',
        );

  static const String name = 'TopUpPageRoute';
}

/// generated route for
/// [_i12.BookmarksScreen]
class BookmarksScreenRoute extends _i28.PageRouteInfo<void> {
  const BookmarksScreenRoute()
      : super(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        );

  static const String name = 'BookmarksScreenRoute';
}

/// generated route for
/// [_i13.SavedFiltersScreen]
class SavedFiltersScreenRoute extends _i28.PageRouteInfo<void> {
  const SavedFiltersScreenRoute()
      : super(
          SavedFiltersScreenRoute.name,
          path: '/saved-filters',
        );

  static const String name = 'SavedFiltersScreenRoute';
}

/// generated route for
/// [_i14.ReferralScreen]
class ReferralScreenRoute extends _i28.PageRouteInfo<void> {
  const ReferralScreenRoute()
      : super(
          ReferralScreenRoute.name,
          path: '/referral',
        );

  static const String name = 'ReferralScreenRoute';
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsScreenRoute extends _i28.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i16.ConnectionSettingsScreen]
class ConnectionSettingsScreenRoute extends _i28.PageRouteInfo<void> {
  const ConnectionSettingsScreenRoute()
      : super(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        );

  static const String name = 'ConnectionSettingsScreenRoute';
}

/// generated route for
/// [_i17.HelpScreen]
class HelpScreenRoute extends _i28.PageRouteInfo<void> {
  const HelpScreenRoute()
      : super(
          HelpScreenRoute.name,
          path: '/help',
        );

  static const String name = 'HelpScreenRoute';
}

/// generated route for
/// [_i18.LoginScreen]
class LoginScreenRoute extends _i28.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i19.SignUpScreen]
class SignUpScreenRoute extends _i28.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i20.ResetPasswordScreen]
class ResetPasswordScreenRoute extends _i28.PageRouteInfo<void> {
  const ResetPasswordScreenRoute()
      : super(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        );

  static const String name = 'ResetPasswordScreenRoute';
}

/// generated route for
/// [_i21.SubscribedFiltersPage]
class SubscribedFiltersPageRoute extends _i28.PageRouteInfo<void> {
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
    extends _i28.PageRouteInfo<MainTopicScreenRouteArgs> {
  MainTopicScreenRoute({
    _i29.Key? key,
    required _i32.ScreenType screenType,
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

  final _i29.Key? key;

  final _i32.ScreenType screenType;

  @override
  String toString() {
    return 'MainTopicScreenRouteArgs{key: $key, screenType: $screenType}';
  }
}

/// generated route for
/// [_i23.UserTagsScreen]
class UserTagsScreenRoute extends _i28.PageRouteInfo<void> {
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
    extends _i28.PageRouteInfo<UserTagDetailsScreenRouteArgs> {
  UserTagDetailsScreenRoute({
    _i29.Key? key,
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

  final _i29.Key? key;

  final String userId;

  final String tagId;

  @override
  String toString() {
    return 'UserTagDetailsScreenRouteArgs{key: $key, userId: $userId, tagId: $tagId}';
  }
}

/// generated route for
/// [_i25.PlaceOrderScreen]
class PlaceOrderScreenRoute extends _i28.PageRouteInfo<void> {
  const PlaceOrderScreenRoute()
      : super(
          PlaceOrderScreenRoute.name,
          path: '/place-order',
        );

  static const String name = 'PlaceOrderScreenRoute';
}

/// generated route for
/// [_i26.EditProfilePage]
class EditProfilePageRoute extends _i28.PageRouteInfo<void> {
  const EditProfilePageRoute()
      : super(
          EditProfilePageRoute.name,
          path: '/edit-profile-page',
        );

  static const String name = 'EditProfilePageRoute';
}

/// generated route for
/// [_i27.PersonalInfoPage]
class PersonalInfoPageRoute
    extends _i28.PageRouteInfo<PersonalInfoPageRouteArgs> {
  PersonalInfoPageRoute({_i29.Key? key})
      : super(
          PersonalInfoPageRoute.name,
          path: '/personal-info',
          args: PersonalInfoPageRouteArgs(key: key),
        );

  static const String name = 'PersonalInfoPageRoute';
}

class PersonalInfoPageRouteArgs {
  const PersonalInfoPageRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'PersonalInfoPageRouteArgs{key: $key}';
  }
}
