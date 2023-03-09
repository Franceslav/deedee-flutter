import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/ui/account/account_bloc.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uuid/uuid.dart';

import '../global_widgets/profile_photo_with_badge.dart';
import 'account_popover.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State createState() => _AccountState();
}

class _AccountState extends State<AccountScreen> {
  final PanelController _controller = PanelController();
  final Uuid uuid = const Uuid();
  late String cityChoose;
  late List<String> places;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.accountTitle,
          controller: _controller),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: ProfilePhotoWithBadge(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.fullName()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.email),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('0.00'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      splashColor: Colors.indigo,
                      splashRadius: 20,
                      onPressed: () {
                        context.read<AccountBloc>().uudiURL(user.email);
                        context.read<AccountBloc>().showToast(context);
                      },
                      icon: const Icon(
                        Icons.link_sharp,
                      )),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(COLOR_PRIMARY),
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                          color: Color(COLOR_PRIMARY),
                        ),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.accountVerify,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      context.router.push(const VerifyScreenRoute());
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(COLOR_PRIMARY),
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                          color: Color(COLOR_PRIMARY),
                        ),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.accountPremium,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Popover();
                        },
                      ).then((value) {
                        setState(() {});
                      });
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(COLOR_PRIMARY),
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                          color: Color(COLOR_PRIMARY),
                        ),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.accountTopUp,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      context.router.push(const TopUpPageRoute());
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 30.0, left: 30.0, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          context.read<AccountBloc>().changeLocal('en');
                        },
                        iconSize: 50,
                        icon: Image.asset('assets/images/en.png')),
                    IconButton(
                        onPressed: () {
                          context.read<AccountBloc>().changeLocal('ru');
                        },
                        iconSize: 50,
                        icon: Image.asset('assets/images/ru.png')),
                    IconButton(
                        onPressed: () {
                          context.read<AccountBloc>().changeLocal('pl');
                        },
                        iconSize: 50,
                        icon: Image.asset('assets/images/pl.png')),
                    IconButton(
                        onPressed: () {
                          context.read<AccountBloc>().changeLocal('es');
                        },
                        iconSize: 50,
                        icon: Image.asset('assets/images/es.png')),
                    IconButton(
                        onPressed: () {
                          context.read<AccountBloc>().changeLocal('ar');
                        },
                        iconSize: 50,
                        icon: Image.asset('assets/images/ar.png'))
                  ],
                ),
              ),
            ],
          ),
          DeeDeeMenuSlider(
            context,
            controller: _controller,
            user: user,
          )
        ],
      ),
    );
  }
}
