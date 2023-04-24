part of 'composite_filter_bloc.dart';

abstract class CompositeFilterEvent {}

class LoadFiltersEvent extends CompositeFilterEvent {
  final String userId;

  LoadFiltersEvent(this.userId);
}

class DeleteFiltersEvent extends CompositeFilterEvent {}

class TapFiltersEvent extends CompositeFilterEvent {
  // final String tagId;

  // TapBookmarkEvent(this.tagId);
}

class PushSavedFiltersEvent extends CompositeFilterEvent {
  final String topic;
  final List<String> filterKeys;
  final AccountType accountType;

  PushSavedFiltersEvent({
    required this.topic,
    required this.filterKeys,
    required this.accountType,
  });
}

class RemoveFilterEvent extends CompositeFilterEvent {
  final int index;
  late final List<CompositeFilter> filters;

  RemoveFilterEvent({
    required this.index,
    required this.filters,
  });
}

class AddFilterSubscriptionEvent extends CompositeFilterEvent {
  final CompositeFilter compositeFilter;

  AddFilterSubscriptionEvent(this.compositeFilter);
}

class GetFilterSubscription extends CompositeFilterEvent {
  final String userId;

  GetFilterSubscription(this.userId);
}

class SearchSavedFiltersEvent extends CompositeFilterEvent {
  final String filterName;

  SearchSavedFiltersEvent(this.filterName);
}
