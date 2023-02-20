import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/gps.dart';
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
      Future<dynamic> gpsFuture = await locator.get<GPSUtils>().checkGps();
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
}
