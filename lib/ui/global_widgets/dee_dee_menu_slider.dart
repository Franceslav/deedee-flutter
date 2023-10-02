import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../model/user.dart';
import '../auth/authentication_bloc.dart';
import '../routes/app_router.gr.dart';
import 'genaral_sliding_panel/general_sliding_panel.dart';
import 'genaral_sliding_panel/general_sliding_panel_item.dart';

// DEPRECATED
class DeeDeeMenuSlider extends GeneralSlidingPanel {
  final User user;
  final BuildContext context;

  DeeDeeMenuSlider(
    this.context, {
    super.key,
    required super.controller,
    required this.user,
  }) : super(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
            generalSlidingPanelItemList: [
              GeneralSlidingPanelItem(
                icon: Icons.qr_code_scanner,
                text: AppLocalizations.of(context)!.qrScanner,
                onTap: () async {
                  context.router.navigate(const BookmarkQRScannerRoute());
                },
              ),
              GeneralSlidingPanelItem(
                  icon: Icons.account_box,
                  text: AppLocalizations.of(context)!.profile,
                  onTap: () {
                    if (context.router.current.isActive) {
                      controller.close();
                    }
                    context.router.navigate(const AccountScreenRoute());
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
