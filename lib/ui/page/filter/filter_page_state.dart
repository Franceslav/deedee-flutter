part of 'filter_page_bloc.dart';

@immutable
abstract class FilterPageState {}

class SubtopicListInitialState extends FilterPageState {}

class SubtopicListFailureState extends FilterPageState {
  final String errorMessage;

  SubtopicListFailureState({required this.errorMessage});
}

class SubtopicListLoadedState extends FilterPageState {
  final Map<String, List<String>> allSubtopicsFilter;
  final Map<String, List<String>> selectedSubtopicsFilter;

  SubtopicListLoadedState({
    required this.allSubtopicsFilter,
    required this.selectedSubtopicsFilter,

  });
}

class SubtopicListItemSelectedState extends FilterPageState {
  final List<String> filterKeys;

  SubtopicListItemSelectedState(this.filterKeys);
}

class FilterKeyListSelectedState extends FilterPageState {
  final List<String> filterKeys;

  FilterKeyListSelectedState(this.filterKeys);
}

class UserFiltersDoneState extends FilterPageState {
  final Topic topic;

  UserFiltersDoneState(this.topic);
}

class InitialState extends FilterPageState {}

class LoadingFilterPageState extends FilterPageState {}

class LoadedTopicsState extends FilterPageState {
  final List<TopicDescription> topics;

  LoadedTopicsState(this.topics);
}

class TopicSelectedState extends FilterPageState {
  final String topic;
  TopicSelectedState(this.topic);
}

class LoadingFiltersKeyState extends FilterPageState {}

class LoadedFilterKeysState extends FilterPageState {
  final List<String> filterKeys;

  LoadedFilterKeysState(this.filterKeys);
}

class FilterKeySelectedState extends FilterPageState {
  final List<String> selectedFilterKeys;
  FilterKeySelectedState(this.selectedFilterKeys);
}

class DurationSelectedState extends FilterPageState {
  // final bool userChoseDuration;
  // DurationSelectedState(this.userChoseDuration);
}

class UserTagPlacedState extends FilterPageState {}

class ErrorState extends FilterPageState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class FirstLvlTopicSelectedState extends FilterPageState {
  final String topic;
  FirstLvlTopicSelectedState(this.topic);
}
