import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/page/account/account_bloc.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AccountLanguageScreen extends StatefulWidget {
  const AccountLanguageScreen({super.key});

  @override
  State<AccountLanguageScreen> createState() => _AccountLanguageScreenState();
}

class _AccountLanguageScreenState extends State<AccountLanguageScreen> {
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: locale.profile,
        controller: _controller,
        child: const Icon(Icons.menu),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              //  mainAxisAlignment: MainAxisAlignment.center,
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
                      context.read<AccountBloc>().changeLocal('ky');
                    },
                    iconSize: 50,
                    icon: Image.asset('assets/images/ky.png')),
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
                    icon: Image.asset('assets/images/ar.png')),
                IconButton(
                    onPressed: () {
                      context.read<AccountBloc>().changeLocal('am');
                    },
                    iconSize: 50,
                    icon: Image.asset('assets/images/am.png')),
                IconButton(
                    onPressed: () {
                      context.read<AccountBloc>().changeLocal('uk');
                    },
                    iconSize: 50,
                    icon: Image.asset('assets/images/uk.png')),
                IconButton(
                    onPressed: () {
                      context.read<AccountBloc>().changeLocal('pt');
                    },
                    iconSize: 50,
                    icon: Image.asset('assets/images/pt.png')),
                IconButton(
                    onPressed: () {
                      context.read<AccountBloc>().changeLocal('fr');
                    },
                    iconSize: 50,
                    icon: Image.asset('assets/images/fr.png')),
                      context.read<AccountBloc>().changeLocal('he');
                    },
                    iconSize: 50,
                    icon: Image.asset('assets/images/he.png')),
              ],
            ),
          ),
          DeeDeeMenuSlider(
            context,
            controller: _controller,
            user: user,
          ),
        ],
      ),
    );
  }
}
