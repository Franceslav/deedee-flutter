part of 'bookmarks_bloc.dart';

@immutable
abstract class BookmarksEvent {}

class LoadBookmarksEvent extends BookmarksEvent {
  final String userId;

  LoadBookmarksEvent({
    required this.userId,
  });
}

class DeleteBookmarkEvent extends BookmarksEvent {
  final String userId;
  final Tag bookmark;
  final int bookmarkIndex;

  DeleteBookmarkEvent({
    required this.userId,
    required this.bookmark,
    required this.bookmarkIndex,
  });
}

class AddBookmarkEvent extends BookmarksEvent {
  final String userId;
  final String tagId;

  AddBookmarkEvent({
    required this.userId,
    required this.tagId,
  });
}
