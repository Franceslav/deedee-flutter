import 'package:bloc/bloc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';

import '../../../generated/request_service_service.pb.dart';
import '../../../generated/tag_service.pb.dart';
import '../../../generated/timestamp.pb.dart';
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
      event.selectedTagId;//
      var sr = ServiceRequest(
        requestId: DateTime.now().toString(),
        clientId: _user.userId,
        description: DateTime.now().toString() * 4,
        dateOfRequest: Timestamp(),
        status: ServiceRequest_Status.PENDING,
      );

      final response = await _serviceRequestRepository.create(
        ServiceRequestRequest()..serviceRequest = sr,
      );
      emit(MapSlidingPanelCreateRequestState(response));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }
}
