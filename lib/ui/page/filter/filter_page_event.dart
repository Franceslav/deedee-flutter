part of 'filter_page_bloc.dart';

abstract class FilterPageEvent {}

class SubtopicListInitialEvent extends FilterPageEvent {}

class FilterPageChipSelectedEvent extends FilterPageEvent {
  final String selectedSubtopic;
  final List<String> selectedFilterKeys;

  FilterPageChipSelectedEvent(this.selectedSubtopic, this.selectedFilterKeys);
}

class SubtopicListPageChangeEvent extends FilterPageEvent {
  final String topic;

  SubtopicListPageChangeEvent(this.topic);
}

class FilterKeyListSelectedEvent extends FilterPageEvent {
  final List<String> selectedItems;

  FilterKeyListSelectedEvent(this.selectedItems);
}

class SaveFiltersEvent extends FilterPageEvent {
  final String topic;
  final String subtopic;
  final List<String> filterKeys;
  final bool isSubscribe;
  final AccountType accountType;
  final String userId;

  SaveFiltersEvent({
    required this.topic,
    required this.subtopic,
    required this.filterKeys,
    required this.isSubscribe,
    required this.accountType,
    required this.userId,
  });
}

class SelectLocationEvent extends FilterPageEvent {
  final AddressModel data;

  SelectLocationEvent(this.data);
}

class PushFiltersEvent extends FilterPageEvent {
  final String topic;
  final List<String> filterKeys;
  final AccountType accountType;

  PushFiltersEvent({
    required this.topic,
    required this.filterKeys,
    required this.accountType,
  });
}
