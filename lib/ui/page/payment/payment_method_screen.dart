import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/page/add_card/add_card_screen.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';

import '../../user_bloc/user_bloc.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    return Scaffold(
        appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.paymentPageTitle,
          controller: _controller,
          child: const ProfilePhotoWithBadge(),
        ),
        body: Stack(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Card'),
              onPressed: () {
                context.router.navigate(const CardScreenRoute());
              },
            ),
            DeeDeeMenuSlider(
              context,
              controller: _controller,
              user: user,
            ),
          ],
        ));
  }
}
