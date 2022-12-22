part of 'filter_box_bloc.dart';

@immutable
abstract class FilterBoxHomeState {}

class FilterBoxInitialState extends FilterBoxHomeState {}

class FilterBoxChangeState extends FilterBoxHomeState {
  final String topic;

  FilterBoxChangeState(this.topic);
}

class FilterBoxDoneState extends FilterBoxHomeState {
  final Bucket bucket;

  FilterBoxDoneState(this.bucket);
}

class FilterBoxGPSDoneState extends FilterBoxHomeState {
  final Position position;

  FilterBoxGPSDoneState(this.position);
}

class FilterBoxTopicsRetrievedState extends FilterBoxHomeState {
  final List<String> topics;

  FilterBoxTopicsRetrievedState(this.topics);
}
