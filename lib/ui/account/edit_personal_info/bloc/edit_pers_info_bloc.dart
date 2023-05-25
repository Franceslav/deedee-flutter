import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/gps_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/repository/profile_repository.dart';
import 'package:deedee/services/push_notification_service.dart';
import 'package:deedee/services/shared.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../services/http_service.dart';

part 'edit_pers_info_event.dart';
part 'edit_pers_info_state.dart';

class EditPersInfoBloc extends Bloc<EditPersInfoScreenEvent, EditPersInfoScreenState> {
  final PushNotificationService _pushNotificationService;
  final GPSRepository _gpsRepository;
  final TopicRepository _topicRepository;
  final HttpService? _httpService;
  final ProfileRepository _profileRepository;

  EditPersInfoBloc(
      this._pushNotificationService,
      this._gpsRepository,
      this._topicRepository,
      this._profileRepository,
      {HttpService? httpService}
      ) : _httpService = httpService , super(EditPersInfoScreenInitialState()) {
    on<EditPersInfoScreenInitLoadEvent>(_onInitLoadEvent);
    on<EditPersInfoScreenChangeEvent>(_onChange);
    on<SaveEditDataEvent>(_onSave);
    on<GPSEvent>((event, emit) {
      Future<Position?> fp = _gpsRepository.getGPSPosition();
      fp.then((value) {
        emit(EditPersInfoPageGPSReceivedState(value!));
      });
    });
    _init();
  }
  _init() async {
    if(_httpService != null) {
      final requestId = await _httpService!.initDeepLinkListener();
      if(requestId != null) {
        emit(EditPersInfoPageRequestReceivedState(requestId));
      }
    }
  }

  _onInitLoadEvent(
    EditPersInfoScreenInitLoadEvent event, Emitter<EditPersInfoScreenState> emit) async {
    final userPosition = await _gpsRepository.getGPSPosition();
    _pushNotificationService.requestPermission();
    final selectedCity = await locator.get<SharedUtils>().getUserPlace();
    final profile =  await _profileRepository.getProfile(
        event.profile,
      );

    emit(EditPersInfoScreenLoadingState(profile: profile));

    try {
      if (userPosition == null) {
        List<Topic> topics = await _topicRepository.getTopics(0, 0);
        emit(EditPersInfoScreenLoadedState(
          topics: topics,
          selectedCity: null,
        ));
        return;
      }

      if (selectedCity == null) {
        emit(EditPersInfoScreenFirstLaunchState());
        return;
      }

      List<Topic> topics = await _topicRepository.getTopics(
          userPosition.latitude, userPosition.longitude);
      emit(EditPersInfoScreenLoadedState(
        topics: topics,
        selectedCity: Location(title: selectedCity),
      ));
    } catch (error) {
      emit(EditPersInfoScreenFailureState(errorMessage: error.toString()));
    }
  }

  _onChange(EditPersInfoScreenChangeEvent event, Emitter<EditPersInfoScreenState> emit) async {
    if (event.city != null) {
      locator.get<SharedUtils>().saveUserPlace(event.city!.title);
    }

    // emit(EditPersInfoScreenLoadingState());
    try {
      //get LatLng from Place object
      List<Topic> topics =  await _topicRepository.getTopics(0, 0);
      emit(EditPersInfoScreenLoadedState(
        topics: topics,
        selectedCity: event.city,
      ));
    } catch (error) {
      emit(EditPersInfoScreenFailureState(errorMessage: error.toString()));
    }
  }

  _onSave(SaveEditDataEvent event, Emitter<EditPersInfoScreenState> emit) async {
    try {
      await _profileRepository.editProfile(
        event.profile,
      );
      emit(EditPersInfpScreenDataChangedState(profile: event.profile));
    } catch (error) {
      emit(EditPersInfoScreenFailureState(errorMessage: error.toString()));
    }
  }
}

