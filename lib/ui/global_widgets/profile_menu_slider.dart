import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../model/user.dart';
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
            maxHeight: MediaQuery.of(context).size.height * 0.45,
            controller: controller,
            generalSlidingPanelItemList: [
              GeneralSlidingPanelItem(
                  icon: Icons.list,
                  text: AppLocalizations.of(context)!.userTagsTitle,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.popAndPush(const UserTagsScreenRoute());
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
                        context.router.pop();
                        context.router.push(const MyRequestScreenRoute());
                      })
                  : const SizedBox.shrink(),
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
                    context.router.popAndPush(
                        const FavoriteCompositeFiltersScreenRoute());
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
            ]);
}
