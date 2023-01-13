import 'dart:async';

import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/home/filter_box/filter_box.dart';
import 'package:deedee/ui/home/home_bloc.dart';
import 'package:deedee/ui/place_bid/place_bid_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late User user;

  @override
  void initState() {
    checkGps();
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: Scaffold(
        drawer: DeeDeeDrawer(user: user),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.homeTitle,
            style: const TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: BlocConsumer<HomeBloc, HomePageState>(
          listener: (context, state) {
            if (state is HomePageChangeState) {
              setState(() {
                user.selectedTopic = state.topic;
              });
            }
          },
          builder: (context, state) {
            if (state is HomeFailureState) {
              // _validate = AutovalidateMode.onUserInteraction;
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, right: 10.0, left: 10.0),
                      child: FilterBox(user: widget.user),
                    ),
                  ),
                  DeeDeeButton(AppLocalizations.of(context)!.placeBid, () {
                    pushReplacement(
                        context,
                        PlaceBidScreen(
                          user: user,
                        ));
                  }),
                  DeeDeeButton(AppLocalizations.of(context)!.seeMap, () {
                    pushReplacement(
                        context,
                        FilterPage(
                          user: user,
                        ));
                  }),
                ],
              ),
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
      widget.user.lastGeoLocation =
          LatLng(position.latitude, position.longitude);
    });

    widget.user.lastGeoLocation = LatLng(position.latitude, position.longitude);
  }
}
