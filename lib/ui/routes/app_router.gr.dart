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
import 'package:auto_route/auto_route.dart' as _i36;
import 'package:fixnum/fixnum.dart' as _i41;
import 'package:flutter/material.dart' as _i37;
import 'package:latlong2/latlong.dart' as _i39;

import '../../generated/deedee/api/model/composite_filter.pb.dart' as _i38;
import '../account/personal_info/edit_pers_info.dart' as _i25;
import '../account/personal_info/personal_information.dart' as _i26;
import '../auth/launcherScreen/launcher_screen.dart' as _i1;
import '../auth/login/login_screen.dart' as _i18;
import '../auth/onBoarding/on_boarding_screen.dart' as _i2;
import '../auth/resetPasswordScreen/reset_password_screen.dart' as _i20;
import '../auth/signUp/sign_up_screen.dart' as _i19;
import '../auth/welcome/welcome_screen.dart' as _i3;
import '../help/help_screen.dart' as _i17;
import '../main_topic/enum/topic_screens_enum.dart' as _i40;
import '../main_topic/main_topic_screen.dart' as _i21;
import '../page/account/account_business_page.dart' as _i35;
import '../page/account/account_language_screen.dart' as _i10;
import '../page/account/account_screen.dart' as _i8;
import '../page/account/account_verify_screen.dart' as _i9;
import '../page/account/social_network_screen.dart' as _i27;
import '../page/add_card/add_card_screen.dart' as _i31;
import '../page/bookmarks/bookmarks_screen.dart' as _i12;
import '../page/bookmarks/qr_scanner/qr_scanner.dart' as _i33;
import '../page/customer_profile/customer_profile_screen.dart' as _i34;
import '../page/favorite_composite_filters/favorite_composite_filters_screen.dart'
    as _i13;
import '../page/filter/filter_page.dart' as _i5;
import '../page/home/home_screen.dart' as _i4;
import '../page/map_cubit/map_screen.dart' as _i6;
import '../page/my_referrals/referral_screen.dart' as _i14;
import '../page/my_requests/my_requests_screen.dart' as _i28;
import '../page/payment/payment_method_screen.dart' as _i30;
import '../page/settings/connection_settings/connection_settings_screen.dart'
    as _i16;
import '../page/settings/settings_screen.dart' as _i15;
import '../page/stats/stats_screen.dart' as _i32;
import '../page/top_up/top_up_screen.dart' as _i11;
import '../place_order/place_order_screen.dart' as _i24;
import '../place_tag/map_set_location_screen.dart' as _i7;
import '../request_screen/service_request_page.dart' as _i29;
import '../user_tag_details/user_tag_details_screen.dart' as _i23;
import '../user_tags/user_tags_screen.dart' as _i22;

