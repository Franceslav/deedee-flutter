part of 'filter_box_bloc.dart';

abstract class FilterBoxEvent {}

class FilterBoxInitialEvent extends FilterBoxEvent {}

class FilterBoxChangeEvent extends FilterBoxEvent {
  String title;
  bool isChecked;

  FilterBoxChangeEvent(this.title, this.isChecked);
}

class FilterBoxFilterActionEvent extends FilterBoxEvent {
  final Map<String, bool> predefinedFilterActiveMap;
  final AccountType accountType;

  FilterBoxFilterActionEvent(this.predefinedFilterActiveMap, this.accountType);
}
