import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:deedee/generated/deedee/api/service/profile_service.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/gps_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/repository/profile_repository.dart';
import 'package:deedee/services/push_notification_service.dart';
import 'package:deedee/services/shared.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../services/http_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final PushNotificationService _pushNotificationService;
  final GPSRepository _gpsRepository;
  final TopicRepository _topicRepository;
  final HttpService? _httpService;
  final ProfileRepository _profileRepository;

  HomeBloc(
      this._pushNotificationService,
      this._gpsRepository,
      this._topicRepository,
      this._profileRepository,
      {HttpService? httpService}
      ) : _httpService = httpService , super(HomeScreenInitialState()) {
    on<HomeScreenInitLoadEvent>(_onInitLoadEvent);
    on<HomeScreenChangeEvent>(_onChange);
    on<SaveEditDataEvent>(_onSave);
    on<GPSEvent>((event, emit) {
      Future<Position?> fp = _gpsRepository.getGPSPosition();
      fp.then((value) {
        emit(HomePageGPSReceivedState(value!));
      });
    });
    _init();
  }
  _init() async {
    if(_httpService != null) {
      final requestId = await _httpService!.initDeepLinkListener();
      if(requestId != null) {
        emit(HomePageRequestReceivedState(requestId));
      }
    }
  }

  _onInitLoadEvent(
    HomeScreenInitLoadEvent event, Emitter<HomeScreenState> emit) async {
    final userPosition = await _gpsRepository.getGPSPosition();
    _pushNotificationService.requestPermission();
    final selectedCity = await locator.get<SharedUtils>().getUserPlace();

    emit(HomeScreenLoadingState());

    try {
      if (userPosition == null) {
        List<Topic> topics = await _topicRepository.getTopics(0, 0);
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

      List<Topic> topics = await _topicRepository.getTopics(
          userPosition.latitude, userPosition.longitude);
      emit(HomeScreenLoadedState(
        topics: topics,
        selectedCity: Location(title: selectedCity),
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
      List<Topic> topics =  await _topicRepository.getTopics(0, 0);
      emit(HomeScreenLoadedState(
        topics: topics,
        selectedCity: event.city,
      ));
    } catch (error) {
      emit(HomeScreenFailureState(errorMessage: error.toString()));
    }
  }

  _onSave(SaveEditDataEvent event, Emitter<HomeScreenState> emit) async {
    try {
      await _profileRepository.editProfile(
        event.profile,
      );
      emit(EditScreenDataChangedState());
    } catch (error) {
      emit(HomeScreenFailureState(errorMessage: error.toString()));
    }
  }
}
