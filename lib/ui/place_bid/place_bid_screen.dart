import 'dart:async';

import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/place_bid/place_tag_bloc.dart';
import 'package:deedee/ui/place_bid/place_tag_filter_box/filter_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';

class PlaceBidScreen extends StatefulWidget {
  final User user;

  const PlaceBidScreen({Key? key, required this.user}) : super(key: key);

  @override
  _PlaceBidScreenState createState() => _PlaceBidScreenState();
}

class _PlaceBidScreenState extends State<PlaceBidScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String _messengerId = 'ronxbysu', _topic = '';
  late double _lat, _lon;

  late Map<String, bool> _filterMap;

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;

  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    checkGps();
    super.initState();
  }

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
        setState(() {});

        getLocation();
      }
    } else {
      // showSnackBar(context, 'GPS Service is not enabled, turn on GPS location');
    }

    setState(() {});
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    _lon = position.longitude;
    _lat = position.latitude;

    setState(() {});

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      _lon = position.longitude;
      _lat = position.latitude;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlaceTagBloc>(
      create: (context) => PlaceTagBloc(widget.user),
      child: Builder(
        builder: (context) {
          return WillPopScope(
              child: Scaffold(
                drawer: DeeDeeDrawer(user: widget.user),
                appBar: AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.placeBidPageTitle,
                    style: const TextStyle(color: Colors.black),
                  ),
                  iconTheme: const IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                ),
                body: BlocConsumer<PlaceTagBloc, PlaceTagState>(
                  listenWhen: (old, current) => old != current,
                  listener: (context, state) {
                    if (state is PlaceTagFilterChangeState) {
                      setState(() {
                        _filterMap = state
                            .predefinedFilterActiveMap; //TODO: pass filtered map
                      });
                    } else if (state is PlaceTagDone) {
                      context.read<LoadingCubit>().hideLoading();
                      showSnackBar(context,
                          AppLocalizations.of(context)!.tagPlacedCheckTheMap);
                      // Navigator.pop(context);
                    } /*else if (state is ValidPlaceBidField) {
                      context.read<LoadingCubit>().showLoading(context,
                          AppLocalizations.of(context)!.placingTag, false);
                      context
                          .read<PlaceTagBloc>()
                          .placeBid(_topic, _messengerId, _lat, _lon);
                    } else if (state is PlaceBidFailureState) {
                      showSnackBar(context, state.errorMessage);
                    }*/
                  },
                  buildWhen: (old, current) =>
                      current is PlaceTagFailureState && old != current,
                  builder: (context, state) {
                    if (state is PlaceTagFailureState) {
                      _validate = AutovalidateMode.onUserInteraction;
                    }
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, right: 10.0, left: 10.0),
                            child: FilterBox(user: widget.user),
                          ),
                          DeeDeeButton(AppLocalizations.of(context)!.placeBid,
                              () {
                            context.read<PlaceTagBloc>().add(
                                PlaceTagActionEvent(_topic, _messengerId, _lat,
                                    _lon, widget.user.accountType, _filterMap));
                          }),
                        ],
                      ),
                    );
                  },
                ),
              ),
              onWillPop: () async {
                return pushReplacement(context, HomeScreen(user: widget.user!));
              });
        },
      ),
    );
  }
}
