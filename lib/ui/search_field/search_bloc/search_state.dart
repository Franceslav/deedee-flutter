import 'package:flutter/foundation.dart';

typedef SearchStateBuilder<T> = T Function({
  required List<int> displayedIndexes,
  required String query,
});

@immutable
abstract class SearchState {
  final String query;
  final List<int> displayedIndexes;

  const SearchState({
    required this.query,
    required this.displayedIndexes,
  });

  S copyWith<S extends SearchState>(
    SearchStateBuilder builder, {
    List<int>? displayedIndexes,
    String? query,
  }) {
    return builder(
      query: query ?? this.query,
      displayedIndexes: displayedIndexes ?? this.displayedIndexes,
    );
  }

  SearchState.from(SearchState state)
      : displayedIndexes = state.displayedIndexes,
        query = state.query;
}

class SearchStateInitial extends SearchState {
  const SearchStateInitial() : super(displayedIndexes: const [], query: '');
}

class SearchStateLoading extends SearchState {
  const SearchStateLoading({
    required super.query,
    required super.displayedIndexes,
  });
}

class SearchStateSelected extends SearchState {
  final int selectedIndex;

  SearchStateSelected.from(
    SearchState state, {
    required this.selectedIndex,
  }) : super.from(state);
}

class SearchStateSearched extends SearchState {
  const SearchStateSearched({
    required super.query,
    required super.displayedIndexes,
  });
}