class AppRouter extends _i36.RootStackRouter {
  AppRouter([_i37.GlobalKey<_i37.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i36.PageFactory> pagesMap = {
    LauncherScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LauncherScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnBoardingScreen(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    FilterPageRoute.name: (routeData) {
      final args = routeData.argsAs<FilterPageRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.FilterPage(
          key: args.key,
          currentFilter: args.currentFilter,
        ),
      );
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.MapScreen(
          key: args.key,
          tagDescriptionMap: args.tagDescriptionMap,
          currentFilter: args.currentFilter,
        ),
      );
    },
    MapSetLocationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapSetLocationScreenRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.MapSetLocationScreen(
          key: args.key,
          userLocation: args.userLocation,
        ),
      );
    },
    AccountScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AccountScreen(),
      );
    },
    VerifyScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.VerifyScreen(),
      );
    },
    AccountLanguageScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AccountLanguageScreen(),
      );
    },
    TopUpPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.TopUpPage(),
      );
    },
    BookmarksScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.BookmarksScreen(),
      );
    },
    FavoriteCompositeFiltersScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.FavoriteCompositeFiltersScreen(),
      );
    },
    ReferralScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ReferralScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.SettingsScreen(),
      );
    },
    ConnectionSettingsScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ConnectionSettingsScreen(),
      );
    },
    HelpScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.HelpScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.SignUpScreen(),
      );
    },
    ResetPasswordScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.ResetPasswordScreen(),
      );
    },
    MainTopicScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MainTopicScreenRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.MainTopicScreen(
          key: args.key,
          screenType: args.screenType,
        ),
      );
    },
    UserTagsScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.UserTagsScreen(),
      );
    },
    UserTagDetailsScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserTagDetailsScreenRouteArgs>(
          orElse: () => UserTagDetailsScreenRouteArgs(
                userId: pathParams.getString('userId'),
                tagId: pathParams.getString('tagId'),
              ));
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i23.UserTagDetailsScreen(
          key: args.key,
          userId: args.userId,
          tagId: args.tagId,
        ),
      );
    },
    PlaceOrderScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.PlaceOrderScreen(),
      );
    },
    EditProfilePageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.EditProfilePage(),
      );
    },
    PersonalInfoPageRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalInfoPageRouteArgs>(
          orElse: () => const PersonalInfoPageRouteArgs());
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.PersonalInfoPage(key: args.key),
      );
    },
    SocialNetworkScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.SocialNetworkScreen(),
      );
    },
    MyRequestScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.MyRequestScreen(),
      );
    },
    RequestScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RequestScreenRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i29.RequestScreen(
          key: args.key,
          serviceRequestId: args.serviceRequestId,
        ),
      );
    },
    PaymentScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i30.PaymentScreen(),
      );
    },
    CardScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.CardScreen(),
      );
    },
    StatsScreenRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.StatsScreen(),
      );
    },
    BookmarkQRScannerRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.BookmarkQRScanner(),
      );
    },
    CustomerProfileRoute.name: (routeData) {
      final args = routeData.argsAs<CustomerProfileRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i34.CustomerProfile(
          key: args.key,
          id: args.id,
        ),
      );
    },
    AccountBusinessPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i35.AccountBusinessPage(),
      );
    },
  };

  @override
  List<_i36.RouteConfig> get routes => [
        _i36.RouteConfig(
          LauncherScreenRoute.name,
          path: '/',
        ),
        _i36.RouteConfig(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        ),
        _i36.RouteConfig(
          WelcomeScreenRoute.name,
          path: '/welcome',
        ),
        _i36.RouteConfig(
          HomeScreenRoute.name,
          path: '/main',
        ),
        _i36.RouteConfig(
          FilterPageRoute.name,
          path: '/filter',
        ),
        _i36.RouteConfig(
          MapScreenRoute.name,
          path: '/map',
        ),
        _i36.RouteConfig(
          MapSetLocationScreenRoute.name,
          path: '/map-set-location',
        ),
        _i36.RouteConfig(
          AccountScreenRoute.name,
          path: '/account',
        ),
        _i36.RouteConfig(
          VerifyScreenRoute.name,
          path: '/verify',
        ),
        _i36.RouteConfig(
          AccountLanguageScreenRoute.name,
          path: '/account-language',
        ),
        _i36.RouteConfig(
          TopUpPageRoute.name,
          path: '/account/top-up',
        ),
        _i36.RouteConfig(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        ),
        _i36.RouteConfig(
          FavoriteCompositeFiltersScreenRoute.name,
          path: '/saved-filters',
        ),
        _i36.RouteConfig(
          ReferralScreenRoute.name,
          path: '/referral',
        ),
        _i36.RouteConfig(
          SettingsScreenRoute.name,
          path: '/settings',
        ),
        _i36.RouteConfig(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        ),
        _i36.RouteConfig(
          HelpScreenRoute.name,
          path: '/help',
        ),
        _i36.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i36.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up',
        ),
        _i36.RouteConfig(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        ),
        _i36.RouteConfig(
          MainTopicScreenRoute.name,
          path: 'main-topic',
        ),
        _i36.RouteConfig(
          UserTagsScreenRoute.name,
          path: '',
        ),
        _i36.RouteConfig(
          UserTagDetailsScreenRoute.name,
          path: ':userId/:tagId',
        ),
        _i36.RouteConfig(
          PlaceOrderScreenRoute.name,
          path: '/place-order',
        ),
        _i36.RouteConfig(
          EditProfilePageRoute.name,
          path: '/edit-profile-page',
        ),
        _i36.RouteConfig(
          PersonalInfoPageRoute.name,
          path: '/personal-info',
        ),
        _i36.RouteConfig(
          SocialNetworkScreenRoute.name,
          path: '/social-page',
        ),
        _i36.RouteConfig(
          MyRequestScreenRoute.name,
          path: '/my-request',
        ),
        _i36.RouteConfig(
          RequestScreenRoute.name,
          path: '/request-page',
        ),
        _i36.RouteConfig(
          PaymentScreenRoute.name,
          path: '/payment-page',
        ),
        _i36.RouteConfig(
          CardScreenRoute.name,
          path: '/card-page',
        ),
        _i36.RouteConfig(
          StatsScreenRoute.name,
          path: '/stats',
        ),
        _i36.RouteConfig(
          BookmarkQRScannerRoute.name,
          path: '/qr-scan',
        ),
        _i36.RouteConfig(
          CustomerProfileRoute.name,
          path: '/customer-profile',
        ),
        _i36.RouteConfig(
          AccountBusinessPageRoute.name,
          path: '/business',
        ),
      ];
}

