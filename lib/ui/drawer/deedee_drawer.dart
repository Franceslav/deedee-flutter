import 'dart:math';
import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/account/account_screen.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/auth/login/login_screen.dart';
import 'package:deedee/ui/bookmarks/bookmarks_screen.dart';
import 'package:deedee/ui/drawer/deedee_drawer_cubit.dart';
import 'package:deedee/ui/help/help_screen.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/referral/referral_screen.dart';
import 'package:deedee/ui/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

class DeeDeeDrawer extends StatefulWidget {
  final User user;

  const DeeDeeDrawer({Key? key, required this.user}) : super(key: key);

  @override
  State createState() => _DrawerState();
}

class _DrawerState extends State<DeeDeeDrawer> {
  final uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeedeeDrawerCubit>(
      create: (context) => DeedeeDrawerCubit(),
      child: Builder(
        builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width *
                0.60, // 15% of screen will be occupied
            child: Drawer(
              child: Column(
                children: [
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(COLOR_PRIMARY),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Image.network(
                                  widget.user.profilePictureURL,
                                  fit: BoxFit.cover,
                                  errorBuilder: (ctx, error, _) {
                                    return ClipOval(
                                      child: Image.asset(
                                        'assets/images/placeholder.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${widget.user.firstName} ${widget.user.lastName}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<DeedeeDrawerCubit>()
                                      .uudiURL(widget.user.email);
                                  context
                                      .read<DeedeeDrawerCubit>()
                                      .showToast(context);
                                },
                                icon: const Icon(Icons.insert_link_sharp,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          if (!widget.user.isVerified)
                            Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .userNotVerifiedMessage,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          Text(
                            widget.user.accountType.stringType(context),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                '${AppLocalizations.of(context)!.balanceTitle}: ${widget.user.balance.toStringAsFixed(2)}\$',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () async {
                                  final currentBalance = await context
                                      .read<DeedeeDrawerCubit>()
                                      .getBalance(widget.user.userID);
                                  setState(() {
                                    widget.user.balance = currentBalance;
                                  });
                                },
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${AppLocalizations.of(context)!.availableTagsTitle}: ${widget.user.availableTags}',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              AppLocalizations.of(context)!.homeTitle,
                              style: const TextStyle(color: Colors.black),
                            ),
                            leading: Transform.rotate(
                                angle: 0,
                                child: const Icon(Icons.home,
                                    color: Colors.black)),
                            onTap: () {
                              pushReplacement(
                                  context, HomeScreen(user: widget.user));
                            },
                          ),
                          ListTile(
                            title: Text(
                              AppLocalizations.of(context)!.bookmarksTitle,
                              style: const TextStyle(color: Colors.black),
                            ),
                            leading: Transform.rotate(
                              angle: 0,
                              child: const Icon(Icons.bookmark,
                                  color: Colors.black),
                            ),
                            onTap: () {
                              pushReplacement(
                                context,
                                BookmarksScreen(user: widget.user),
                              );
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
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
                                          style: const TextStyle(
                                              color: Colors.black),
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
                                          '${AppLocalizations.of(context)!.switchTo} ${widget.user.accountType.switchAccountStringType(context)}',
                                          style: const TextStyle(
                                              color: Colors.black),
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
                                          pushReplacement(context,
                                              HomeScreen(user: widget.user));
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                          AppLocalizations.of(context)!
                                              .accountReferralTitle,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        leading: Transform.rotate(
                                            angle: pi * 2,
                                            child: const Icon(Icons.link_sharp,
                                                color: Colors.black)),
                                        onTap: () {
                                          pushReplacement(
                                              context,
                                              ReferralScreen(
                                                  user: widget.user));
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
                                child: const Icon(Icons.settings,
                                    color: Colors.black)),
                            onTap: () {
                              pushReplacement(
                                  context, SettingsScreen(user: widget.user));
                            },
                          ),
                          ListTile(
                            title: Text(
                              AppLocalizations.of(context)!.helpTitle,
                              style: const TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(Icons.help_outline,
                                color: Colors.black),
                            onTap: () {
                              pushReplacement(
                                  context, HelpScreen(user: widget.user));
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
                              context
                                  .read<AuthenticationBloc>()
                                  .add(LogoutEvent());
                              pushReplacement(context, const LoginScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
