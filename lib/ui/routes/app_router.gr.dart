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
import 'package:auto_route/auto_route.dart' as _i35;
import 'package:flutter/material.dart' as _i36;
import 'package:latlong2/latlong.dart' as _i38;

import '../../generated/request_service_service.pb.dart' as _i40;
import '../../model/user.dart' as _i37;
import '../account/personal_info/edit_pers_info.dart' as _i26;
import '../account/personal_info/personal_information.dart' as _i27;
import '../auth/launcherScreen/launcher_screen.dart' as _i1;
import '../auth/login/login_screen.dart' as _i18;
import '../auth/onBoarding/on_boarding_screen.dart' as _i2;
import '../auth/resetPasswordScreen/reset_password_screen.dart' as _i20;
import '../auth/signUp/sign_up_screen.dart' as _i19;
import '../auth/welcome/welcome_screen.dart' as _i3;
import '../help/help_screen.dart' as _i17;
import '../main_topic/enum/topic_screens_enum.dart' as _i39;
import '../main_topic/main_topic_screen.dart' as _i22;
import '../page/account/account_language_screen.dart' as _i10;
import '../page/account/account_screen.dart' as _i8;
import '../page/account/account_verify_screen.dart' as _i9;
import '../page/account/social_network_screen.dart' as _i28;
import '../page/add_card/add_card_screen.dart' as _i33;
import '../page/bookmarks/bookmarks_screen.dart' as _i12;
import '../page/filter/filter_screen.dart' as _i5;
import '../page/home/home_screen.dart' as _i4;
import '../page/map_cubit/map_screen.dart' as _i6;
import '../page/my_referrals/referral_screen.dart' as _i14;
import '../page/my_requests/my_request_detail.dart' as _i30;
import '../page/my_requests/my_requests_screen.dart' as _i29;
import '../page/my_saved_filters/saved_filters_screen.dart' as _i13;
import '../page/my_subscribed_filters/subscribed_filters_page.dart' as _i21;
import '../page/payment/payment_method_screen.dart' as _i32;
import '../page/settings/connection_settings/connection_settings_screen.dart'
    as _i16;
import '../page/settings/settings_screen.dart' as _i15;
import '../page/stats/stats_screen.dart' as _i34;
import '../page/top_up/top_up_screen.dart' as _i11;
import '../place_order/place_order_screen.dart' as _i25;
import '../place_tag/map_set_location_screen.dart' as _i7;
import '../request_screen/request_screen.dart' as _i31;
import '../user_tag_details/user_tag_details_screen.dart' as _i24;
import '../user_tags/user_tags_screen.dart' as _i23;

