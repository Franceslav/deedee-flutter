import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pbenum.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/generated/deedee/api/model/uuid.pb.dart';
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
  final Int64 _selectedTagId;
  final User _user;

  late Tag _selectedTag;
  MapSlidingPanelBloc(
    this._serviceRequestRepository,
    this._tagRepository,
    this._selectedTagId,
    this._user,
  ) : super(MapSlidingPanelInitial()) {
    on<MapSlidingPanelRequestCreate>(_onRequestCreate);
    on<MapSlidingPanelChangeBookmarkEvent>(_onChangeBookmark);
    _init();
  }

  _onRequestCreate(
    MapSlidingPanelRequestCreate event,
    Emitter<MapSlidingPanelState> emit,
  ) async {
    try {
      var tag = (await _tagRepository.getTags(_user.email))
          .firstWhere((t) => t.tagId == event.selectedTagId);
      var serviceRequest = ServiceRequest(
        createdBy: _user.email,
        createdFor: tag.createdBy.toString(),
        createdAt: Timestamp(),
        description: DateTime.now().toString() * 4,
        status: ServiceRequest_Status.PENDING,
        tagId: event.selectedTagId,
      );

      final response = await _serviceRequestRepository.create(serviceRequest);

      emit(ServiceRequestCreatedState(response.serviceRequestId));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> _onChangeBookmark(
    MapSlidingPanelChangeBookmarkEvent event,
    Emitter<MapSlidingPanelState> emit,
  ) async {
    try {
      Tag? response;
      String? snackbarNotification;
      if (_selectedTag.status == Tag_Status.BOOKMARKED) {
        response = await _tagRepository.removeTagFromFavorites(_user.email, _selectedTagId);
        snackbarNotification = 'removed from favorites';
      } else {
        response = await _tagRepository.addTagToFavorites(
          _user.email,
          _selectedTagId,
        );
        snackbarNotification = 'added to favorites';
      }
      emit(
        MapSlidingPanelIsBookmarkedState(
          isBookmarked: response.status == Tag_Status.BOOKMARKED,
          snackbarNotification: snackbarNotification,
        ),
      );
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

  _init() async {
    try {
      final tags = await _tagRepository.getTags(_user.email);
      _selectedTag = tags.firstWhere((tag) => tag.tagId == _selectedTagId);
      emit(MapSlidingPanelIsBookmarkedState(
          isBookmarked: _selectedTag.status == Tag_Status.BOOKMARKED));
    } catch (e) {}
  }
}
