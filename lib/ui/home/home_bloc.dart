import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/gps.dart';
import 'package:deedee/services/grpc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomePageState> {
  final GPSRepository _gpsRepository;
  final GRCPRepository _grpcRepository;
  final User _user;

  HomeBloc(this._gpsRepository, this._grpcRepository, this._user)
      : super(HomeInitial()) {
    on<HomePageLoadEvent>((event, emit) async {
      // emit(HomePageLoadedState());
    });

    on<GPSEvent>((event, emit) {
      Future<Position?> fp = _gpsRepository.getGPSPosition();
      fp.then((value) {
        emit(HomePageGPSReceivedState(value!));
      });
    });

    on<HomePageChangeEvent>((event, emit) async {
      emit(HomePageChangeState(event.topic));
    });

    initialize();
  }

  initialize() async {
    var fp = await _gpsRepository.getGPSPosition();
    _user.lastGeoLocation = LatLng(fp!.latitude, fp.longitude);
    List<TopicDescription> topics =
        await _grpcRepository.getTopics(fp.latitude, fp.longitude);

    emit(HomePageLoadedState(topics.map((e) => e.title).toList()));
  }
}