/// generated route for
/// [_i1.LauncherScreen]
class LauncherScreenRoute extends _i36.PageRouteInfo<void> {
  const LauncherScreenRoute()
      : super(
          LauncherScreenRoute.name,
          path: '/',
        );

  static const String name = 'LauncherScreenRoute';
}

/// generated route for
/// [_i2.OnBoardingScreen]
class OnBoardingScreenRoute extends _i36.PageRouteInfo<void> {
  const OnBoardingScreenRoute()
      : super(
          OnBoardingScreenRoute.name,
          path: '/boarding',
        );

  static const String name = 'OnBoardingScreenRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeScreenRoute extends _i36.PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(
          WelcomeScreenRoute.name,
          path: '/welcome',
        );

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i36.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/main',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i5.FilterPage]
class FilterPageRoute extends _i36.PageRouteInfo<FilterPageRouteArgs> {
  FilterPageRoute({
    _i37.Key? key,
    required _i38.CompositeFilter currentFilter,
  }) : super(
          FilterPageRoute.name,
          path: '/filter',
          args: FilterPageRouteArgs(
            key: key,
            currentFilter: currentFilter,
          ),
        );

  static const String name = 'FilterPageRoute';
}

class FilterPageRouteArgs {
  const FilterPageRouteArgs({
    this.key,
    required this.currentFilter,
  });

  final _i37.Key? key;

  final _i38.CompositeFilter currentFilter;

  @override
  String toString() {
    return 'FilterPageRouteArgs{key: $key, currentFilter: $currentFilter}';
  }
}

/// generated route for
/// [_i6.MapScreen]
class MapScreenRoute extends _i36.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute({
    _i37.Key? key,
    required Map<_i39.LatLng, _i5.TagDTO> tagDescriptionMap,
    required _i38.CompositeFilter currentFilter,
  }) : super(
          MapScreenRoute.name,
          path: '/map',
          args: MapScreenRouteArgs(
            key: key,
            tagDescriptionMap: tagDescriptionMap,
            currentFilter: currentFilter,
          ),
        );

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({
    this.key,
    required this.tagDescriptionMap,
    required this.currentFilter,
  });

  final _i37.Key? key;

  final Map<_i39.LatLng, _i5.TagDTO> tagDescriptionMap;

  final _i38.CompositeFilter currentFilter;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, tagDescriptionMap: $tagDescriptionMap, currentFilter: $currentFilter}';
  }
}

