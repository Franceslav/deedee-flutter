part of 'servis_provider_tags_bloc.dart';

abstract class ProviderTagsState {}

class InitialState extends ProviderTagsState {}

class LoadedTagsState extends ProviderTagsState {
  final List<Tag> tags;

  LoadedTagsState({
    required this.tags,
  });
}

class DeletedSuccessfulState extends ProviderTagsState {}

class DeletedErrorState extends ProviderTagsState {
  final Tag tag;
  final int index;

  DeletedErrorState({
    required this.tag,
    required this.index,
  });
}

class ErrorState extends ProviderTagsState {
  final String errorMessage;

  ErrorState({
    required this.errorMessage,
  });
}
