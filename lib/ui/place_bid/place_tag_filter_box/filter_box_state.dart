part of 'filter_box_bloc.dart';

@immutable
abstract class FilterBoxState {}

class FilterBoxInitialState extends FilterBoxState {}

class FilterBoxChangeState extends FilterBoxState {
  final Map<String, bool> predefinedFilterActiveMap;

  FilterBoxChangeState(this.predefinedFilterActiveMap);
}

class FilterBoxFilteredTagsReceivedState extends FilterBoxState {
  final Bucket bucket;

  FilterBoxFilteredTagsReceivedState({required this.bucket});
}

class FilterBoxDoneState extends FilterBoxState {
  final Bucket bucket;

  FilterBoxDoneState({required this.bucket});
}

class FilterBoxFailureState extends FilterBoxState {
  final String errorMessage;

  FilterBoxFailureState({required this.errorMessage});
}
