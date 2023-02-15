part of 'selector_bloc.dart';

abstract class SelectorState {}

class InitialState extends SelectorState {}

class LoadingSelectorState extends SelectorState {}

class LoadedTopicsState extends SelectorState {
  final List<String> topics;

  LoadedTopicsState(this.topics);
}

class TopicSelectedState extends SelectorState {
  final String topic;
  TopicSelectedState(this.topic);
}

class LoadingFiltersKeyState extends SelectorState {}

class LoadedFilterKeysState extends SelectorState {
  final List<String> filterKeys;

  LoadedFilterKeysState(this.filterKeys);
}

class FilterKeySelectedState extends SelectorState {
  final String filterKey;
  FilterKeySelectedState(this.filterKey);
}

class LocationSelectedState extends SelectorState {
  final AddressModel data;

  LocationSelectedState(this.data);
}

class UserFiltersDoneState extends SelectorState {
  final Topic topic;

  UserFiltersDoneState(this.topic);
}

class UserTagPlacedState extends SelectorState {}

class ErrorState extends SelectorState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class FirstLvlTopicSelectedState extends SelectorState {
  final String topic;
  FirstLvlTopicSelectedState(this.topic);
}
