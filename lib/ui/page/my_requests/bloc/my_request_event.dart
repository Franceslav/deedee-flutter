part of 'my_request_bloc.dart';

@immutable
abstract class MyRequestEvent {}

class MyRequestLoadEvent extends MyRequestEvent {
  final String userId;

  MyRequestLoadEvent(this.userId);
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

class AcceptRequestEvent extends MyRequestEvent {
  final String userId;
  final ServiceRequest request;

  AcceptRequestEvent({
    required this.userId,
    required this.request,
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
