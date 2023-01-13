part of 'filter_box_bloc.dart';

@immutable
abstract class FilterBoxState {}

class FilterBoxInitialState extends FilterBoxState {}

class FilterBoxChangeState extends FilterBoxState {
  final Map<String, bool> predefinedFilterActiveMap;

  FilterBoxChangeState(this.predefinedFilterActiveMap);
}

class FilterBoxFilteredTagsReceivedState extends FilterBoxState {
  final Topic topic;

  FilterBoxFilteredTagsReceivedState({required this.topic});
}

class FilterBoxDoneState extends FilterBoxState {
  final Topic topic;

  FilterBoxDoneState({required this.topic});
}

class FilterBoxFailureState extends FilterBoxState {
  final String errorMessage;

  FilterBoxFailureState({required this.errorMessage});
}
