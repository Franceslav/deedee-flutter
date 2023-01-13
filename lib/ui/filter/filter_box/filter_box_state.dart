part of 'filter_box_bloc.dart';

@immutable
abstract class FilterBoxState {}

class FilterBoxInitialState extends FilterBoxState {}

class FilterBoxChangeState extends FilterBoxState {
  final Map<String, bool> predefinedFilterActiveMap;

  FilterBoxChangeState(this.predefinedFilterActiveMap);
}

class FilterBoxDoneState extends FilterBoxState {
  final Topic topic;

  FilterBoxDoneState(this.topic);
}
