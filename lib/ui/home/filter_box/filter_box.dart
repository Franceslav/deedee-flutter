import 'dart:async';

import 'package:deedee/generated/BucketService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/locator.dart';
import 'package:deedee/ui/home/filter_box/filter_box_bloc.dart';
import 'package:deedee/ui/home/home_bloc.dart';
import 'package:deedee/ui/home/predefined_filter/predefined_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class FilterBox extends StatefulWidget {
  final User user;

  const FilterBox({Key? key, required this.user}) : super(key: key);

  @override
  _FilterBoxState createState() => _FilterBoxState();
}

class _FilterBoxState extends State<FilterBox> {
  final GlobalKey<FormState> _key = GlobalKey();
  Bucket bucket = Bucket();

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;

  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterBoxHomeBloc>(
      create: (context) => FilterBoxHomeBloc(),
      child: Builder(builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<FilterBoxHomeBloc, FilterBoxHomeState>(
              listener: (context, state) {
                if (state is FilterBoxChangeState) {
                  context
                      .read<HomeBloc>()
                      .add(HomePageChangeEvent(state.topic));
                }
              },
            ),
          ],
          child: FutureBuilder(
            future: getTitles(),
            builder: (context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.hasData) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 32.0, right: 10.0, left: 10.0),
                          child: Wrap(
                              children: snapshot.data!
                                  .map((title) => PredefinedFilter(
                                      user: widget.user, title: title))
                                  .toList()))
                    ]);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        );
      }),
    );
  }

  Future<List<String>> getTitles() async {
    await checkGps();
    return serviceLocator
        .get<GRCPUtils>()
        .getTopics(position.latitude, position.longitude)
        .then((titles) {
      return titles;
    });
  }

  Future<void> checkGps() async {
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
        await getLocation();
      }
    } else {
      // showSnackBar(context, 'GPS Service is not enabled, turn on GPS location');
    }
  }

  Future<void> getLocation() async {
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
            .listen((Position _position) {
      position = _position;
    });
  }
}
