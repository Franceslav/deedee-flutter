import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/account/account_screen.dart';
import 'package:deedee/ui/account/account_verify_screen.dart';
import 'package:deedee/ui/auth/launcherScreen/launcher_screen.dart';
import 'package:deedee/ui/auth/login/login_screen.dart';
import 'package:deedee/ui/auth/onBoarding/on_boarding_screen.dart';
import 'package:deedee/ui/auth/resetPasswordScreen/reset_password_screen.dart';
import 'package:deedee/ui/auth/signUp/sign_up_screen.dart';
import 'package:deedee/ui/auth/welcome/welcome_screen.dart';
import 'package:deedee/ui/bookmarks/bookmarks_screen.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/help/help_screen.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/main_topic/main_topic_screen.dart';
import 'package:deedee/ui/map_cubit/map_screen.dart';
import 'package:deedee/ui/place_tag/map_set_location_screen.dart';
import 'package:deedee/ui/place_tag/place_tag_screen.dart';
import 'package:deedee/ui/referral/referral_screen.dart';
import 'package:deedee/ui/saved_filters/saved_filters_screen.dart';
import 'package:deedee/ui/settings/connection_settings/connection_settings_screen.dart';
import 'package:deedee/ui/settings/settings_screen.dart';
import 'package:deedee/ui/subscribed_filters/subscribed_filters_page.dart';
import 'package:deedee/ui/top_up/top_up_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: LauncherScreen, initial: true),
    MaterialRoute(page: OnBoardingScreen, path: '/boarding'),
    MaterialRoute(page: WelcomeScreen, path: '/welcome'),
    MaterialRoute(page: HomeScreen, path: '/main'),
    MaterialRoute(page: PlaceTagScreen, path: '/place-tag'),
    MaterialRoute(page: FilterPage, path: '/filter'),
    MaterialRoute(page: MapScreen, path: '/map'),
    MaterialRoute(page: MapSetLocationScreen, path: '/map-set-location'),
    MaterialRoute(page: AccountScreen, path: '/account'),
    MaterialRoute(page: VerifyScreen, path: '/verify'),
    MaterialRoute(page: TopUpPage, path: '/account/top-up'),
    MaterialRoute(page: BookmarksScreen, path: '/bookmarks'),
    MaterialRoute(page: SavedFiltersScreen, path: '/saved-filters'),
    MaterialRoute(page: ReferralScreen, path: '/referral'),
    MaterialRoute(page: SettingsScreen, path: '/settings'),
    MaterialRoute(page: ConnectionSettingsScreen, path: '/connection-settings'),
    MaterialRoute(page: HelpScreen, path: '/help'),
    MaterialRoute(page: LoginScreen, path: '/login'),
    MaterialRoute(page: SignUpScreen, path: '/sign-up'),
    MaterialRoute(page: ResetPasswordScreen, path: 'reset-password'),
    MaterialRoute(page: SubscribedFiltersPage, path: '/subscribed-filter'),
    MaterialRoute(page: MainTopicScreen, path: 'main-topic'),
  ],
)
class $AppRouter {}
