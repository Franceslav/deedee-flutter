import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pbenum.dart';
import 'package:deedee/generated/deedee/api/service/service_request_service.pb.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';

import '../../../model/user.dart';
import '../../../repository/service_request_repository.dart';

part 'map_sliding_panel_event.dart';

part 'map_sliding_panel_state.dart';

class MapSlidingPanelBloc
    extends Bloc<MapSlidingPanelEvent, MapSlidingPanelState> {
  final ServiceRequestRepository _serviceRequestRepository;
  final User _user;

  MapSlidingPanelBloc(this._serviceRequestRepository, this._user)
      : super(MapSlidingPanelInitial()) {
    on<MapSlidingPanelRequestCreate>(_onRequestCreate);
  }

  _onRequestCreate(
    MapSlidingPanelRequestCreate event,
    Emitter<MapSlidingPanelState> emit,
  ) async {
    try {
      event.selectedTagId; //
      var serviceRequest = ServiceRequest(
        serviceRequestId: Int64(DateTime.now().microsecondsSinceEpoch),
        createdFor: _user.userId,
        createdAt: Timestamp(),
        description: DateTime.now().toString() * 4,
        status: ServiceRequest_Status.PENDING,
      );

      final response = await _serviceRequestRepository.create(serviceRequest);
      emit(MapSlidingPanelCreateRequestState(response));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }
}
