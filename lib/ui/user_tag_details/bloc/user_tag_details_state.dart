part of 'user_tag_details_bloc.dart';

abstract class UserTagDetailsState {}

class InitialState extends UserTagDetailsState {}

class LoadedTagState extends UserTagDetailsState {
  final Tag tag;

  LoadedTagState({
    required this.tag,
  });
}

class ErrorState extends UserTagDetailsState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}
