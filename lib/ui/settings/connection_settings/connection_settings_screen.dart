import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/services/locator.dart';
import 'package:deedee/services/shared.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/settings/connection_settings/connection_settings_cubit.dart';
import 'package:deedee/ui/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionSettingsScreen extends StatefulWidget {
  final User user;

  const ConnectionSettingsScreen({Key? key, required this.user})
      : super(key: key);

  @override
  _ConnectionSettingsScreenState createState() =>
      _ConnectionSettingsScreenState();
}

class _ConnectionSettingsScreenState extends State<ConnectionSettingsScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  String _ipAddress = '';
  String _port = '';

  AutovalidateMode _validate = AutovalidateMode.disabled;

  TextEditingController ipAddressController = TextEditingController(text: "127.0.0.1");
  TextEditingController portController = TextEditingController(text: "1234");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectionSettingsCubit>(
        create: (context) => ConnectionSettingsCubit(),
        child: Builder(builder: (context) {
          return WillPopScope(
              onWillPop: () async {
                return pushReplacement(
                    context, SettingsScreen(user: widget.user!));
              },
              child: Scaffold(
                drawer: DeeDeeDrawer(user: widget.user),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(
                      color: isDarkMode(context) ? Colors.white : Colors.black),
                  elevation: 0.0,
                ),
                body: BlocConsumer<ConnectionSettingsCubit,
                    ConnectionSettingsState>(
                  listenWhen: (old, current) => old != current,
                  listener: (context, state) {
                    if (state is ValidConnectionSettingsField) {
                      serviceLocator
                          .get<SharedUtils>()
                          .saveIpAddress(state.ipAddress);
                      serviceLocator.get<SharedUtils>().savePort(state.port);
                    } else if (state is ConnectionSettingsFailureState) {
                      showSnackBar(context, state.errorMessage);
                    }
                  },
                  buildWhen: (old, current) =>
                      current is ConnectionSettingsFailureState &&
                      old != current,
                  builder: (context, state) {
                    if (state is ConnectionSettingsFailureState) {
                      _validate = AutovalidateMode.onUserInteraction;
                    }
                    return Form(
                      autovalidateMode: _validate,
                      key: _key,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 32.0, right: 16.0, left: 16.0),
                              child: Text(
                                'IP Address',
                                style: TextStyle(
                                    color: Color(COLOR_PRIMARY),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            FutureBuilder(
                              future: serviceLocator
                                  .get<SharedUtils>()
                                  .getPrefsIpAddress(),
                              builder:
                                  (context, AsyncSnapshot<String?> snapshot) {
                                if (snapshot.hasData) {
                                    // _ipAddress = ;
                                    ipAddressController.text = snapshot.data!;
                                }
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 32.0, right: 24.0, left: 24.0),
                                      child: TextFormField(
                                        controller: ipAddressController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        textInputAction: TextInputAction.done,
                                        validator: validateTopic,
                                        onFieldSubmitted: (_) => context
                                            .read<ConnectionSettingsCubit>()
                                            .checkValidField(
                                                _key, _ipAddress, _port),
                                        onSaved: (val) => _ipAddress = val!,
                                        style: const TextStyle(fontSize: 18.0),
                                        keyboardType: TextInputType.name,
                                        cursorColor: const Color(COLOR_PRIMARY),
                                        decoration: getInputDecoration(
                                            hint: 'IP Address',
                                            darkMode: isDarkMode(context),
                                            errorColor:
                                                Theme.of(context).errorColor),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 32.0, right: 16.0, left: 16.0),
                              child: Text(
                                'Port',
                                style: TextStyle(
                                    color: Color(COLOR_PRIMARY),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            FutureBuilder(
                              future: serviceLocator
                                  .get<SharedUtils>()
                                  .getPrefsPort(),
                              builder:
                                  (context, AsyncSnapshot<String?> snapshot) {
                                if (snapshot.hasData) {
                                    // _port = ;
                                    portController.text = snapshot.data!;
                                }
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 32.0, right: 24.0, left: 24.0),
                                      child: TextFormField(
                                        controller: portController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        textInputAction: TextInputAction.done,
                                        validator: validateTopic,
                                        onFieldSubmitted: (_) => context
                                            .read<ConnectionSettingsCubit>()
                                            .checkValidField(
                                                _key, _ipAddress, _port),
                                        onSaved: (val) => _ipAddress = val!,
                                        style: const TextStyle(fontSize: 18.0),
                                        keyboardType: TextInputType.name,
                                        cursorColor: const Color(COLOR_PRIMARY),
                                        decoration: getInputDecoration(
                                            hint: 'Port',
                                            darkMode: isDarkMode(context),
                                            errorColor:
                                                Theme.of(context).errorColor),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 40.0, left: 40.0, top: 40),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(COLOR_PRIMARY),
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: const BorderSide(
                                        color: Color(COLOR_PRIMARY),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<ConnectionSettingsCubit>()
                                        .checkValidField(
                                            _key,
                                            ipAddressController.text,
                                            portController.text);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ));
        }));
  }
}
