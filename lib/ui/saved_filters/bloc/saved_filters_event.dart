part of 'saved_filters_bloc.dart';

@immutable
abstract class SavedFiltersEvent {}

class LoadFiltersEvent extends SavedFiltersEvent {
  final String userId;

  LoadFiltersEvent(this.userId);
}

class DeleteFiltersEvent extends SavedFiltersEvent {}

class TapFiltersEvent extends SavedFiltersEvent {
  // final String tagId;

  // TapBookmarkEvent(this.tagId);
}

class PushSavedFiltersEvent extends SavedFiltersEvent {
  final String topic;
  final List<String> filterKeys;
  final AccountType accountType;

  PushSavedFiltersEvent({
    required this.topic,
    required this.filterKeys,
    required this.accountType,
  });
}
