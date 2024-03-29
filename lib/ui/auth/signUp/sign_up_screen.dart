import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/auth/signUp/sign_up_bloc.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  File? _image;
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  String? firstName, lastName, email, password, confirmPassword;
  AutovalidateMode _validate = AutovalidateMode.disabled;
  bool acceptEULA = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(),
      child: Builder(
        builder: (context) {
          if (Platform.isAndroid) {
            context.read<SignUpBloc>().add(RetrieveLostDataEvent());
          }
          return MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  hideProgress(context);
                  if (state.authState == AuthState.authenticated) {
                    BlocProvider.of<UserBloc>(context)
                        .add(UserAuthenticated(state.user!));
                    context.router.replace(const HomeScreenRoute());
                  } else {
                    showSnackBar(
                        context,
                        state.message ??
                            AppLocalizations.of(context)!
                                .couldSignUpPleaseTryAgainTitle);
                  }
                },
              ),
              BlocListener<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state is ValidFields) {
                    showProgress(
                        context,
                        AppLocalizations.of(context)!.creatingNewAccountPleaseWaitTitle,
                        false
                    );
                    context.read<AuthenticationBloc>().add(
                        SignupWithEmailAndPasswordEvent(
                            emailAddress: email!,
                            password: password!,
                            image: _image,
                            lastName: lastName,
                            firstName: firstName));
                  } else if (state is SignUpFailureState) {
                    showSnackBar(context, state.errorMessage);
                  }
                },
              ),
            ],
            child: Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(
                    color: isDarkMode(context) ? Colors.white : Colors.black),
              ),
              body: SingleChildScrollView(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                child: BlocBuilder<SignUpBloc, SignUpState>(
                  buildWhen: (old, current) =>
                      current is SignUpFailureState && old != current,
                  builder: (context, state) {
                    if (state is SignUpFailureState) {
                      _validate = AutovalidateMode.onUserInteraction;
                    }
                    return Form(
                      key: _key,
                      autovalidateMode: _validate,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.createNewAccountTitle,
                            style: const TextStyle(
                              color: Color(COLOR_PRIMARY),
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 32, right: 8, bottom: 8),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                BlocBuilder<SignUpBloc, SignUpState>(
                                  buildWhen: (old, current) =>
                                      current is PictureSelectedState &&
                                      old != current,
                                  builder: (context, state) {
                                    if (state is PictureSelectedState) {
                                      _image = state.imageFile;
                                    }
                                    return state is PictureSelectedState
                                        ? SizedBox(
                                            height: 130,
                                            width: 130,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(65),
                                              child: state.imageFile == null
                                                  ? Image.asset(
                                                      'assets/images/placeholder.jpg',
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.file(
                                                      state.imageFile!,
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 130,
                                            width: 130,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(65),
                                              child: Image.asset(
                                                'assets/images/placeholder.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                  },
                                ),
                                Positioned(
                                  right: 110,
                                  child: FloatingActionButton(
                                    backgroundColor: const Color(COLOR_PRIMARY),
                                    mini: true,
                                    onPressed: () => _onCameraClick(context),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: isDarkMode(context)
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 8.0, left: 8.0),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.words,
                              validator: validateName,
                              onSaved: (String? val) {
                                firstName = val;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: getInputDecoration(
                                  hint: AppLocalizations.of(context)!
                                      .firstNameTitle,
                                  darkMode: isDarkMode(context),
                                  errorColor: Theme.of(context).errorColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 8.0, left: 8.0),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.words,
                              validator: validateName,
                              onSaved: (String? val) {
                                lastName = val;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: getInputDecoration(
                                  hint: AppLocalizations.of(context)!
                                      .lastNameTitle,
                                  darkMode: isDarkMode(context),
                                  errorColor: Theme.of(context).errorColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 8.0, left: 8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: validateEmail,
                              onSaved: (String? val) {
                                email = val;
                              },
                              decoration: getInputDecoration(
                                  hint: 'Email',
                                  darkMode: isDarkMode(context),
                                  errorColor: Theme.of(context).errorColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 8.0, left: 8.0),
                            child: TextFormField(
                              obscureText: true,
                              textInputAction: TextInputAction.next,
                              controller: _passwordController,
                              validator: validatePassword,
                              onSaved: (String? val) {
                                password = val;
                              },
                              style:
                                  const TextStyle(height: 0.8, fontSize: 18.0),
                              cursorColor: const Color(COLOR_PRIMARY),
                              decoration: getInputDecoration(
                                  hint: AppLocalizations.of(context)!.password,
                                  darkMode: isDarkMode(context),
                                  errorColor: Theme.of(context).errorColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 8.0, left: 8.0),
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) =>
                                  context.read<SignUpBloc>().add(
                                        ValidateFieldsEvent(_key,
                                            acceptEula: acceptEULA),
                                      ),
                              obscureText: true,
                              validator: (val) => validateConfirmPassword(
                                  _passwordController.text, val),
                              onSaved: (String? val) {
                                confirmPassword = val;
                              },
                              style:
                                  const TextStyle(height: 0.8, fontSize: 18.0),
                              cursorColor: const Color(COLOR_PRIMARY),
                              decoration: getInputDecoration(
                                  hint: AppLocalizations.of(context)!
                                      .confirmPasswordTitle,
                                  darkMode: isDarkMode(context),
                                  errorColor: Theme.of(context).errorColor),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 50.0, bottom: 20.0),
                            child: ListTile(
                              trailing: BlocBuilder<SignUpBloc, SignUpState>(
                                buildWhen: (old, current) =>
                                    current is EulaToggleState &&
                                    old != current,
                                builder: (context, state) {
                                  if (state is EulaToggleState) {
                                    acceptEULA = state.eulaAccepted;
                                  }
                                  return Checkbox(
                                    onChanged: (value) =>
                                        context.read<SignUpBloc>().add(
                                              ToggleEulaCheckboxEvent(
                                                eulaAccepted: value!,
                                              ),
                                            ),
                                    activeColor: const Color(COLOR_PRIMARY),
                                    value: acceptEULA,
                                  );
                                },
                              ),
                              title: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .byCreatingAnAccountYouAgreeTitle,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                      text:
                                          " ${AppLocalizations.of(context)!.termsOfUseTitle}",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          if (await canLaunch(EULA)) {
                                            await launch(
                                              EULA,
                                              forceSafariVC: false,
                                            );
                                          }
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 40.0, left: 40.0, top: 40.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(COLOR_PRIMARY),
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: const BorderSide(
                                    color: Color(COLOR_PRIMARY),
                                  ),
                                ),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.signUpTitle,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => context.read<SignUpBloc>().add(
                                    ValidateFieldsEvent(_key,
                                        acceptEula: acceptEULA),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _onCameraClick(BuildContext context) {
    final action = CupertinoActionSheet(
      title: Text(
        AppLocalizations.of(context)!.addProfilePictureTitle,
        style: const TextStyle(fontSize: 15.0),
      ),
      actions: [
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            context.router.pop();
            context.read<SignUpBloc>().add(ChooseImageFromGalleryEvent());
          },
          child: Text(AppLocalizations.of(context)!.chooseFromGalleryTitle),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            context.router.pop();
            context.read<SignUpBloc>().add(CaptureImageByCameraEvent());
          },
          child: Text(AppLocalizations.of(context)!.takePictureTitle),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context)!.cancelTitle),
          onPressed: () => context.router.pop()),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _image = null;
    super.dispose();
  }
}
