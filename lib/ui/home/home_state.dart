part of 'home_bloc.dart';

@immutable
abstract class HomePageState {}

class HomeInitial extends HomePageState {}

class ValidHomeField extends HomePageState {}

class HomeFailureState extends HomePageState {
  final String errorMessage;

  HomeFailureState({required this.errorMessage});
}

class HomePageLoadedState extends HomePageState {
  final List<String> topics;

  HomePageLoadedState(this.topics);
}

class HomePageGPSReceivedState extends HomePageState {
  final Position position;

  HomePageGPSReceivedState(this.position);
}

class HomePageChangeState extends HomePageState {
  final String topic;

  HomePageChangeState(this.topic);
}
