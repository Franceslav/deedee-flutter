import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:meta/meta.dart';

part 'request_event.dart';

part 'request_state.dart';

class ServicePushRequestBloc
    extends Bloc<ServicePushRequestEvent, ServicePushRequestState> {
  final ServiceRequestRepository _serviceRequestRepository;
  final User _user;
  final String _pushNotificationRequestId = '1';
  late ServiceRequest _initialServiceRequest;

  ServicePushRequestBloc(this._serviceRequestRepository, this._user)
      : super(RequestInitial()) {
    on<ServiceRequestPriceChangeEvent>(_onServiceRequestPriceChangeEvent);
    _initialize();
  }

  void _onServiceRequestPriceChangeEvent(ServiceRequestPriceChangeEvent event,
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

  _initialize() async {
    try {
      _initialServiceRequest =
          (await _serviceRequestRepository.getAll(_user.userId)).firstWhere(
              (sr) => sr.serviceRequestId == _pushNotificationRequestId);
      emit(ServiceRequestChangeState(
          serviceRequest: _initialServiceRequest, changed: false));
    } catch (error) {
      emit(ServiceRequestErrorState(errorMessage: error.toString()));
    }
  }
}
