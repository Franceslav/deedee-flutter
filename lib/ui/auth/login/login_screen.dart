import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/verification.pb.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/auth/biometric/biometric_prefs.dart';
import 'package:deedee/ui/auth/biometric/bloc/biometric_bloc.dart';
import 'package:deedee/ui/auth/login/login_bloc.dart';
import 'package:deedee/ui/auth/login/password_visibility/bloc/password_visibility_bloc.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_auth/local_auth.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart' as apple;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String? email, password;
  late bool _obscureText;
  bool biometric = BiometricPrefs().userBiometric;
  late int tries;

  @override
  Widget build(BuildContext context) {
    _obscureText = PasswordVisibilityBloc().showPassword;
    tries = BiometricBloc().tries;
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
                color: isDarkMode(context) ? Colors.white : Colors.black),
            elevation: 0.0,
          ),
          body: MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) async {
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
                                .couldLoginPleaseTryAgain);
                  }
                },
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is ValidLoginFields) {
                    showProgress(
                        context,
                        AppLocalizations.of(context)!.loggingInPleaseWait,
                        false);
                    context.read<AuthenticationBloc>().add(
                          LoginWithEmailAndPasswordEvent(
                            email: email!,
                            password: password!,
                          ),
                        );
                  }
                },
              ),
              BlocListener<BiometricBloc, BiometricState>(
                  listener: (context, state) {
                if (state is BiometricTriesExceededState) {
                  biometric = false;
                }
              })
            ],
            child: BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (old, current) =>
                  current is LoginFailureState && old != current,
              builder: (context, state) {
                if (state is LoginFailureState) {
                  _validate = AutovalidateMode.onUserInteraction;
                }
                return Form(
                  key: _key,
                  autovalidateMode: _validate,
                  child: ListView(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 32.0, right: 16.0, left: 16.0),
                        child: Text(
                          AppLocalizations.of(context)!.signInTitle,
                          style: TextStyle(
                              color: Color(COLOR_PRIMARY),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, right: 24.0, left: 24.0),
                        child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            textInputAction: TextInputAction.next,
                            validator: validateEmail,
                            onSaved: (String? val) {
                              email = val;
                            },
                            style: const TextStyle(fontSize: 18.0),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: const Color(COLOR_PRIMARY),
                            decoration: getInputDecoration(
                                hint: AppLocalizations.of(context)!
                                    .emailAddressTitle,
                                darkMode: isDarkMode(context),
                                errorColor: Theme.of(context).errorColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, right: 24.0, left: 24.0),
                        child: BlocProvider(
                          create: (context) => PasswordVisibilityBloc(),
                          child: BlocConsumer<PasswordVisibilityBloc,
                              PasswordVisibilityState>(
                            listener: (context, state) {
                              if (state is PasswordShownState) {
                                _obscureText = !_obscureText;
                              }
                            },
                            builder: (context, state) {
                              return TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                obscureText: !_obscureText,
                                validator: validatePassword,
                                onSaved: (String? val) {
                                  password = val;
                                },
                                onFieldSubmitted: (password) => context
                                    .read<LoginBloc>()
                                    .add(ValidateLoginFieldsEvent(_key)),
                                textInputAction: TextInputAction.done,
                                style: const TextStyle(fontSize: 18.0),
                                cursorColor: const Color(COLOR_PRIMARY),
                                decoration: getInputDecoration(
                                    iconButton: BlocBuilder<
                                        PasswordVisibilityBloc,
                                        PasswordVisibilityState>(
                                      builder: (context, state) {
                                        if (_obscureText) {
                                          return IconButton(
                                              onPressed: () {
                                                context
                                                    .read<
                                                        PasswordVisibilityBloc>()
                                                    .add(
                                                        TogglePasswordShownEvent(
                                                            _obscureText));
                                              },
                                              icon:
                                                  const Icon(Icons.visibility));
                                        }
                                        return IconButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      PasswordVisibilityBloc>()
                                                  .add(TogglePasswordShownEvent(
                                                      _obscureText));
                                            },
                                            icon: const Icon(
                                                Icons.visibility_off));
                                      },
                                    ),
                                    isPasswordField: true,
                                    hint:
                                        AppLocalizations.of(context)!.password,
                                    darkMode: isDarkMode(context),
                                    errorColor: Theme.of(context).errorColor),
                              );
                            },
                          ),
                        ),
                      ),

                      /// forgot password text, navigates user to ResetPasswordScreen
                      /// and this is only visible when logging with email and password
                      Padding(
                        padding: const EdgeInsets.only(top: 16, right: 24),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => context.router
                                .replace(const ResetPasswordScreenRoute()),
                            child: Text(
                              AppLocalizations.of(context)!.forgotPassword,
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ),
                      BlocBuilder<BiometricBloc, BiometricState>(
                        builder: (context, state) {
                          if (biometric) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 40.0, left: 40.0, top: 40),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: const BorderSide(
                                        color: Color(COLOR_PRIMARY),
                                      ),
                                    ),
                                    primary: const Color(COLOR_PRIMARY),
                                  ),
                                  child: const Icon(Icons.fingerprint),
                                  onPressed: () {
                                    email = BiometricPrefs().userEmail;
                                    password = BiometricPrefs().userPassword;
                                    context
                                        .read<BiometricBloc>()
                                        .add(BiometricTriesEvent(tries: tries));
                                    context.read<AuthenticationBloc>().add(
                                          LoginWithBiometricEvent(
                                            email: email!,
                                            password: password!,
                                            cancelButton:
                                                AppLocalizations.of(context)!
                                                    .cancelFingerPrint,
                                            localizedReason:
                                                AppLocalizations.of(context)!
                                                    .scanYourFingerprint,
                                            signInTitle:
                                                AppLocalizations.of(context)!
                                                    .oopsBiometric,
                                          ),
                                        );
                                  }),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 40.0, left: 40.0, top: 40),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: const BorderSide(
                                    color: Color(COLOR_PRIMARY),
                                  ),
                                ),
                                primary: const Color(COLOR_PRIMARY),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.signInTitle,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => context
                                  .read<LoginBloc>()
                                  .add(ValidateLoginFieldsEvent(_key)),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 40.0, left: 40.0, top: 20, bottom: 20),
                        child: TextButton(
                          child: Text(
                            AppLocalizations.of(context)!.signUpTitle,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(COLOR_PRIMARY)),
                          ),
                          onPressed: () {
                            context.router.push(const SignUpScreenRoute());
                            // context.read<WelcomeBloc>().add(SignupPressed());
                          },
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.only(top: 12, bottom: 12),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                side: const BorderSide(
                                  color: Color(COLOR_PRIMARY),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.orTitle,
                            style: TextStyle(
                                color: isDarkMode(context)
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 40.0, left: 40.0, bottom: 20),
                        child: ElevatedButton.icon(
                          label: Text(
                            AppLocalizations.of(context)!.facebookLoginTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          icon: Image.asset(
                            'assets/images/facebook_logo.png',
                            color: Colors.white,
                            height: 24,
                            width: 24,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            primary: const Color(FACEBOOK_BUTTON_COLOR),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: const BorderSide(
                                color: Color(FACEBOOK_BUTTON_COLOR),
                              ),
                            ),
                          ),
                          onPressed: () {
                            showProgress(
                                context,
                                AppLocalizations.of(context)!
                                    .loggingInPleaseWait,
                                true);
                            context.read<AuthenticationBloc>().add(
                                  LoginWithFacebookEvent(),
                                );
                          },
                        ),
                      ),
                      FutureBuilder<bool>(
                        future: apple.TheAppleSignIn.isAvailable(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator.adaptive();
                          }
                          if (!snapshot.hasData || (snapshot.data != true)) {
                            return Container();
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 40.0, left: 40.0, bottom: 20),
                              child: apple.AppleSignInButton(
                                  cornerRadius: 25.0,
                                  type: apple.ButtonType.signIn,
                                  style: isDarkMode(context)
                                      ? apple.ButtonStyle.white
                                      : apple.ButtonStyle.black,
                                  onPressed: () {
                                    showProgress(
                                        context,
                                        AppLocalizations.of(context)!
                                            .loggingInPleaseWait,
                                        false);
                                    context.read<AuthenticationBloc>().add(
                                          LoginWithAppleEvent(),
                                        );
                                  }),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
