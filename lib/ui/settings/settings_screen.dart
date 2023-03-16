import 'package:auto_route/auto_route.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/settings/connection_settings/connection_settings_screen.dart';
import 'package:deedee/ui/settings/settings_cubit.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final PanelController _controller = PanelController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return BlocProvider<SettingsCubit>(
        create: (context) => SettingsCubit(),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: DeeDeeAppBar(
              title: AppLocalizations.of(context)!.settings,
              controller: _controller,
              child: const ProfilePhotoWithBadge(),
            ),
            body: Stack(
              children: [
                SettingsList(
                  sections: [
                    SettingsSection(
                      title: const Text('Connection'),
                      tiles: [
                        SettingsTile(
                          title: const Text('IP Address / Port'),
                          leading: const Icon(Icons.settings_ethernet),
                          onPressed: (BuildContext context) {
                            context.router
                                .replace(const ConnectionSettingsScreenRoute());
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: const Text('Security'),
                      tiles: [
                        SettingsTile.switchTile(
                          title: const Text('Use fingerprint'),
                          leading: const Icon(Icons.fingerprint),
                          onToggle: (value) {},
                          initialValue: null,
                        ),
                      ],
                    ),
                  ],
                ),
                DeeDeeMenuSlider(
                  context,
                  controller: _controller,
                  user: user,
                ),
              ],
            ),
          );
        }));
  }
}
