part of 'place_tag_bloc.dart';

abstract class PlaceTagState {}

class PlaceTagInitial extends PlaceTagState {}

class ValidPlaceTagField extends PlaceTagState {}

class PlaceTagFailureState extends PlaceTagState {
  String errorMessage;

  PlaceTagFailureState({required this.errorMessage});
}

class PlaceTagDone extends PlaceTagState {}

class PlaceTagFilterChangeState extends PlaceTagState {
  final Map<String, bool> predefinedFilterActiveMap;
  final AccountType accountType;

  PlaceTagFilterChangeState(this.predefinedFilterActiveMap, this.accountType);
}