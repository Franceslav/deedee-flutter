import 'package:bloc/bloc.dart';
import 'package:deedee/generated/request_service_service.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:meta/meta.dart';

import '../../../../generated/timestamp.pb.dart';

part 'my_request_event.dart';

part 'my_request_state.dart';

class ServiceRequestBloc extends Bloc<MyRequestEvent, MyRequestState> {
  final ServiceRequestRepository _serviceRequestRepository;
  final User _user;

  ServiceRequestBloc(this._serviceRequestRepository, this._user)
      : super(MyRequestInitial()) {
    on<MyRequestLoadEvent>(_onLoadRequest);
    on<MyRequestCreateEvent>(_onCreateRequest);
    on<MyRequestAcceptEvent>(_onAcceptRequest);
    on<MyRequestDeleteEvent>(_onDeleteRequest);
    // on<AcceptRequestEvent>(_onAcceptRequest);
    on<UpdateRequestEvent>(_onUpdateRequest);
    initialize();
  }

  _onAcceptRequest(
      MyRequestAcceptEvent event, Emitter<MyRequestState> emit) async {
    try {
      var sr = ServiceRequest()..requestId = event.request.requestId;
      final response = await _serviceRequestRepository.accept(
        ServiceRequestRequest()..serviceRequest = sr,
      );
      if (response.status == ServiceRequest_Status.ACCEPTED) {
        emit(AcceptSuccessfulState());
      } else {
        emit(AcceptedErrorState(
          request: event.request,
          index: event.index,
        ));
      }
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  _onUpdateRequest(
      UpdateRequestEvent event, Emitter<MyRequestState> emit) async {
    try {
      _serviceRequestRepository.change(
        ServiceRequestRequest()..serviceRequest = event.request,
      );
      final requests = await _serviceRequestRepository.getAll(_user.userId);
      emit(MyRequestLoadState(requests));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  initialize() async {
    try {
      final requests = await _serviceRequestRepository.getAll(_user.userId);
      emit(MyRequestLoadState(requests));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  _onLoadRequest(
      MyRequestLoadEvent event, Emitter<MyRequestState> emit) async {}

  _onCreateRequest(
      MyRequestCreateEvent event, Emitter<MyRequestState> emit) async {
    try {
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
      emit(MyRequestCreateState(response));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  _onDeleteRequest(
      MyRequestDeleteEvent event, Emitter<MyRequestState> emit) async {
    try {
      final response = await _serviceRequestRepository.delete(
        ServiceRequestRequest()..serviceRequest = event.request,
      );
      if (response.status == ServiceRequest_Status.DELETED) {
        emit(DeletedSuccessfulState());
      } else {
        emit(DeletedErrorState(
          request: event.request,
          index: event.index,
        ));
      }
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }
}
