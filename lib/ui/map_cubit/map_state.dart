part of 'map_cubit.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class ValidMapField extends MapState {}

class MapFailureState extends MapState {
  String errorMessage;

  MapFailureState({required this.errorMessage});
}

class MapDone extends MapState {}
