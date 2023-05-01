part of 'user_tags_bloc.dart';

abstract class UserTagsEvent {}

class DeleteTagEvent extends UserTagsEvent {
  final Tag tag;
  final String userId;
  final int index;

  DeleteTagEvent({
    required this.tag,
    required this.userId,
    required this.index,
  });
}

class SearchUserTagsEvent extends UserTagsEvent {
  final String tagName;

  SearchUserTagsEvent(this.tagName);
}
