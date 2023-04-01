part of 'my_request_bloc.dart';

@immutable
abstract class MyRequestState {}

class MyRequestInitial extends MyRequestState {}

class MyRequestLoadState extends MyRequestState {
  final List<ServiceRequest> requests;

  MyRequestLoadState(this.requests);
}

class DeletedSuccessfulState extends MyRequestState {}

class DeletedErrorState extends MyRequestState {
  final ServiceRequest request;
  final int index;

  DeletedErrorState({
    required this.request,
    required this.index,
  });
}

class ErrorState extends MyRequestState {
  final String errorMessage;

  ErrorState({
    required this.errorMessage,
  });
}
