import 'dart:async';

import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/home/home_bloc.dart';
import 'package:deedee/ui/place_tag/place_tag_screen.dart';
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
    checkGps();
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
                  push(
                      context,
                      const PlaceTagScreen(
                      ));
                }),
                DeeDeeButton(AppLocalizations.of(context)!.seeTags, () {
                  push(
                      context,
                      const FilterPage(
                      ));
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

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // showSnackBar(context, 'Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          // showSnackBar(context, 'Location permissions are permanently denied');
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        getLocation();
      }
    } else {
      // showSnackBar(context, 'GPS Service is not enabled, turn on GPS location');
    }
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      BlocProvider.of<UserBloc>(context).add(UserSetLastGeolocation(
          LatLng(position.latitude, position.longitude)));
    });
  }
}
