part of 'user_tag_details_bloc.dart';

abstract class UserTagDetailsEvent {}

class LoadTagEvent extends UserTagDetailsEvent {
  final String userId;
  final String tagId;

  LoadTagEvent({
    required this.userId,
    required this.tagId,
  });
}
