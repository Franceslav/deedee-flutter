part of 'filter_dto_bloc.dart';

abstract class FilterDTOEvent {}

class LoadFiltersEvent extends FilterDTOEvent {
  final String userId;

  LoadFiltersEvent(this.userId);
}

class DeleteFiltersEvent extends FilterDTOEvent {}

class TapFiltersEvent extends FilterDTOEvent {
  // final String tagId;

  // TapBookmarkEvent(this.tagId);
}

class PushSavedFiltersEvent extends FilterDTOEvent {
  final String topic;
  final List<String> filterKeys;
  final AccountType accountType;

  PushSavedFiltersEvent({
    required this.topic,
    required this.filterKeys,
    required this.accountType,
  });
}

class RemoveFilterEvent extends FilterDTOEvent {
  final int index;
  late final List<FilterDTO> filters;

  RemoveFilterEvent({
    required this.index,
    required this.filters,
  });
}

class AddFilterDTOSubscription extends FilterDTOEvent {
  final FilterDTO filterDTO;

  AddFilterDTOSubscription(this.filterDTO);
}

class GetFilterDTOSubscription extends FilterDTOEvent {
  final String userId;

  GetFilterDTOSubscription(this.userId);
}
