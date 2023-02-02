part of 'set_location_bloc.dart';

abstract class SetLocationEvent {}

class SearchAddressByLocation extends SetLocationEvent {
  final LatLng location;

  SearchAddressByLocation(this.location);
}

class SearchLocationByAddress extends SetLocationEvent {
  final String query;

  SearchLocationByAddress(this.query);
}

class CenterPositionChanged extends SetLocationEvent {
  final LatLng newPosition;

  CenterPositionChanged({required this.newPosition});
}

class CloseStream extends SetLocationEvent {}
