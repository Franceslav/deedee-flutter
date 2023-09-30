import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../model/user.dart';
import '../auth/authentication_bloc.dart';
import '../routes/app_router.gr.dart';
import 'genaral_sliding_panel/general_sliding_panel.dart';
import 'genaral_sliding_panel/general_sliding_panel_item.dart';

class ProfileMenuSlider extends GeneralSlidingPanel {
  final User user;
  final PanelController controller;
  final BuildContext context;

  ProfileMenuSlider(
    this.context, {
    super.key,
    required this.controller,
    required this.user,
  }) : super(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
            controller: controller,
            generalSlidingPanelItemList: [
              GeneralSlidingPanelItem(
                  icon: Icons.list,
                  text: AppLocalizations.of(context)!.userTagsTitle,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.push(const UserTagsScreenRoute());
                  }),
              user.accountType == AccountType.buy
                  ? GeneralSlidingPanelItem(
                      icon:
                          CommunityMaterialIcons.order_alphabetical_descending,
                      text: AppLocalizations.of(context)!.myRequests,
                      onTap: () {
                        if (context.router.current.isActive) {
                          controller.close();
                        }
                        context.router.push(const MyRequestScreenRoute());
                      })
                  : const SizedBox.shrink(),
              GeneralSlidingPanelItem(
                  icon: Icons.favorite,
                  text: AppLocalizations.of(context)!.profileMenuFavoriteTitle,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.push(const BookmarksScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.filter_alt,
                  text: AppLocalizations.of(context)!.myFilters,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router
                        .push(const FavoriteCompositeFiltersScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.link_sharp,
                  text: AppLocalizations.of(context)!.accountReferralTitle,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.push(const ReferralScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.business_center,
                  text: AppLocalizations.of(context)!.businessProfile,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.navigate(const AccountBusinessPageRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.recent_actors,
                  text: AppLocalizations.of(context)!.accountsTitle,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.push(const AccountsListScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.settings,
                  text: AppLocalizations.of(context)!.settings,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.navigate(const SettingsScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.help_outline,
                  text: AppLocalizations.of(context)!.helpTitle,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.navigate(const HelpScreenRoute());
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
