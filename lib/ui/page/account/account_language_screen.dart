import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../global_widgets/dee_dee_menu_slider.dart';
import '../../global_widgets/profile_menu_slider.dart';
import 'account_language_dropdown.dart';

class AccountLanguageScreen extends StatefulWidget {
  const AccountLanguageScreen({super.key});

  @override
  State<AccountLanguageScreen> createState() => _AccountLanguageScreenState();
}

class _AccountLanguageScreenState extends State<AccountLanguageScreen> {
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: locale.profile,
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: Stack(
        children: [
          LanguagesExpansionTile(),
          ProfileMenuSlider(
            context,
            controller: _controller,
            user: user,
          ),
        ],
      ),
    );
  }
}
