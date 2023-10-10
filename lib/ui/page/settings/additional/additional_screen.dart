import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_menu_slider.dart';
import 'package:deedee/ui/page/account/account_language_dropdown.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdditionalScreen extends StatefulWidget {
  const AdditionalScreen({super.key});

  @override
  State<AdditionalScreen> createState() => _AdditionalScreenState();
}

class _AdditionalScreenState extends State<AdditionalScreen> {
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
        appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.additionalSettings,
          controller: _controller,
          child: const Icon(Icons.menu),
        ),
        body: Stack(
          children: [
            ListTile(
              title: LanguagesExpansionTile(),
            ),
            ProfileMenuSlider(
              context,
              controller: _controller,
              user: user,
            ),
          ],
        ));
  }
}
