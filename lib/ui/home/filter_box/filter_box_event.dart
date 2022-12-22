part of 'filter_box_bloc.dart';

abstract class FilterBoxHomeEvent {}

class FilterBoxInitialEvent extends FilterBoxHomeEvent {}

class FilterBoxChangeEvent extends FilterBoxHomeEvent {
  String title;
  bool isChecked;

  FilterBoxChangeEvent(this.title, this.isChecked);
}

class FilterBoxFilterActionEvent extends FilterBoxHomeEvent {
  final Map<String, bool> predefinedFilterActiveMap;
  final AccountType accountType;

  FilterBoxFilterActionEvent(this.predefinedFilterActiveMap, this.accountType);
}

class FilterBoxGPSEvent extends FilterBoxHomeEvent {

}
