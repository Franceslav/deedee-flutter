import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deedee/generated/LocationService.pb.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/gps_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/services/push_notification_service.dart';
import 'package:deedee/services/shared.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final PushNotificationService _pushNotificationService;
  final GPSRepository _gpsRepository;
  final TopicRepository _topicRepository;

  HomeBloc(
      this._pushNotificationService,
      this._gpsRepository,
      this._topicRepository,
      ) : super(HomeScreenInitialState()) {
    on<HomeScreenInitLoadEvent>(_onInitLoadEvent);

    on<HomeScreenChangeEvent>(_onChange);

    on<GPSEvent>((event, emit) {
      Future<Position?> fp = _gpsRepository.getGPSPosition();
      fp.then((value) {
        emit(HomePageGPSReceivedState(value!));
      });
    });

    // on<HomePageChangeEvent>((event, emit) async {
    //   emit(HomePageChangeState(event.topic));
    // });
  }

  _onInitLoadEvent(
      HomeScreenInitLoadEvent event, Emitter<HomeScreenState> emit) async {
    final userPosition = await _gpsRepository.getGPSPosition();
    _pushNotificationService.requestPermission();
    final selectedCity = await locator.get<SharedUtils>().getUserPlace();

    emit(HomeScreenLoadingState());

    try {
      if (userPosition == null) {
        List<TopicDescription> topics = await _topicRepository.getTopics(0, 0);
        emit(HomeScreenLoadedState(
          topics: topics,
          selectedCity: null,
        ));
        return;
      }

      if (selectedCity == null) {
        emit(HomeScreenFirstLaunchState());
        return;
      }

      List<TopicDescription> topics = await _topicRepository.getTopics(
          userPosition.latitude, userPosition.longitude);
      emit(HomeScreenLoadedState(
        topics: topics,
        selectedCity: Place(title: selectedCity),
      ));
    } catch (error) {
      emit(HomeScreenFailureState(errorMessage: error.toString()));
    }
  }

  _onChange(HomeScreenChangeEvent event, Emitter<HomeScreenState> emit) async {
    if (event.city != null) {
      locator.get<SharedUtils>().saveUserPlace(event.city!.title);
    }

    emit(HomeScreenLoadingState());
    try {
      //get LatLng from Place object
      List<TopicDescription> topics = await _topicRepository.getTopics(0, 0);
      emit(HomeScreenLoadedState(
        topics: topics,
        selectedCity: event.city,
      ));
    } catch (error) {
      emit(HomeScreenFailureState(errorMessage: error.toString()));
    }
  }
}
