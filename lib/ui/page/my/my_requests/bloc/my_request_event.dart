part of 'my_request_bloc.dart';

@immutable
abstract class MyRequestEvent {}

class UpdateEvent extends MyRequestEvent {}

class ServiceRequestCreateEvent extends MyRequestEvent {
  final ServiceRequest? request;

  ServiceRequestCreateEvent({
    this.request,
  });
}

class ServiceRequestDeleteEvent extends MyRequestEvent {
  final ServiceRequest request;
  final int index;

  ServiceRequestDeleteEvent({
    required this.request,
    required this.index,
  });
}

class ServiceRequestAcceptEvent extends MyRequestEvent {
  final String userId;
  final ServiceRequest request;
  final int? index;

  ServiceRequestAcceptEvent({
    required this.userId,
    required this.request,
    this.index,
  });
}

class UpdateRequestEvent extends MyRequestEvent {
  final String userId;
  final ServiceRequest request;

  UpdateRequestEvent({
    required this.userId,
    required this.request,
  });
}

class SearchRequestEvent extends MyRequestEvent {
  final String name;

  SearchRequestEvent(this.name);
}
