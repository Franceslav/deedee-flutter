import 'package:deedee/constants.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/services/shared.dart';
import 'package:deedee/ui/page/settings/upload_settings/upload_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadSettingsScreen extends StatefulWidget {
  const UploadSettingsScreen({super.key});

  @override
  State<UploadSettingsScreen> createState() =>
      _UploadSettingsScreenState();
}

class _UploadSettingsScreenState extends State<UploadSettingsScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  String _host = 'localhost';
  String _port = '80';

  AutovalidateMode _validate = AutovalidateMode.disabled;

  final TextEditingController _ipAddressController = TextEditingController();
  final TextEditingController _portController = TextEditingController();
  final _sharedUtils = locator.get<SharedUtils>();

  @override
  void initState() {
    super.initState();
    _ipAddressController.text = _sharedUtils.getUploadPhotoServiceIpAddress() ?? "null";
    _portController.text = _sharedUtils.getUploadPhotoServicePort() ?? "null";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadSettingsCubit>(
        create: (context) => UploadSettingsCubit(),
        child: Builder(builder: (context) {
          return WillPopScope(
              onWillPop: () async => true,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(
                      color: isDarkMode(context) ? Colors.white : Colors.black),
                  elevation: 0.0,
                ),
                body: BlocConsumer<UploadSettingsCubit,
                    UploadSettingsState>(
                  listenWhen: (old, current) => old != current,
                  listener: (context, state) {
                    if (state is ValidUploadSettingsField) {
                      _sharedUtils.saveUploadPhotoServiceIpAddress(state.host);
                      _sharedUtils.saveUploadPhotoServicePort(state.port);
                    } else if (state is UploadSettingsFailureState) {
                      showSnackBar(context, state.errorMessage);
                    }
                  },
                  buildWhen: (old, current) =>
                      current is UploadSettingsFailureState &&
                      old != current,
                  builder: (context, state) {
                    if (state is UploadSettingsFailureState) {
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
                                'Host/IP Address of Photo Upload Service',
                                style: TextStyle(
                                    color: Color(COLOR_PRIMARY),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, right: 24.0, left: 24.0),
                                  child: TextFormField(
                                    controller: _ipAddressController,
                                    textAlignVertical:
                                    TextAlignVertical.center,
                                    textInputAction: TextInputAction.done,
                                    validator: validateTopic,
                                    onFieldSubmitted: (_) => context
                                        .read<UploadSettingsCubit>()
                                        .checkValidField(
                                        _key, _host, _port),
                                    onSaved: (val) => _host = val!,
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
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 32.0, right: 16.0, left: 16.0),
                              child: Text(
                                'Port of Photo Upload Service',
                                style: TextStyle(
                                    color: Color(COLOR_PRIMARY),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, right: 24.0, left: 24.0),
                                  child: TextFormField(
                                    controller: _portController,
                                    textAlignVertical:
                                    TextAlignVertical.center,
                                    textInputAction: TextInputAction.done,
                                    validator: validateTopic,
                                    onFieldSubmitted: (_) => context
                                        .read<UploadSettingsCubit>()
                                        .checkValidField(
                                        _key, _host, _port),
                                    onSaved: (val) => _port = val!,
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
                                        .read<UploadSettingsCubit>()
                                        .checkValidField(
                                            _key,
                                            _ipAddressController.text,
                                            _portController.text);
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
