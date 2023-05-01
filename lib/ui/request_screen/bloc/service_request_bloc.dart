import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';

part 'service_request_event.dart';

part 'service_request_state.dart';

class ServicePushRequestBloc
    extends Bloc<ServicePushRequestEvent, ServicePushRequestState> {
  final ServiceRequestRepository _serviceRequestRepository;
  final User _user;
  final int _serviceRequestId;

  late ServiceRequest _initialServiceRequest;

  ServicePushRequestBloc(
    this._serviceRequestRepository,
    this._user,
    this._serviceRequestId,
  ) : super(RequestInitial()) {
    on<ServiceRequestPriceChangeEvent>(_onServiceRequestPriceChangeEvent);
    on<AcceptServiceRequestEvent>(_onAcceptServiceRequestEvent);

    _initialize();
  }

  _onServiceRequestPriceChangeEvent(ServiceRequestPriceChangeEvent event,
      Emitter<ServicePushRequestState> emit) {
    try {
      ServiceRequest serviceRequest = ServiceRequest()
        ..serviceRequestId = _initialServiceRequest.serviceRequestId
        ..createdFor = _initialServiceRequest.createdFor
        ..description = _initialServiceRequest.description
        ..createdAt = _initialServiceRequest.createdAt
        ..price = event.price.toDouble();

      bool changed =
          !identical(_initialServiceRequest.price, serviceRequest.price);

      emit(ServiceRequestChangeState(
          serviceRequest: serviceRequest, changed: changed));
    } catch (error) {
      emit(ServiceRequestErrorState(errorMessage: error.toString()));
    }
  }

  _onAcceptServiceRequestEvent(AcceptServiceRequestEvent event,
      Emitter<ServicePushRequestState> emit) async {
    var sr = await _serviceRequestRepository.accept(event.serviceRequest);
    emit(AcceptServiceRequestState(errorMessage: ''));
  }

  _initialize() async {
    try {
      _initialServiceRequest = (await _serviceRequestRepository
              .getAll(_user.email))
          .firstWhere((sr) => sr.serviceRequestId == Int64(_serviceRequestId));
      emit(ServiceRequestChangeState(
          serviceRequest: _initialServiceRequest, changed: false));
    } catch (error) {
      emit(ServiceRequestErrorState(errorMessage: error.toString()));
    }
  }
}