/// generated route for
/// [_i7.MapSetLocationScreen]
class MapSetLocationScreenRoute
    extends _i36.PageRouteInfo<MapSetLocationScreenRouteArgs> {
  MapSetLocationScreenRoute({
    _i37.Key? key,
    required _i39.LatLng userLocation,
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

  final _i37.Key? key;

  final _i39.LatLng userLocation;

  @override
  String toString() {
    return 'MapSetLocationScreenRouteArgs{key: $key, userLocation: $userLocation}';
  }
}

/// generated route for
/// [_i8.AccountScreen]
class AccountScreenRoute extends _i36.PageRouteInfo<void> {
  const AccountScreenRoute()
      : super(
          AccountScreenRoute.name,
          path: '/account',
        );

  static const String name = 'AccountScreenRoute';
}

/// generated route for
/// [_i9.VerifyScreen]
class VerifyScreenRoute extends _i36.PageRouteInfo<void> {
  const VerifyScreenRoute()
      : super(
          VerifyScreenRoute.name,
          path: '/verify',
        );

  static const String name = 'VerifyScreenRoute';
}

/// generated route for
/// [_i10.AccountLanguageScreen]
class AccountLanguageScreenRoute extends _i36.PageRouteInfo<void> {
  const AccountLanguageScreenRoute()
      : super(
          AccountLanguageScreenRoute.name,
          path: '/account-language',
        );

  static const String name = 'AccountLanguageScreenRoute';
}

/// generated route for
/// [_i11.TopUpPage]
class TopUpPageRoute extends _i36.PageRouteInfo<void> {
  const TopUpPageRoute()
      : super(
          TopUpPageRoute.name,
          path: '/account/top-up',
        );

  static const String name = 'TopUpPageRoute';
}

/// generated route for
/// [_i12.BookmarksScreen]
class BookmarksScreenRoute extends _i36.PageRouteInfo<void> {
  const BookmarksScreenRoute()
      : super(
          BookmarksScreenRoute.name,
          path: '/bookmarks',
        );

  static const String name = 'BookmarksScreenRoute';
}

/// generated route for
/// [_i13.FavoriteCompositeFiltersScreen]
class FavoriteCompositeFiltersScreenRoute extends _i36.PageRouteInfo<void> {
  const FavoriteCompositeFiltersScreenRoute()
      : super(
          FavoriteCompositeFiltersScreenRoute.name,
          path: '/saved-filters',
        );

  static const String name = 'FavoriteCompositeFiltersScreenRoute';
}

/// generated route for
/// [_i14.ReferralScreen]
class ReferralScreenRoute extends _i36.PageRouteInfo<void> {
  const ReferralScreenRoute()
      : super(
          ReferralScreenRoute.name,
          path: '/referral',
        );

  static const String name = 'ReferralScreenRoute';
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsScreenRoute extends _i36.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i16.ConnectionSettingsScreen]
class ConnectionSettingsScreenRoute extends _i36.PageRouteInfo<void> {
  const ConnectionSettingsScreenRoute()
      : super(
          ConnectionSettingsScreenRoute.name,
          path: '/connection-settings',
        );

  static const String name = 'ConnectionSettingsScreenRoute';
}

/// generated route for
/// [_i17.HelpScreen]
class HelpScreenRoute extends _i36.PageRouteInfo<void> {
  const HelpScreenRoute()
      : super(
          HelpScreenRoute.name,
          path: '/help',
        );

  static const String name = 'HelpScreenRoute';
}

/// generated route for
/// [_i18.LoginScreen]
class LoginScreenRoute extends _i36.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i19.SignUpScreen]
class SignUpScreenRoute extends _i36.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i20.ResetPasswordScreen]
class ResetPasswordScreenRoute extends _i36.PageRouteInfo<void> {
  const ResetPasswordScreenRoute()
      : super(
          ResetPasswordScreenRoute.name,
          path: 'reset-password',
        );

  static const String name = 'ResetPasswordScreenRoute';
}

