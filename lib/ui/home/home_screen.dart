import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/gps.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/home/home_bloc.dart';
import 'package:deedee/ui/main_topic/enum/topic_screens_enum.dart';
import 'package:deedee/ui/main_topic/main_topic_screen.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  void initState() {
    locator.get<GPSUtils>().checkGps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final List<Map> topics = [
      {"color": Colors.red, "title": "Рабочие"},
      {
        "color": Colors.pink,
        "title": "Авто",
      },
      {
        "color": Colors.green,
        "title": "Бьюти",
      },
      {
        "color": Colors.orange,
        "title": "Отделка",
      },
      {
        "color": Colors.deepPurple,
        "title": "Дети",
      },
      {
        "color": Colors.blue,
        "title": "Клининг",
      },
    ];
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: Scaffold(
        drawer: const DeeDeeDrawer(),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.homeTitle,
          ),
        ),
        body: BlocConsumer<HomeBloc, HomePageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeFailureState) {
              // _validate = AutovalidateMode.onUserInteraction;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DeeDeeButton(AppLocalizations.of(context)!.placeBid, () {
                  context.router.push(
                      MainTopicPageRoute(screenType: ScreenType.placeTags));
                }),
                DeeDeeButton(AppLocalizations.of(context)!.seeTags, () {
                  context.router.push(
                      MainTopicPageRoute(screenType: ScreenType.filterTags));
                }),
              ],
            );
          },
        ),
      ),
    );
  }

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
}
