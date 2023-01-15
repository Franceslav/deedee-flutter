import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/settings/connection_settings/connection_settings_screen.dart';
import 'package:deedee/ui/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  final User user;

  const SettingsScreen({Key? key, required this.user}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
        create: (context) => SettingsCubit(),
        child: Builder(builder: (context) {
          return WillPopScope(
              onWillPop: () async {
                return pushReplacement(context, HomeScreen(user: widget.user));
              },
              child: Scaffold(
                drawer: DeeDeeDrawer(user: widget.user),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(
                      color: isDarkMode(context) ? Colors.white : Colors.black),
                  elevation: 0.0,
                ),
                body: SettingsList(
                  sections: [
                    SettingsSection(
                      title: const Text('Connection'),
                      tiles: [
                        SettingsTile(
                          title: const Text('IP Address / Port'),
                          leading: const Icon(Icons.settings_ethernet),
                          onPressed: (BuildContext context) {
                            pushReplacement(context,
                                ConnectionSettingsScreen(user: widget.user));
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
              ));
        }));
  }
}