/// generated route for
/// [_i21.MainTopicScreen]
class MainTopicScreenRoute
    extends _i36.PageRouteInfo<MainTopicScreenRouteArgs> {
  MainTopicScreenRoute({
    _i37.Key? key,
    required _i40.ScreenType screenType,
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

  final _i37.Key? key;

  final _i40.ScreenType screenType;

  @override
  String toString() {
    return 'MainTopicScreenRouteArgs{key: $key, screenType: $screenType}';
  }
}

/// generated route for
/// [_i22.UserTagsScreen]
class UserTagsScreenRoute extends _i36.PageRouteInfo<void> {
  const UserTagsScreenRoute()
      : super(
          UserTagsScreenRoute.name,
          path: '',
        );

  static const String name = 'UserTagsScreenRoute';
}

/// generated route for
/// [_i23.UserTagDetailsScreen]
class UserTagDetailsScreenRoute
    extends _i36.PageRouteInfo<UserTagDetailsScreenRouteArgs> {
  UserTagDetailsScreenRoute({
    _i37.Key? key,
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

  final _i37.Key? key;

  final String userId;

  final String tagId;

  @override
  String toString() {
    return 'UserTagDetailsScreenRouteArgs{key: $key, userId: $userId, tagId: $tagId}';
  }
}

/// generated route for
/// [_i24.PlaceOrderScreen]
class PlaceOrderScreenRoute extends _i36.PageRouteInfo<void> {
  const PlaceOrderScreenRoute()
      : super(
          PlaceOrderScreenRoute.name,
          path: '/place-order',
        );

  static const String name = 'PlaceOrderScreenRoute';
}

/// generated route for
/// [_i25.EditProfilePage]
class EditProfilePageRoute extends _i36.PageRouteInfo<void> {
  const EditProfilePageRoute()
      : super(
          EditProfilePageRoute.name,
          path: '/edit-profile-page',
        );

  static const String name = 'EditProfilePageRoute';
}

/// generated route for
/// [_i26.PersonalInfoPage]
class PersonalInfoPageRoute
    extends _i36.PageRouteInfo<PersonalInfoPageRouteArgs> {
  PersonalInfoPageRoute({_i37.Key? key})
      : super(
          PersonalInfoPageRoute.name,
          path: '/personal-info',
          args: PersonalInfoPageRouteArgs(key: key),
        );

  static const String name = 'PersonalInfoPageRoute';
}

class PersonalInfoPageRouteArgs {
  const PersonalInfoPageRouteArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'PersonalInfoPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i27.SocialNetworkScreen]
class SocialNetworkScreenRoute extends _i36.PageRouteInfo<void> {
  const SocialNetworkScreenRoute()
      : super(
          SocialNetworkScreenRoute.name,
          path: '/social-page',
        );

  static const String name = 'SocialNetworkScreenRoute';
}

/// generated route for
/// [_i28.MyRequestScreen]
class MyRequestScreenRoute extends _i36.PageRouteInfo<void> {
  const MyRequestScreenRoute()
      : super(
          MyRequestScreenRoute.name,
          path: '/my-request',
        );

  static const String name = 'MyRequestScreenRoute';
}

/// generated route for
/// [_i29.RequestScreen]
class RequestScreenRoute extends _i36.PageRouteInfo<RequestScreenRouteArgs> {
  RequestScreenRoute({
    _i37.Key? key,
    required _i41.Int64 serviceRequestId,
  }) : super(
          RequestScreenRoute.name,
          path: '/request-page',
          args: RequestScreenRouteArgs(
            key: key,
            serviceRequestId: serviceRequestId,
          ),
        );

  static const String name = 'RequestScreenRoute';
}

class RequestScreenRouteArgs {
  const RequestScreenRouteArgs({
    this.key,
    required this.serviceRequestId,
  });

  final _i37.Key? key;

  final _i41.Int64 serviceRequestId;

  @override
  String toString() {
    return 'RequestScreenRouteArgs{key: $key, serviceRequestId: $serviceRequestId}';
  }
}

/// generated route for
/// [_i30.PaymentScreen]
class PaymentScreenRoute extends _i36.PageRouteInfo<void> {
  const PaymentScreenRoute()
      : super(
          PaymentScreenRoute.name,
          path: '/payment-page',
        );

  static const String name = 'PaymentScreenRoute';
}

/// generated route for
/// [_i31.CardScreen]
class CardScreenRoute extends _i36.PageRouteInfo<void> {
  const CardScreenRoute()
      : super(
          CardScreenRoute.name,
          path: '/card-page',
        );

  static const String name = 'CardScreenRoute';
}

/// generated route for
/// [_i32.StatsScreen]
class StatsScreenRoute extends _i36.PageRouteInfo<void> {
  const StatsScreenRoute()
      : super(
          StatsScreenRoute.name,
          path: '/stats',
        );

  static const String name = 'StatsScreenRoute';
}

/// generated route for
/// [_i33.BookmarkQRScanner]
class BookmarkQRScannerRoute extends _i36.PageRouteInfo<void> {
  const BookmarkQRScannerRoute()
      : super(
          BookmarkQRScannerRoute.name,
          path: '/qr-scan',
        );

  static const String name = 'BookmarkQRScannerRoute';
}

/// generated route for
/// [_i34.CustomerProfile]
class CustomerProfileRoute
    extends _i36.PageRouteInfo<CustomerProfileRouteArgs> {
  CustomerProfileRoute({
    _i37.Key? key,
    required String id,
  }) : super(
          CustomerProfileRoute.name,
          path: '/customer-profile',
          args: CustomerProfileRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'CustomerProfileRoute';
}

class CustomerProfileRouteArgs {
  const CustomerProfileRouteArgs({
    this.key,
    required this.id,
  });

  final _i37.Key? key;

  final String id;

  @override
  String toString() {
    return 'CustomerProfileRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i35.AccountBusinessPage]
class AccountBusinessPageRoute extends _i36.PageRouteInfo<void> {
  const AccountBusinessPageRoute()
      : super(
          AccountBusinessPageRoute.name,
          path: '/business',
        );

  static const String name = 'AccountBusinessPageRoute';
}
