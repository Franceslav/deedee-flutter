import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/ui/page/account/account_popover.dart';
import 'package:deedee/ui/page/account/utils/payment_method_list_widget.dart';
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
                  icon: Icons.settings,
                  text: AppLocalizations.of(context)!.settings,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.navigate(const SettingsScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.person_outline,
                  text: AppLocalizations.of(context)!.profileInfo,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.navigate(const SettingsScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.favorite_border,
                  text: AppLocalizations.of(context)!.profileMenuFavoriteTitle,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router
                        .push(const FavoriteCompositeFiltersScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.filter_alt,
                  text: AppLocalizations.of(context)!.myFilters,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.push(const ReferralScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.timeline_outlined,
                  text: AppLocalizations.of(context)!.statistic,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router
                        .push(const FavoriteCompositeFiltersScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.article,
                  text: AppLocalizations.of(context)!.reviews,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router
                        .push(const FavoriteCompositeFiltersScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.shopping_cart_outlined,
                  text: AppLocalizations.of(context)!.orders,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router
                        .push(const FavoriteCompositeFiltersScreenRoute());
                  }),
              GeneralSlidingPanelItem(
                  icon: Icons.check,
                  text: AppLocalizations.of(context)!.verification,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router
                        .push(const FavoriteCompositeFiltersScreenRoute());
                  }),
            ]);
}
