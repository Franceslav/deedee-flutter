part of 'filter_page_bloc.dart';

@immutable
abstract class FilterPageEvent {}

class FilterPageSubtopicSelectedEvent extends FilterPageEvent {
  final String selectedSubtopic;

  FilterPageSubtopicSelectedEvent(this.selectedSubtopic);
}

class FilterPageFilterKeySelectedEvent extends FilterPageEvent {
  final String selectedSubtopic;
  final String selectedFilterKey;

  FilterPageFilterKeySelectedEvent(this.selectedSubtopic, this.selectedFilterKey);
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
