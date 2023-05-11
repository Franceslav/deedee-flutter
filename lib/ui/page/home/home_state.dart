part of 'home_bloc.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenFirstLaunchState extends HomeScreenState {}

class HomeScreenFailureState extends HomeScreenState {
  final String errorMessage;

  HomeScreenFailureState({required this.errorMessage});
}

class HomeScreenLoadedState extends HomeScreenState {
  final Location? selectedCity;
  final List<Topic> topics;

  HomeScreenLoadedState({
    required this.topics,
    required this.selectedCity,
  });
}

class HomeScreenCityChangedState extends HomeScreenState {}

class HomeScreenAccountTypeChangedState extends HomeScreenState {}

class HomePageGPSReceivedState extends HomeScreenState {
  final Position position;

  HomePageGPSReceivedState(this.position);
}

class HomePageRequestReceivedState extends HomeScreenState {
  final String? id;
  HomePageRequestReceivedState(this.id);
}