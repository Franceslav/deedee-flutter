part of 'user_tag_details_bloc.dart';

abstract class UserTagDetailsState {}

class InitialState extends UserTagDetailsState {}

class LoadedTagState extends UserTagDetailsState {
  final Tag tag;
  final TagDetails tagDetails;

  LoadedTagState({
    required this.tag,
    required this.tagDetails,
  });
}

class ErrorState extends UserTagDetailsState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}
