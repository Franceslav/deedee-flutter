import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomePageState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomePageLoadEvent>((event, emit) async {
/*

      List<Topic> topics =
          await GRCPUtils.getTopics(event.latitude, event.longitude);

      emit(HomePageLoadedState(topics.map((e) => e.title).toList()));

*/
      emit(HomePageLoadedState(["строительство", "маникюр"]));
    });

    on<GPSEvent>((event, emit) async {
      Future<dynamic> gpsFuture = await checkGps();
      gpsFuture.then((value) {
        emit(HomePageGPSReceivedState(value));
      });
    });

    on<HomePageChangeEvent>((event, emit) async {
      emit(HomePageChangeState(event.topic));
    });
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
    return position;
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
//TODO: ???
    });
  }
}
