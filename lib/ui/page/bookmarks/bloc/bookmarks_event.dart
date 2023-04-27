part of 'bookmarks_bloc.dart';

@immutable
abstract class BookmarksEvent {}

class _BookmarksLoadedEvent extends BookmarksEvent {
  final List<Tag> tags;

  _BookmarksLoadedEvent({
    required this.tags,
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
  final Int64 tagId;

  AddBookmarkEvent({
    required this.tagId,
  });
}

class UndoAddBookmarkEvent extends BookmarksEvent {
  final Int64 tagId;

  UndoAddBookmarkEvent({
    required this.tagId,
  });
}

class SearchBookmarksEvent extends BookmarksEvent {
  final String bookmarkName;

  SearchBookmarksEvent(this.bookmarkName);
}
