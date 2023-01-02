import 'dart:math';

import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/account/account_screen.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/drawer/deedee_drawer_cubit.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../auth/welcome/welcome_screen.dart';

class DeeDeeDrawer extends StatefulWidget {
  final User user;

  const DeeDeeDrawer({Key? key, required this.user}) : super(key: key);

  @override
  State createState() => _DrawerState();
}

class _DrawerState extends State<DeeDeeDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeedeeDrawerCubit>(
        create: (context) => DeedeeDrawerCubit(),
        child: Builder(builder: (context) {
          return SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.60, // 15% of screen will be occupied
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      child: Text(
                        widget.user.accountType.stringType(context),
                        style: const TextStyle(color: Colors.white),
                      ),
                      decoration: const BoxDecoration(
                        color: Color(COLOR_PRIMARY),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.homeTitle,
                        style: const TextStyle(color: Colors.black),
                      ),
                      leading: Transform.rotate(
                          angle: 0,
                          child: const Icon(Icons.home, color: Colors.black)),
                      onTap: () {
                        pushReplacement(context, HomeScreen(user: widget.user));
                      },
                    ),
                    ExpansionTile(
                      title: Text(
                        AppLocalizations.of(context)!.accountTitle,
                      ),
                      leading: Transform.rotate(
                          angle: 0,
                          child: const Icon(Icons.account_balance_wallet,
                              color: Colors.black)),
/*                  onTap: () {
                    pushReplacement(context, HomeScreen(user: widget.user));
                  },*/
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    AppLocalizations.of(context)!
                                        .accountMoneyTitle,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  leading: Transform.rotate(
                                      angle: pi * 2,
                                      child: const Icon(Icons.account_box,
                                          color: Colors.black)),
                                  onTap: () {
                                    pushReplacement(context,
                                        AccountScreen(user: widget.user));
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    AppLocalizations.of(context)!.switchTo +
                                        ' ' +
                                        widget.user.accountType
                                            .switchAccountStringType(context),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  leading: Transform.rotate(
                                      angle: pi * 2,
                                      child: const Icon(
                                          Icons.rotate_left_rounded,
                                          color: Colors.black)),
                                  onTap: () {
                                    switch (widget.user.accountType) {
                                      case AccountType.buy:
                                        widget.user.accountType =
                                            AccountType.sell;
                                        break;
                                      case AccountType.sell:
                                        widget.user.accountType =
                                            AccountType.buy;
                                    }
                                    pushReplacement(
                                        context, HomeScreen(user: widget.user));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.settings,
                        style: const TextStyle(color: Colors.black),
                      ),
                      leading: Transform.rotate(
                          angle: pi / 1,
                          child:
                              const Icon(Icons.settings, color: Colors.black)),
                      onTap: () {
                        pushReplacement(
                            context, SettingsScreen(user: widget.user));
                      },
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.logout,
                        style: const TextStyle(color: Colors.black),
                      ),
                      leading: Transform.rotate(
                          angle: pi / 1,
                          child: const Icon(Icons.exit_to_app,
                              color: Colors.black)),
                      onTap: () {
                        pushReplacement(context,
                            WelcomeScreen());
                      },
                    ),
                  ],
                ),
              ));
        }));
  }
}
