part of 'saved_filters_bloc.dart';

@immutable
abstract class SavedFiltersState {}

class InitialState extends SavedFiltersState {}

class LoadedFiltersState extends SavedFiltersState {
  final List<Filter> filters;
  LoadedFiltersState(this.filters);
}

// class DeletedSuccessfulState extends SavedFiltersState {}

// class DeletedErrorState extends SavedFiltersState {}

class ErrorState extends SavedFiltersState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class UserSavedFiltersDoneState extends SavedFiltersState {
  final Topic topic;

  UserSavedFiltersDoneState(this.topic);
}
