part of 'servis_provider_tags_bloc.dart';

abstract class ProviderTagsEvent {}

class DeleteTagEvent extends ProviderTagsEvent {
  final Tag tag;
  final String userId;
  final int index;

  DeleteTagEvent({
    required this.tag,
    required this.userId,
    required this.index,
  });
}

class SearchUserTagsEvent extends ProviderTagsEvent {
  final String tagName;

  SearchUserTagsEvent(this.tagName);
}
