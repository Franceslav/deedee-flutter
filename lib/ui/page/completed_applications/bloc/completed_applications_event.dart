part of 'completed_applications_bloc.dart';

@immutable
abstract class CompletedApplicationsEvent {}

class UpdateEvent extends CompletedApplicationsEvent {}

class ServiceRequestCreateEvent extends CompletedApplicationsEvent {
  final ServiceRequest? request;

  ServiceRequestCreateEvent({
    this.request,
  });
}

class ServiceRequestDeleteEvent extends CompletedApplicationsEvent {
  final ServiceRequest request;
  final int index;

  ServiceRequestDeleteEvent({
    required this.request,
    required this.index,
  });
}

class ServiceRequestAcceptEvent extends CompletedApplicationsEvent {
  final String userId;
  final ServiceRequest request;
  final int? index;

  ServiceRequestAcceptEvent({
    required this.userId,
    required this.request,
    this.index,
  });
}

class UpdateRequestEvent extends CompletedApplicationsEvent {
  final String userId;
  final ServiceRequest request;

  UpdateRequestEvent({
    required this.userId,
    required this.request,
  });
}

class SearchRequestEvent extends CompletedApplicationsEvent {
  final String name;

  SearchRequestEvent(this.name);
}
