import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/deedee/api/service/service_request_service.pb.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../../../generated/deedee/api/model/uuid.pb.dart';

part 'my_request_event.dart';

part 'my_request_state.dart';

class ServiceRequestBloc extends Bloc<MyRequestEvent, MyRequestState> {
  final ServiceRequestRepository _serviceRequestRepository;
  final User _user;

  ServiceRequestBloc(this._serviceRequestRepository, this._user)
      : super(MyRequestInitial()) {
    on<MyRequestCreateEvent>(_onCreateRequest);
    on<MyRequestAcceptEvent>(_onAcceptRequest);
    on<MyRequestDeleteEvent>(_onDeleteRequest);
    on<UpdateRequestEvent>(_onUpdateRequest);
    on<SearchRequestEvent>(_onSearchRequest);
    initialize();
  }

  initialize() async {
    try {
      final requests = await _serviceRequestRepository.getAll(_user.email);
      emit(MyRequestLoadState(requests));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  _onAcceptRequest(
      MyRequestAcceptEvent event, Emitter<MyRequestState> emit) async {
    try {
      var serverRequest = ServiceRequest()
        ..serviceRequestId = event.request.serviceRequestId;
      final response =
          await _serviceRequestRepository.accept(serverRequest, _user.email);
      if (response.status == ServiceRequest_Status.ACCEPTED) {
        emit(AcceptSuccessfulState());
      } else if (event.index != null) {
        emit(AcceptedErrorState(
          request: event.request,
          index: event.index!,
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
      _serviceRequestRepository.change(event.request, event.request);
      final requests = await _serviceRequestRepository.getAll(_user.email);
      emit(MyRequestLoadState(requests));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  _onCreateRequest(
      MyRequestCreateEvent event, Emitter<MyRequestState> emit) async {
    try {
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
          event.request.serviceRequestId, _user.email);
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

  _onSearchRequest(
      SearchRequestEvent event, Emitter<MyRequestState> emit) async {
    final request = await _serviceRequestRepository.getAll(event.name);
    emit(MyRequestLoadState(request));
  }
}
