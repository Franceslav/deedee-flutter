part of 'main_topics_bloc.dart';

abstract class MainTopicsState {}

class InitialState extends MainTopicsState {}

class LoadedMainTopicsState extends MainTopicsState {
  final List<TopicDescription> mainTopics;

  LoadedMainTopicsState(this.mainTopics);
}

class ErrorState extends MainTopicsState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}
