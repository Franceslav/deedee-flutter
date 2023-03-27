part of 'home_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class HomeScreenInitLoadEvent extends HomeScreenEvent {}

class HomeScreenLoadEvent extends HomeScreenEvent {
  final User user;
  final LatLng userLocation;

  HomeScreenLoadEvent({
    required this.user,
    required this.userLocation,
  });
}

class HomeScreenChangeEvent extends HomeScreenEvent {
  final User user;
  final Place? city;

  HomeScreenChangeEvent({
    required this.user,
    required this.city,
  });
}

class GPSEvent extends HomeScreenEvent {}
