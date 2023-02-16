import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/account/account_screen.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/auth/login/login_screen.dart';
import 'package:deedee/ui/bookmarks/bookmarks_screen.dart';
import 'package:deedee/ui/drawer/deedee_drawer_cubit.dart';
import 'package:deedee/ui/drawer/drawer_button.dart';
import 'package:deedee/ui/help/help_screen.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/referral/referral_screen.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/settings/settings_screen.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';
import '../global widgets/profile_photo_with_badge.dart';

class DeeDeeDrawer extends StatefulWidget {
  const DeeDeeDrawer({super.key});

  @override
  State createState() => _DrawerState();
}

class _DrawerState extends State<DeeDeeDrawer> {
  final uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
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
                              ProfilePhotoWithBadge(user: user),
                              Expanded(
                                child: Text(
                                  user.fullName(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<DeedeeDrawerCubit>()
                                      .uudiURL(user.email);
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
                          if (user.emailVerification ==
                                  EmailVerificationStatus.unverified &&
                              user.docVerification ==
                                  DocVerificationStatus.unverified)
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
                            user.accountType.stringType(context),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Row(
                            children: [
                              Text(
                                '${AppLocalizations.of(context)!.balanceTitle}: ${user.balance.toStringAsFixed(2)}\$',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () async {
                                  BlocProvider.of<UserBloc>(context)
                                      .add(UserGetBalance());
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
                            '${AppLocalizations.of(context)!.availableTagsTitle}: ${user.availableTags}',
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
                          DrawerButton(
                            text: AppLocalizations.of(context)!.homeTitle,
                            iconData: Icons.home,
                            onTap: () {
                              context.router.push(const HomeScreenRoute());
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
                                      DrawerButton(
                                        text: AppLocalizations.of(context)!
                                            .accountMoneyTitle,
                                        iconData: Icons.account_box,
                                        onTap: () {
                                          context.router.replace(
                                              const AccountScreenRoute());
                                        },
                                      ),
                                      DrawerButton(
                                        text:
                                            '${AppLocalizations.of(context)!.switchTo} ${user.accountType.switchAccountStringType(context)}',
                                        iconData: Icons.rotate_left_rounded,
                                        onTap: () {
                                          switch (user.accountType) {
                                            case AccountType.buy:
                                              BlocProvider.of<UserBloc>(context)
                                                  .add(UserSwitchAccountType(
                                                      AccountType.sell));
                                              break;
                                            case AccountType.sell:
                                              BlocProvider.of<UserBloc>(context)
                                                  .add(UserSwitchAccountType(
                                                      AccountType.buy));
                                              break;
                                          }
                                          context.router
                                              .replace(const HomeScreenRoute());
                                        },
                                      ),
                                      DrawerButton(
                                        text: AppLocalizations.of(context)!
                                            .bookmarksTitle,
                                        iconData: Icons.bookmark,
                                        onTap: () {
                                          context.router.replace(
                                              const BookmarksScreenRoute());
                                        },
                                      ),
                                      DrawerButton(
                                        text: AppLocalizations.of(context)!
                                            .accountReferralTitle,
                                        iconData: Icons.link_sharp,
                                        onTap: () {
                                          context.router.replace(
                                              const ReferralScreenRoute());
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DrawerButton(
                            text: AppLocalizations.of(context)!.settings,
                            iconData: Icons.settings,
                            onTap: () {
                              context.router
                                  .replace(const SettingsScreenRoute());
                            },
                          ),
                          DrawerButton(
                            text: AppLocalizations.of(context)!.helpTitle,
                            iconData: Icons.help_outline,
                            onTap: () {
                              context.router.replace(const HelpScreenRoute());
                            },
                          ),
                          DrawerButton(
                            text: AppLocalizations.of(context)!.logout,
                            iconData: Icons.exit_to_app,
                            onTap: () {
                              context
                                  .read<AuthenticationBloc>()
                                  .add(LogoutEvent());

                              context.router.replace(const LoginScreenRoute());
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
