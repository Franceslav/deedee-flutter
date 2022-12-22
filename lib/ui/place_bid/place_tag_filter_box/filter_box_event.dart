part of 'filter_box_bloc.dart';

abstract class FilterBoxEvent {}

class FilterBoxInitialEvent extends FilterBoxEvent {}

class FilterBoxChangeEvent extends FilterBoxEvent {
  String title;
  bool isChecked;

  FilterBoxChangeEvent(this.title, this.isChecked);
}

class FilterBoxFilterTagsEvent extends FilterBoxEvent {
  Map<String, bool> predefinedFilterActiveMap;
  String topicTitle;
  AccountType accountType;

  FilterBoxFilterTagsEvent(
      this.predefinedFilterActiveMap, this.topicTitle, this.accountType);
}
