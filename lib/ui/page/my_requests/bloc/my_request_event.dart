part of 'my_request_bloc.dart';

@immutable
abstract class MyRequestEvent {}

class MyRequestCreateEvent extends MyRequestEvent {
  final ServiceRequest? request;

  MyRequestCreateEvent({
    this.request,
  });
}

class MyRequestDeleteEvent extends MyRequestEvent {
  final String userId;
  final ServiceRequest request;
  final int index;

  MyRequestDeleteEvent({
    required this.userId,
    required this.request,
    required this.index,
  });
}

class MyRequestAcceptEvent extends MyRequestEvent {
  final String userId;
  final ServiceRequest request;
  final int? index;

  MyRequestAcceptEvent({
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