class AppRouter extends _i35.RootStackRouter {
  AppRouter([_i36.GlobalKey<_i36.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i35.PageFactory> pagesMap = {
    LauncherScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LauncherScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnBoardingScreen(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    FilterPageRoute.name: (routeData) {
      final args = routeData.argsAs<FilterPageRouteArgs>();
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.FilterPage(
          key: args.key,
          topicName: args.topicName,
          currentFilter: args.currentFilter,
        ),
      );
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.MapScreen(
          key: args.key,
          user: args.user,
          tagDescriptionMap: args.tagDescriptionMap,
          topicName: args.topicName,
          currentFilter: args.currentFilter,
        ),
      );
    },
    MapSetLocationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapSetLocationScreenRouteArgs>();
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.MapSetLocationScreen(
          key: args.key,
          userLocation: args.userLocation,
        ),
      );
    },
    AccountScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AccountScreen(),
      );
    },
    VerifyScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.VerifyScreen(),
      );
    },
    AccountLanguageScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AccountLanguageScreen(),
      );
    },
    TopUpPageRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.TopUpPage(),
      );
    },
    BookmarksScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.BookmarksScreen(),
      );
    },
    SavedFiltersScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.SavedFiltersScreen(),
      );
    },
    ReferralScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ReferralScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.SettingsScreen(),
      );
    },
    ConnectionSettingsScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ConnectionSettingsScreen(),
      );
    },
    HelpScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.HelpScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.SignUpScreen(),
      );
    },
    ResetPasswordScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.ResetPasswordScreen(),
      );
    },
    SubscribedFiltersPageRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.SubscribedFiltersPage(),
      );
    },
    MainTopicScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MainTopicScreenRouteArgs>();
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i22.MainTopicScreen(
          key: args.key,
          screenType: args.screenType,
        ),
      );
    },
    UserTagsScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
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
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.UserTagDetailsScreen(
          key: args.key,
          userId: args.userId,
          tagId: args.tagId,
        ),
      );
    },
    PlaceOrderScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.PlaceOrderScreen(),
      );
    },
    EditProfilePageRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.EditProfilePage(),
      );
    },
    PersonalInfoPageRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalInfoPageRouteArgs>(
          orElse: () => const PersonalInfoPageRouteArgs());
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.PersonalInfoPage(key: args.key),
      );
    },
    SocialNetworkScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.SocialNetworkScreen(),
      );
    },
    MyRequestScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i29.MyRequestScreen(),
      );
    },
    MyRequestDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MyRequestDetailRouteArgs>();
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i30.MyRequestDetail(
          key: args.key,
          request: args.request,
        ),
      );
    },
    RequestScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.RequestScreen(),
      );
    },
    PaymentScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.PaymentScreen(),
      );
    },
    CardScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.CardScreen(),
      );
    },
    StatsScreenRoute.name: (routeData) {
      return _i35.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i34.StatsScreen(),
      );
    },
  };

  @override
  List<_i35.RouteConfig> get routes => [
        _i35.RouteConfig(
          LauncherScreenRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        ),
        _i35.RouteConfig(
          WelcomeScreenRoute.name,
          path: '/welcome',
        ),
        _i35.RouteConfig(
          HomeScreenRoute.name,
          path: '/main',
        ),
        _i35.RouteConfig(
          FilterPageRoute.name,
          path: '/filter',
        ),
        _i35.RouteConfig(
          MapScreenRoute.name,
          path: '/map',
        ),
        _i35.RouteConfig(
          MapSetLocationScreenRoute.name,
          path: '/map-set-location',
        ),
        _i35.RouteConfig(
          AccountScreenRoute.name,
          path: '/account',
        ),
        _i35.RouteConfig(
          VerifyScreenRoute.name,
          path: '/verify',
        ),
        _i35.RouteConfig(
          AccountLanguageScreenRoute.name,
          path: '/account-language',
        ),
        _i35.RouteConfig(
          TopUpPageRoute.name,
          path: '/account/top-up',
        ),
        _i35.RouteConfig(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        ),
        _i35.RouteConfig(
          SavedFiltersScreenRoute.name,
          path: '/saved-filters',
        ),
        _i35.RouteConfig(
          ReferralScreenRoute.name,
          path: '/referral',
        ),
        _i35.RouteConfig(
          SettingsScreenRoute.name,
          path: '/settings',
        ),
        _i35.RouteConfig(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        ),
        _i35.RouteConfig(
          HelpScreenRoute.name,
          path: '/help',
        ),
        _i35.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i35.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up',
        ),
        _i35.RouteConfig(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        ),
        _i35.RouteConfig(
          SubscribedFiltersPageRoute.name,
          path: '/subscribed-filter',
        ),
        _i35.RouteConfig(
          MainTopicScreenRoute.name,
          path: 'main-topic',
        ),
        _i35.RouteConfig(
          UserTagsScreenRoute.name,
          path: '',
        ),
        _i35.RouteConfig(
          UserTagDetailsScreenRoute.name,
          path: ':userId/:tagId',
        ),
        _i35.RouteConfig(
          SubscribedFiltersPageRoute.name,
          path: '/subscribed-filter',
        ),
        _i35.RouteConfig(
          PlaceOrderScreenRoute.name,
          path: '/place-order',
        ),
        _i35.RouteConfig(
          EditProfilePageRoute.name,
          path: '/edit-profile-page',
        ),
        _i35.RouteConfig(
          PersonalInfoPageRoute.name,
          path: '/personal-info',
        ),
        _i35.RouteConfig(
          SocialNetworkScreenRoute.name,
          path: '/social-page',
        ),
        _i35.RouteConfig(
          MyRequestScreenRoute.name,
          path: '/my-request',
        ),
        _i35.RouteConfig(
          MyRequestDetailRoute.name,
          path: '/my-request-detail',
        ),
        _i35.RouteConfig(
          RequestScreenRoute.name,
          path: '/request-page',
        ),
        _i35.RouteConfig(
          PaymentScreenRoute.name,
          path: '/payment-page',
        ),
        _i35.RouteConfig(
          CardScreenRoute.name,
          path: '/card-page',
        ),
        _i35.RouteConfig(
          StatsScreenRoute.name,
          path: '/stats',
        ),
      ];
}

