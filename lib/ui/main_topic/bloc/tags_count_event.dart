part of 'tags_count_bloc.dart';

@immutable
abstract class TagsCountEvent {}

class LoadingTagsCount extends TagsCountEvent {
  final int topicId;

  LoadingTagsCount(this.topicId);
}
