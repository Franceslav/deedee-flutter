import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/services/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'bookmarks_event.dart';

part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final TagRepository _tagRepository;
  final String userId;

  BookmarksBloc(this._tagRepository, this.userId) : super(InitialState()) {
    on<_BookmarksLoadedEvent>(_onBookmarksLoaded);
    on<DeleteBookmarkEvent>(_onDeleteBookmark);
    on<AddBookmarkEvent>(_onAddBookmark);
    on<UndoAddBookmarkEvent>(_onUndoAddBookmark);
    on<SearchBookmarksEvent>(_onSearchBookmark);
    on<UserOpenedTagMarkerEvent>(_onUserOpenedTagMarker);
    on<MapScreenIsDisposedEvent>(_loadBookmarks);
    _initialize();
  }

  void _initialize() async {
    try {
      final bookmarks = await _tagRepository.getFavoriteTags(userId);
      add(_BookmarksLoadedEvent(tags: bookmarks));
    } catch (error) {
      stderr.writeln(error.toString());
    }
  }

  void _onBookmarksLoaded(_BookmarksLoadedEvent event, Emitter<BookmarksState> emit) {
    emit(LoadedBookmarksState(event.tags));
  }

  void _loadBookmarks(BookmarksEvent _, Emitter<BookmarksState> emit) async {
    try {
      final bookmarks = await _tagRepository.getFavoriteTags(userId);
      emit(LoadedBookmarksState(bookmarks));
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  _onDeleteBookmark(
      DeleteBookmarkEvent event, Emitter<BookmarksState> emit) async {
    try {
      final response = await locator.get<GRCPRepository>().removeUserBookmark(
            event.userId,
            event.bookmark.tagId.toString(),
          );
      if (response) {
        emit(DeletedSuccessfulState());
      } else {
        emit(DeletedErrorState(
          bookmark: event.bookmark,
          bookmarkIndex: event.bookmarkIndex,
        ));
      }
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> _onAddBookmark(
    AddBookmarkEvent event,
    Emitter<BookmarksState> emit,
  ) async {
    try {
      final resultTag = await _tagRepository.addTagToFavorites(userId, event.tagId);
      emit(
          TagMarkerOpenedState(
              resultTag.tagId,
              isTagBookmarked: resultTag.status == Tag_Status.BOOKMARKED
          )
      );
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> _onUndoAddBookmark(
      UndoAddBookmarkEvent event,
      Emitter<BookmarksState> emit,
      ) async {
    try {
      final tag = await _tagRepository.removeTagFromFavorites(userId, event.tagId);
      emit(TagMarkerOpenedState(tag.tagId, isTagBookmarked: tag.status == Tag_Status.BOOKMARKED));
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  _onSearchBookmark(
      SearchBookmarksEvent event, Emitter<BookmarksState> emit) async {
    final tag = await _tagRepository.getTags(event.bookmarkName);
    emit(LoadedBookmarksState(tag));
  }

  void _onUserOpenedTagMarker(
      UserOpenedTagMarkerEvent event, Emitter<BookmarksState> emit) async {
    final List<Tag> favouriteTags = await _tagRepository.getFavoriteTags(userId);
    final tag = favouriteTags.firstWhereOrNull((tag) => tag.tagId == event.tagId);
    emit(TagMarkerOpenedState(event.tagId, isTagBookmarked: tag != null));
  }
}
