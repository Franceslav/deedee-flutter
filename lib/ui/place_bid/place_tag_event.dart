part of 'place_tag_bloc.dart';

abstract class PlaceTagEvent {}

class PlaceTagActionEvent extends PlaceTagEvent {
  final String topic;
  final String messengerId;
  final double lat;
  final double lon;
  final AccountType accountType;
  Map<String, bool> predefinedFilterActiveMap;

  PlaceTagActionEvent(
      this.topic, this.messengerId, this.lat, this.lon, this.accountType, this.predefinedFilterActiveMap);
}

class PlaceTagDoneEvent extends PlaceTagEvent {}

class PlaceTagFilterChangeEvent extends PlaceTagEvent {
  final Map<String, bool> predefinedPlaceTagActiveMap;
  final AccountType accountType;

  PlaceTagFilterChangeEvent(this.predefinedPlaceTagActiveMap, this.accountType);
}
