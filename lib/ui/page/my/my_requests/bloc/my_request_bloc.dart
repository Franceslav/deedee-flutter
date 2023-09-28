import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/deedee/api/model/uuid.pb.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'my_request_event.dart';

part 'my_request_state.dart';

class ServiceRequestBloc extends Bloc<MyRequestEvent, ServiceRequestState> {
  final ServiceRequestRepository _serviceRequestRepository;
  final User _user;

  ServiceRequestBloc(this._serviceRequestRepository, this._user)
      : super(const ServiceRequestState()) {
    on<ServiceRequestCreateEvent>(_onCreateRequest);
    on<ServiceRequestAcceptEvent>(_onAcceptRequest);
    on<ServiceRequestDeleteEvent>(_onDeleteRequest);
    on<UpdateRequestEvent>(_onUpdateRequest);
    on<SearchRequestEvent>(_onSearchRequest);

    on<UpdateEvent>(_onUpdateEvent);
    add(UpdateEvent());
  }

  Future<void> _onUpdateEvent(
      UpdateEvent event, Emitter<ServiceRequestState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final requests = await _serviceRequestRepository.getAll(_user.email);
      emit(state.copyWith(
        requests: requests,
        isLoading: false,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _onAcceptRequest(
      ServiceRequestAcceptEvent event, Emitter<ServiceRequestState> emit) async {
    try {
      debugPrint('MyRequestBloc: ACCEPTING...');
      var serverRequest = ServiceRequest()
        ..serviceRequestId = event.request.serviceRequestId;
      final response =
          await _serviceRequestRepository.accept(serverRequest, _user.email);
      if (response.status == ServiceRequest_Status.ACCEPTED) {
        final newRequestList =
            await _serviceRequestRepository.getAll(_user.email);
        emit(state.copyWith(
          requests: newRequestList,
          snackBarMessage: 'request accepted',
          isLoading: false,
        ));
        debugPrint('MyRequestBLOC: DONE');
      } else if (event.index != null) {
        emit(state.copyWith(
          isLoading: false,
          snackBarMessage: 'request was not accepted',
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _onUpdateRequest(
      UpdateRequestEvent event, Emitter<ServiceRequestState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _serviceRequestRepository.change(event.request, event.request);
      final newRequests = await _serviceRequestRepository.getAll(_user.email);
      emit(state.copyWith(
        requests: newRequests,
        isLoading: false,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _onCreateRequest(
      ServiceRequestCreateEvent event, Emitter<ServiceRequestState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      var serviceRequest = ServiceRequest(
        serviceRequestId:
            UUID(value: const Uuid().v5(Uuid.NAMESPACE_URL, 'www.deedee.com')),
        createdFor: DateTime.now().toString(),
        createdBy: _user.email,
        description: DateTime.now().toString() * 4,
        createdAt: Timestamp(),
        price: 0,
        status: ServiceRequest_Status.PENDING,
      );
      if (event.request != null) {
        serviceRequest = event.request!..createdFor = _user.email;
      }
      final response = await _serviceRequestRepository.create(serviceRequest);
      final newRequestList = List<ServiceRequest>.from(state.requests);
      newRequestList.add(response);
      emit(state.copyWith(
        requests: newRequestList,
        isLoading: false,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _onDeleteRequest(
      ServiceRequestDeleteEvent event, Emitter<ServiceRequestState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await _serviceRequestRepository.delete(
          event.request.serviceRequestId, _user.email);
      if (response.status == ServiceRequest_Status.DELETED) {
        final newRequestList =
            await _serviceRequestRepository.getAll(_user.email);
        emit(state.copyWith(
          requests: newRequestList,
          snackBarMessage: 'request declined',
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          snackBarMessage: 'request was not declined',
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  void _onSearchRequest(
      SearchRequestEvent event, Emitter<ServiceRequestState> emit) {
    emit(state.copyWith(searchText: event.name));
    final requestsList = List<ServiceRequest>.from(state.requests
        .where((element) => element.description.contains(event.name)));
    emit(state.copyWith(requestsSearch: requestsList));
  }

}
