import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/grpc.dart';
import 'package:meta/meta.dart';

part 'bookmarks_event.dart';

part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  BookmarksBloc() : super(InitialState()) {
    on<LoadBookmarksEvent>(_onLoadBookmarks);
    on<DeleteBookmarkEvent>(_onDeleteBookmark);
    on<TapBookmarkEvent>(_onTapBookmark);
  }

  _onLoadBookmarks(
      LoadBookmarksEvent event, Emitter<BookmarksState> emit) async {
    try {
      final bookmarks =
          await locator.get<GRCPUtils>().getUserBookmarks(event.userId);
      emit(LoadedBookmarksState(bookmarks));
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  _onDeleteBookmark(
      DeleteBookmarkEvent event, Emitter<BookmarksState> emit) async {
    try {
      final response = await locator.get<GRCPUtils>().removeUserBookmark(
            event.userId,
            event.bookmark.tagId,
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

  _onTapBookmark(TapBookmarkEvent event, Emitter<BookmarksState> emit) async {
    //do something
  }
}
