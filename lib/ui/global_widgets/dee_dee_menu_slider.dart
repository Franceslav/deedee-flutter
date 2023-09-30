import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../model/user.dart';
import '../auth/authentication_bloc.dart';
import '../routes/app_router.gr.dart';
import 'genaral_sliding_panel/general_sliding_panel.dart';
import 'genaral_sliding_panel/general_sliding_panel_item.dart';

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
                onTap: () async {},
              ),
            ]);
}
