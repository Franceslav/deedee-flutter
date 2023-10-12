import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../global_widgets/horizontal_sliding_panel/carousel_panel.dart';
class AppointmentOffersScreen extends StatefulWidget {
  const AppointmentOffersScreen({super.key});

  @override
  State<AppointmentOffersScreen> createState() =>
      _AppointmentOffersScreenState();
}

class _AppointmentOffersScreenState extends State<AppointmentOffersScreen> {
  final PanelController _controller = PanelController();
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bloc = UserBloc();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: const Color(APPBAR_SHADOW_COLOR),
        title: Text(locale.appointmentOffers),

      appBar: DeeDeeAppBar(
        title: locale.appointmentOffers,
        controller: _controller,
        child: const Icon(Icons.menu),
      ),
      body: BlocConsumer<UserBloc, UserState>(
          bloc: bloc,
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(children: [CarouselPanel()]);
            return Stack(children: [
              CarouselPanel()
            ]);
          }),
    );
  }
}
