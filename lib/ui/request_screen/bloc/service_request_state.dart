part of 'service_request_bloc.dart';

@immutable
abstract class ServicePushRequestState {}

class RequestInitial extends ServicePushRequestState {}

class ServiceRequestChangeState extends ServicePushRequestState {
  final ServiceRequest serviceRequest;
  final bool changed;
  ServiceRequestChangeState({required this.serviceRequest, required this.changed});
}

class ServiceRequestErrorState extends ServicePushRequestState {
  final String errorMessage;

  ServiceRequestErrorState({
    required this.errorMessage,
  });
}

class AcceptServiceRequestState extends ServicePushRequestState {
  final String errorMessage;

  AcceptServiceRequestState({
    required this.errorMessage,
  });
}
