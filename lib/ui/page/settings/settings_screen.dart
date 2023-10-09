import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/auth/biometric/bloc/biometric_bloc.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/page/account/account_language_dropdown.dart';
import 'package:deedee/ui/page/settings/settings_cubit.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/colors.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../auth/authentication_bloc.dart';
import '../../auth/biometric/biometric_prefs.dart';
import '../../global_widgets/profile_menu_slider.dart';
import '../account/account_popover.dart';
import '../account/utils/payment_method_list_widget.dart';

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
                child: const Icon(Icons.menu),
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
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(children: [
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.lightgrey,
                                  prefixIcon: Image.asset(
                                      'assets/images/search_icon.png'),
                                  hintText:
                                      AppLocalizations.of(context)!.search,
                                  hintStyle:
                                      const TextStyle(color: AppColors.grey),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              ListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.notification),
                                trailing: Image.asset(
                                    'assets/images/chevron_right_icon.png'),
                                onTap: () {},
                              ),
                              ListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.addAccount),
                                trailing: Image.asset(
                                    'assets/images/chevron_right_icon.png'),
                                onTap: () {},
                              ),
                              ListTile(
                                title: Text(AppLocalizations.of(context)!
                                    .useFingerprint),
                                trailing: Image.asset(
                                    'assets/images/chevron_right_icon.png'),
                                onTap: () {
                                  context.read<BiometricBloc>().add(
                                      ToggleBiometric(biometric: biometric));
                                },
                              ),
                              ListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.logout,
                                    style: TextStyle(color: AppColors.red)),
                                onTap: () {
                                  context
                                      .read<AuthenticationBloc>()
                                      .add(LogoutEvent());
                                  context.router
                                      .replace(const LoginScreenRoute());
                                },
                              ),
                              ListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.deleteAccount,
                                    style: TextStyle(color: AppColors.grey)),
                                onTap: () {},
                              ),
                            ]),
                          ),
                          ProfileMenuSlider(
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
