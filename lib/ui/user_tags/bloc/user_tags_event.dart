part of 'user_tags_bloc.dart';

abstract class UserTagsEvent {}

class LoadTagsEvent extends UserTagsEvent {
  final String userId;

  LoadTagsEvent({
    required this.userId,
  });
}

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
