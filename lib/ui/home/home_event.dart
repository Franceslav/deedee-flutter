part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomePageLoadEvent extends HomeEvent {
  final double latitude;
  final double longitude;

  HomePageLoadEvent(this.latitude, this.longitude);
}

class HomePageChangeEvent extends HomeEvent {
  final String topic;

  HomePageChangeEvent(this.topic);
}

class GPSEvent extends HomeEvent {

}
