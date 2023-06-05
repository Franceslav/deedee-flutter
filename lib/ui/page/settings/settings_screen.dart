import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/auth/biometric/bloc/biometric_bloc.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/page/account/account_language_dropdown.dart';
import 'package:deedee/ui/page/settings/settings_cubit.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../auth/biometric/biometric_prefs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final PanelController _controller = PanelController();
  final GlobalKey<FormState> _key = GlobalKey();
  bool biometric = BiometricPrefs().userBiometric;

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
              body: BlocProvider(
                  create: (context) => BiometricBloc(),
                  child: BlocConsumer<BiometricBloc, BiometricState>(
                    listener: (context, state) {
                      if (state is BiometricOn) {
                        biometric = !biometric;
                      }
                    },
                    builder: (context, state) {
                      return Stack(
                        children: [
                          SettingsList(
                            sections: [
                              SettingsSection(
                                title: Text(AppLocalizations.of(context)!
                                    .connectionSettings),
                                tiles: [
                                  SettingsTile(
                                    title: Text(AppLocalizations.of(context)!
                                        .settingIpAddressPort),
                                    leading:
                                        const Icon(Icons.settings_ethernet),
                                    onPressed: (BuildContext context) {
                                      context.router.replace(
                                          const ConnectionSettingsScreenRoute());
                                    },
                                  ),
                                  SettingsTile(
                                    title: const Text('Photo upload host'),
                                    leading: const Icon(Icons.upload_sharp),
                                    onPressed: (BuildContext context) {
                                      context.router.replace(
                                          const UploadSettingsScreenRoute());
                                    },
                                  ),
                                ],
                              ),
                              SettingsSection(
                                title: const Text('Security'),
                                tiles: [
                                  SettingsTile.switchTile(
                                    title: Text(AppLocalizations.of(context)!
                                        .useFingerprint),
                                    leading: const Icon(Icons.fingerprint),
                                    onToggle: (biometric) {
                                      context.read<BiometricBloc>().add(
                                          ToggleBiometric(
                                              biometric: biometric));
                                    },
                                    initialValue: biometric,
                                  ),
                                ],
                              ),
                              SettingsSection(
                                title: const Text('Language'),
                                tiles: [
                                  SettingsTile(
                                    title: LanguagesExpansionTile(),
                                  ),
                                ],
                              )
                            ],
                          ),
                          DeeDeeMenuSlider(
                            context,
                            controller: _controller,
                            user: user,
                          ),
                        ],
                      );
                    },
                  )));
        }));
  }
}
