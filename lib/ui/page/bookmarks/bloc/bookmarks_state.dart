part of 'bookmarks_bloc.dart';

@immutable
abstract class BookmarksState {}

class InitialState extends BookmarksState {}

class LoadedBookmarksState extends BookmarksState {
  final List<Tag> bookmarks;
  LoadedBookmarksState(this.bookmarks);
}

class AddedSuccessfullyState extends BookmarksState {
  final Tag newBookmark;
  AddedSuccessfullyState({required this.newBookmark});
}

class AddUndoneState extends BookmarksState {
  final Int64 undoneBookmarkId;
  AddUndoneState({required this.undoneBookmarkId});
}

class DeletedSuccessfulState extends BookmarksState {}

class DeletedErrorState extends BookmarksState {
  final Tag bookmark;
  final int bookmarkIndex;

  DeletedErrorState({
    required this.bookmark,
    required this.bookmarkIndex,
  });
}

class ErrorState extends BookmarksState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class TapSuccessfulState extends BookmarksState {
  TapSuccessfulState();
}
