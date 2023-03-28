import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/auth/launcherScreen/launcher_screen.dart';
import 'package:deedee/ui/auth/login/login_screen.dart';
import 'package:deedee/ui/auth/onBoarding/on_boarding_screen.dart';
import 'package:deedee/ui/auth/resetPasswordScreen/reset_password_screen.dart';
import 'package:deedee/ui/auth/signUp/sign_up_screen.dart';
import 'package:deedee/ui/auth/welcome/welcome_screen.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/help/help_screen.dart';
import 'package:deedee/ui/main_topic/main_topic_screen.dart';
import 'package:deedee/ui/page/account/account_language_screen.dart';
import 'package:deedee/ui/page/account/account_screen.dart';
import 'package:deedee/ui/page/account/account_verify_screen.dart';
import 'package:deedee/ui/page/bookmarks/bookmarks_screen.dart';
import 'package:deedee/ui/page/home/home_screen.dart';
import 'package:deedee/ui/page/map_cubit/map_screen.dart';
import 'package:deedee/ui/page/referral/referral_screen.dart';
import 'package:deedee/ui/page/settings/connection_settings/connection_settings_screen.dart';
import 'package:deedee/ui/page/settings/settings_screen.dart';
import 'package:deedee/ui/page/subscribed_filters/subscribed_filters_page.dart';
import 'package:deedee/ui/page/top_up/top_up_screen.dart';
import 'package:deedee/ui/place_tag/map_set_location_screen.dart';
import 'package:deedee/ui/saved_filters/saved_filters_screen.dart';
import 'package:deedee/ui/user_tag_details/user_tag_details_screen.dart';
import 'package:deedee/ui/user_tags/user_tags_screen.dart';

import '../account/personal_info/edit_pers_info.dart';
import '../account/personal_info/personal_information.dart';
import '../place_order/place_order_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: LauncherScreen, initial: true),
    MaterialRoute(page: OnBoardingScreen, path: '/boarding'),
    MaterialRoute(page: WelcomeScreen, path: '/welcome'),
    MaterialRoute(page: HomeScreen, path: '/main'),
    MaterialRoute(page: FilterPage, path: '/filter'),
    MaterialRoute(page: MapScreen, path: '/map'),
    MaterialRoute(page: MapSetLocationScreen, path: '/map-set-location'),
    MaterialRoute(page: AccountScreen, path: '/account'),
    MaterialRoute(page: VerifyScreen, path: '/verify'),
    MaterialRoute(page: AccountLanguageScreen, path: '/account-language'),
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
    MaterialRoute(page: UserTagsScreen, path: ''),
    MaterialRoute(page: UserTagDetailsScreen, path: ':userId/:tagId'),
    MaterialRoute(page: SubscribedFiltersPage, path: '/subscribed-filter'),
    MaterialRoute(page: PlaceOrderScreen, path: '/place-order'),
    MaterialRoute(page: EditProfilePage, path: '/edit-profile-page'),
    MaterialRoute(page: PersonalInfoPage, path: '/personal-info'),
  ],
)
class $AppRouter {}
