part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {}

class FilterChangeEvent extends FilterEvent {
  final Map<String, bool> predefinedFilterActiveMap;
  final AccountType accountType;

  FilterChangeEvent(this.predefinedFilterActiveMap, this.accountType);
}

class FilterTagsActionEvent extends FilterEvent {
  final Map<String, bool> predefinedFilterActiveMap;
  final AccountType accountType;

  FilterTagsActionEvent(this.predefinedFilterActiveMap, this.accountType);
}
