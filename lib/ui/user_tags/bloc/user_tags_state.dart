part of 'user_tags_bloc.dart';

abstract class UserTagsState {}

class InitialState extends UserTagsState {}

class LoadedTagsState extends UserTagsState {
  final List<Tag> tags;

  LoadedTagsState({
    required this.tags,
  });
}

class DeletedSuccessfulState extends UserTagsState {}

class DeletedErrorState extends UserTagsState {
  final Tag tag;
  final int index;

  DeletedErrorState({
    required this.tag,
    required this.index,
  });
}

class ErrorState extends UserTagsState {
  final String errorMessage;

  ErrorState({
    required this.errorMessage,
  });
}
