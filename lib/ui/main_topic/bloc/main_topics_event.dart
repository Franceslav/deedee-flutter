part of 'main_topics_bloc.dart';

abstract class MainTopicsEvent {}

class LoadMainTopicsEvent extends MainTopicsEvent {
  final String userId;
  final LatLng userLocation;

  LoadMainTopicsEvent({
    required this.userId,
    required this.userLocation,
  });
}
