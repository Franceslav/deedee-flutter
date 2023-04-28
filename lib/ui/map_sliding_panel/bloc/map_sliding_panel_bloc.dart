import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pbenum.dart';
import 'package:deedee/generated/deedee/api/service/service_request_service.pb.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../injection.dart';
import '../../../model/user.dart';
import '../../../repository/service_request_repository.dart';
import '../../../services/push_notification_service.dart';

part 'map_sliding_panel_event.dart';

part 'map_sliding_panel_state.dart';

class MapSlidingPanelBloc
    extends Bloc<MapSlidingPanelEvent, MapSlidingPanelState> {
  final ServiceRequestRepository _serviceRequestRepository;
  final TagRepository _tagRepository;
  final PushNotificationService _pushNotificationService;
  final User _user;

  MapSlidingPanelBloc(
    this._serviceRequestRepository,
    this._tagRepository,
    this._pushNotificationService,
    this._user,
  ) : super(MapSlidingPanelInitial()) {
    on<MapSlidingPanelRequestCreate>(_onRequestCreate);
  }

  _onRequestCreate(
    MapSlidingPanelRequestCreate event,
    Emitter<MapSlidingPanelState> emit,
  ) async {
    try {
      var tag = (await _tagRepository.getTags(_user.userId))
          .firstWhere((element) => element.tagId == event.selectedTagId);
      var serviceRequest = ServiceRequest(
        serviceRequestId: Int64(DateTime.now().microsecondsSinceEpoch),
        createdBy: '1234',
        createdFor: tag.createdBy.toString(),
        createdAt: Timestamp(),
        description: DateTime.now().toString() * 4,
        status: ServiceRequest_Status.PENDING,
        tagId: event.selectedTagId,
      );

      final response = await _serviceRequestRepository.create(serviceRequest);

      _pushNotificationService.sendPushNotification(
        context: event.context,
        tagId: event.selectedTagId.toString(),
      );

      emit(MapSlidingPanelCreateRequestState(response));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }
}