/// generated route for
/// [_i1.LauncherScreen]
class LauncherScreenRoute extends _i35.PageRouteInfo<void> {
  const LauncherScreenRoute()
      : super(
          LauncherScreenRoute.name,
          path: '/',
        );

  static const String name = 'LauncherScreenRoute';
}

/// generated route for
/// [_i2.OnBoardingScreen]
class OnBoardingScreenRoute extends _i35.PageRouteInfo<void> {
  const OnBoardingScreenRoute()
      : super(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        );

  static const String name = 'OnBoardingScreenRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeScreenRoute extends _i35.PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(
          WelcomeScreenRoute.name,
          path: '/welcome',
        );

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i35.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/main',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i5.FilterPage]
class FilterPageRoute extends _i35.PageRouteInfo<FilterPageRouteArgs> {
  FilterPageRoute({
    _i36.Key? key,
    required String topicName,
    required _i5.CompositeFilter currentFilter,
  }) : super(
          FilterPageRoute.name,
          path: '/filter',
          args: FilterPageRouteArgs(
            key: key,
            topicName: topicName,
            currentFilter: currentFilter,
          ),
        );

  static const String name = 'FilterPageRoute';
}

class FilterPageRouteArgs {
  const FilterPageRouteArgs({
    this.key,
    required this.topicName,
    required this.currentFilter,
  });

  final _i36.Key? key;

  final String topicName;

  final _i5.CompositeFilter currentFilter;

  @override
  String toString() {
    return 'FilterPageRouteArgs{key: $key, topicName: $topicName, currentFilter: $currentFilter}';
  }
}

/// generated route for
/// [_i6.MapScreen]
class MapScreenRoute extends _i35.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute({
    _i36.Key? key,
    required _i37.User user,
    required Map<_i38.LatLng, _i5.TagDTO> tagDescriptionMap,
    required String topicName,
    required _i5.CompositeFilter currentFilter,
  }) : super(
          MapScreenRoute.name,
          path: '/map',
          args: MapScreenRouteArgs(
            key: key,
            user: user,
            tagDescriptionMap: tagDescriptionMap,
            topicName: topicName,
            currentFilter: currentFilter,
          ),
        );

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({
    this.key,
    required this.user,
    required this.tagDescriptionMap,
    required this.topicName,
    required this.currentFilter,
  });

  final _i36.Key? key;

  final _i37.User user;

  final Map<_i38.LatLng, _i5.TagDTO> tagDescriptionMap;

  final String topicName;

  final _i5.CompositeFilter currentFilter;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, user: $user, tagDescriptionMap: $tagDescriptionMap, topicName: $topicName, currentFilter: $currentFilter}';
  }
}

