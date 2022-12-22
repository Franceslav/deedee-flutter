import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deedee/generated/BucketService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'filter_box_event.dart';

part 'filter_box_state.dart';

class FilterBoxHomeBloc extends Bloc<FilterBoxHomeEvent, FilterBoxHomeState> {

  FilterBoxHomeBloc() : super(FilterBoxInitialState()) {
    on<FilterBoxChangeEvent>((event, emit) async {
      emit(FilterBoxChangeState(event.title));
    });
  }

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position _position;

  Future<dynamic> checkGps() async {
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
    _position = await Geolocator.getCurrentPosition(
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
      _position = position;
    });

  }
}
