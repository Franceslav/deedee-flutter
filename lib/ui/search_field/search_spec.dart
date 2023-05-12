import 'package:flutter/cupertino.dart';

typedef IndexedStringBuilder = String Function(int);

class SearchSpec {
  final IndexedWidgetBuilder itemBuilder;

  /// [StringSearcher] looks for the query within the value built by this
  final IndexedStringBuilder searchValueBuilder;

  final int length;

  final String initQuery;

  /// Is called on item tapped.
  /// ### Works only if item has not gesture detectors
  final void Function(int i)? onSelected;

  const SearchSpec({
    required this.searchValueBuilder,
    required this.itemBuilder,
    required this.length,
    this.onSelected,
    this.initQuery = '',
  });

  SearchSpec copyWith({
    IndexedWidgetBuilder? itemBuilder,
    int? length,
    String? initQuery,
    void Function(int i)? onSelected,
  }) {
    return SearchSpec(
      itemBuilder: itemBuilder ?? this.itemBuilder,
      searchValueBuilder: searchValueBuilder,
      length: length ?? this.length,
      initQuery: initQuery ?? this.initQuery,
      onSelected: onSelected ?? this.onSelected,
    );
  }
}
