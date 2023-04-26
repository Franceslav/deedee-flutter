import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/services/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'bookmarks_event.dart';

part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final TagRepository _tagRepository;

  BookmarksBloc(this._tagRepository) : super(InitialState()) {
    on<LoadBookmarksEvent>(_onLoadBookmarks);
    on<DeleteBookmarkEvent>(_onDeleteBookmark);
    on<AddBookmarkEvent>(_onAddBookmark);
    on<SearchBookmarksEvent>(_onSearchBookmark);
  }

  _onLoadBookmarks(
      LoadBookmarksEvent event, Emitter<BookmarksState> emit) async {
    try {
      final bookmarks = await _tagRepository.getFavoriteTags(event.userId);
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
      final tag =
          await _tagRepository.addTagToFavorites(event.userId, event.tagId);
    } catch (e) {
      print(e.toString());
    }
  }

  _onSearchBookmark(
      SearchBookmarksEvent event, Emitter<BookmarksState> emit) async {
    final tag = await _tagRepository.getTags(event.bookmarkName);
    emit(LoadedBookmarksState(tag));
  }
}
