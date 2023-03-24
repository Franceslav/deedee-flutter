import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/push_notification_service.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/global_widgets/genaral_sliding_panel/general_sliding_panel.dart';
import 'package:deedee/ui/global_widgets/genaral_sliding_panel/general_sliding_panel_item.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeeDeeMenuSlider extends GeneralSlidingPanel {
  final User user;
  final BuildContext context;

  DeeDeeMenuSlider(
    this.context, {
    super.key,
    required super.controller,
    required this.user,
  }) : super(generalSlidingPanelItemList: [
          GeneralSlidingPanelItem(
              icon: Icons.home,
              text: AppLocalizations.of(context)!.homeTitle,
              onTap: () {
                if (context.router.current.isActive) {
                  controller.close();
                }

                context.router.popAndPush(const HomeScreenRoute());
              }),
          GeneralSlidingPanelItem(
              icon: Icons.published_with_changes_sharp,
              text: 'Push',
              onTap: () async {
                final pushNotificationService =
                    locator.get<PushNotificationService>();
                await pushNotificationService.sendPushNotification();
              }),
          GeneralSlidingPanelItem(
              icon: Icons.list,
              text: AppLocalizations.of(context)!.userTagsTitle,
              onTap: () {
                if (context.router.current.isActive) {
                  controller.close();
                }

                context.router.popAndPush(const UserTagsScreenRoute());
              }),
          GeneralSlidingPanelItem(
              icon: Icons.account_box,
              text: AppLocalizations.of(context)!.accountMoneyTitle,
              onTap: () {
                if (context.router.current.isActive) {
                  controller.close();
                }

                context.router.popAndPush(const AccountScreenRoute());
              }),
          GeneralSlidingPanelItem(
              icon: Icons.rotate_left_rounded,
              text:
                  '${AppLocalizations.of(context)!.switchTo} ${user.accountType.switchAccountStringType(context)}',
              onTap: () {
                switch (user.accountType) {
                  case AccountType.buy:
                    BlocProvider.of<UserBloc>(context)
                        .add(UserSwitchAccountType(AccountType.sell));
                    break;
                  case AccountType.sell:
                    BlocProvider.of<UserBloc>(context)
                        .add(UserSwitchAccountType(AccountType.buy));
                    break;
                }
                controller.close();
              }),
          GeneralSlidingPanelItem(
              icon: Icons.bookmark,
              text: AppLocalizations.of(context)!.bookmarksTitle,
              onTap: () {
                if (context.router.current.isActive) {
                  controller.close();
                }

                context.router.popAndPush(const BookmarksScreenRoute());
              }),
          GeneralSlidingPanelItem(
              icon: Icons.filter_alt,
              text: AppLocalizations.of(context)!.myFilters,
              onTap: () {
                if (context.router.current.isActive) {
                  controller.close();
                }

                context.router.popAndPush(const SavedFiltersScreenRoute());
              }),
          GeneralSlidingPanelItem(
              icon: Icons.star_border_purple500_sharp,
              text: AppLocalizations.of(context)!.subscription,
              onTap: () {
                if (context.router.current.isActive) {
                  controller.close();
                }

                context.router.popAndPush(const SubscribedFiltersPageRoute());
              }),
          GeneralSlidingPanelItem(
              icon: Icons.link_sharp,
              text: AppLocalizations.of(context)!.accountReferralTitle,
              onTap: () {
                if (context.router.current.isActive) {
                  controller.close();
                }

                context.router.popAndPush(const ReferralScreenRoute());
              }),
          GeneralSlidingPanelItem(
              icon: Icons.settings,
              text: AppLocalizations.of(context)!.settings,
              onTap: () {
                if (context.router.current.isActive) {
                  controller.close();
                }

                context.router.popAndPush(const SettingsScreenRoute());
              }),
          GeneralSlidingPanelItem(
              icon: Icons.help_outline,
              text: AppLocalizations.of(context)!.helpTitle,
              onTap: () {
                if (context.router.current.isActive) {
                  controller.close();
                }

                context.router.popAndPush(const HelpScreenRoute());
              }),
          GeneralSlidingPanelItem(
              icon: Icons.exit_to_app,
              text: AppLocalizations.of(context)!.logout,
              onTap: () {
                context.read<AuthenticationBloc>().add(LogoutEvent());
                context.router.replace(const LoginScreenRoute());
              }),
        ]);
}
