import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../search_spec.dart';
import '../string_searcher/string_searcher.dart';
import '../string_searcher/substring_searcher.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final StringSearcher _searcher = SubstringSearcher();

  SearchBloc({
    required String initQuery,
    required IndexedStringBuilder searchValueBuilder,
    required int itemsLength,
  }) : super(
          const SearchStateInitial(),
        ) {
    on<SearchEventNewQuery>(_onNewQuery);
    on<SearchEventSelected>(_onSelected);

    () async {
      await _searcher.import(searchValueBuilder, itemsLength);
      add(SearchEventNewQuery(initQuery));
    }();
  }

  FutureOr<void> _onNewQuery(
    SearchEventNewQuery event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(SearchStateLoading.new));

    final result = await _searcher.search(event.query);

    emit(state.copyWith(
      SearchStateSearched.new,
      displayedIndexes: result.matches,
      query: result.query,
    ));
  }

  FutureOr<void> _onSelected(
    SearchEventSelected event,
    Emitter<SearchState> emit,
  ) {
    emit(SearchStateSelected.from(state, selectedIndex: event.index));
  }
}