/// generated route for
/// [_i7.MapSetLocationScreen]
class MapSetLocationScreenRoute
    extends _i35.PageRouteInfo<MapSetLocationScreenRouteArgs> {
  MapSetLocationScreenRoute({
    _i36.Key? key,
    required _i38.LatLng userLocation,
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

  final _i36.Key? key;

  final _i38.LatLng userLocation;

  @override
  String toString() {
    return 'MapSetLocationScreenRouteArgs{key: $key, userLocation: $userLocation}';
  }
}

/// generated route for
/// [_i8.AccountScreen]
class AccountScreenRoute extends _i35.PageRouteInfo<void> {
  const AccountScreenRoute()
      : super(
          AccountScreenRoute.name,
          path: '/account',
        );

  static const String name = 'AccountScreenRoute';
}

/// generated route for
/// [_i9.VerifyScreen]
class VerifyScreenRoute extends _i35.PageRouteInfo<void> {
  const VerifyScreenRoute()
      : super(
          VerifyScreenRoute.name,
          path: '/verify',
        );

  static const String name = 'VerifyScreenRoute';
}

/// generated route for
/// [_i10.AccountLanguageScreen]
class AccountLanguageScreenRoute extends _i35.PageRouteInfo<void> {
  const AccountLanguageScreenRoute()
      : super(
          AccountLanguageScreenRoute.name,
          path: '/account-language',
        );

  static const String name = 'AccountLanguageScreenRoute';
}

/// generated route for
/// [_i11.TopUpPage]
class TopUpPageRoute extends _i35.PageRouteInfo<void> {
  const TopUpPageRoute()
      : super(
          TopUpPageRoute.name,
          path: '/account/top-up',
        );

  static const String name = 'TopUpPageRoute';
}

/// generated route for
/// [_i12.BookmarksScreen]
class BookmarksScreenRoute extends _i35.PageRouteInfo<void> {
  const BookmarksScreenRoute()
      : super(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        );

  static const String name = 'BookmarksScreenRoute';
}

/// generated route for
/// [_i13.SavedFiltersScreen]
class SavedFiltersScreenRoute extends _i35.PageRouteInfo<void> {
  const SavedFiltersScreenRoute()
      : super(
          SavedFiltersScreenRoute.name,
          path: '/saved-filters',
        );

  static const String name = 'SavedFiltersScreenRoute';
}

/// generated route for
/// [_i14.ReferralScreen]
class ReferralScreenRoute extends _i35.PageRouteInfo<void> {
  const ReferralScreenRoute()
      : super(
          ReferralScreenRoute.name,
          path: '/referral',
        );

  static const String name = 'ReferralScreenRoute';
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsScreenRoute extends _i35.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i16.ConnectionSettingsScreen]
class ConnectionSettingsScreenRoute extends _i35.PageRouteInfo<void> {
  const ConnectionSettingsScreenRoute()
      : super(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        );

  static const String name = 'ConnectionSettingsScreenRoute';
}

/// generated route for
/// [_i17.HelpScreen]
class HelpScreenRoute extends _i35.PageRouteInfo<void> {
  const HelpScreenRoute()
      : super(
          HelpScreenRoute.name,
          path: '/help',
        );

  static const String name = 'HelpScreenRoute';
}

/// generated route for
/// [_i18.LoginScreen]
class LoginScreenRoute extends _i35.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i19.SignUpScreen]
class SignUpScreenRoute extends _i35.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i20.ResetPasswordScreen]
class ResetPasswordScreenRoute extends _i35.PageRouteInfo<void> {
  const ResetPasswordScreenRoute()
      : super(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        );

  static const String name = 'ResetPasswordScreenRoute';
}

/// generated route for
/// [_i21.SubscribedFiltersPage]
class SubscribedFiltersPageRoute extends _i35.PageRouteInfo<void> {
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
    extends _i35.PageRouteInfo<MainTopicScreenRouteArgs> {
  MainTopicScreenRoute({
    _i36.Key? key,
    required _i39.ScreenType screenType,
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

  final _i36.Key? key;

  final _i39.ScreenType screenType;

  @override
  String toString() {
    return 'MainTopicScreenRouteArgs{key: $key, screenType: $screenType}';
  }
}

/// generated route for
/// [_i23.UserTagsScreen]
class UserTagsScreenRoute extends _i35.PageRouteInfo<void> {
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
    extends _i35.PageRouteInfo<UserTagDetailsScreenRouteArgs> {
  UserTagDetailsScreenRoute({
    _i36.Key? key,
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

  final _i36.Key? key;

  final String userId;

  final String tagId;

  @override
  String toString() {
    return 'UserTagDetailsScreenRouteArgs{key: $key, userId: $userId, tagId: $tagId}';
  }
}

/// generated route for
/// [_i25.PlaceOrderScreen]
class PlaceOrderScreenRoute extends _i35.PageRouteInfo<void> {
  const PlaceOrderScreenRoute()
      : super(
          PlaceOrderScreenRoute.name,
          path: '/place-order',
        );

  static const String name = 'PlaceOrderScreenRoute';
}

/// generated route for
/// [_i26.EditProfilePage]
class EditProfilePageRoute extends _i35.PageRouteInfo<void> {
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
    extends _i35.PageRouteInfo<PersonalInfoPageRouteArgs> {
  PersonalInfoPageRoute({_i36.Key? key})
      : super(
          PersonalInfoPageRoute.name,
          path: '/personal-info',
          args: PersonalInfoPageRouteArgs(key: key),
        );

  static const String name = 'PersonalInfoPageRoute';
}

class PersonalInfoPageRouteArgs {
  const PersonalInfoPageRouteArgs({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return 'PersonalInfoPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i28.SocialNetworkScreen]
class SocialNetworkScreenRoute extends _i35.PageRouteInfo<void> {
  const SocialNetworkScreenRoute()
      : super(
          SocialNetworkScreenRoute.name,
          path: '/social-page',
        );

  static const String name = 'SocialNetworkScreenRoute';
}

/// generated route for
/// [_i29.MyRequestScreen]
class MyRequestScreenRoute extends _i35.PageRouteInfo<void> {
  const MyRequestScreenRoute()
      : super(
          MyRequestScreenRoute.name,
          path: '/my-request',
        );

  static const String name = 'MyRequestScreenRoute';
}

/// generated route for
/// [_i30.MyRequestDetail]
class MyRequestDetailRoute
    extends _i35.PageRouteInfo<MyRequestDetailRouteArgs> {
  MyRequestDetailRoute({
    _i36.Key? key,
    required _i40.ServiceRequest request,
  }) : super(
          MyRequestDetailRoute.name,
          path: '/my-request-detail',
          args: MyRequestDetailRouteArgs(
            key: key,
            request: request,
          ),
        );

  static const String name = 'MyRequestDetailRoute';
}

class MyRequestDetailRouteArgs {
  const MyRequestDetailRouteArgs({
    this.key,
    required this.request,
  });

  final _i36.Key? key;

  final _i40.ServiceRequest request;

  @override
  String toString() {
    return 'MyRequestDetailRouteArgs{key: $key, request: $request}';
  }
}

/// generated route for
/// [_i31.RequestScreen]
class RequestScreenRoute extends _i35.PageRouteInfo<void> {
  const RequestScreenRoute()
      : super(
          RequestScreenRoute.name,
          path: '/request-page',
        );

  static const String name = 'RequestScreenRoute';
}

/// generated route for
/// [_i32.PaymentScreen]
class PaymentScreenRoute extends _i35.PageRouteInfo<void> {
  const PaymentScreenRoute()
      : super(
          PaymentScreenRoute.name,
          path: '/payment-page',
        );

  static const String name = 'PaymentScreenRoute';
}

/// generated route for
/// [_i33.CardScreen]
class CardScreenRoute extends _i35.PageRouteInfo<void> {
  const CardScreenRoute()
      : super(
          CardScreenRoute.name,
          path: '/card-page',
        );

  static const String name = 'CardScreenRoute';
}

/// generated route for
/// [_i34.StatsScreen]
class StatsScreenRoute extends _i35.PageRouteInfo<void> {
  const StatsScreenRoute()
      : super(
          StatsScreenRoute.name,
          path: '/stats',
        );

  static const String name = 'StatsScreenRoute';
}
