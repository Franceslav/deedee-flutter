import 'package:flutter/cupertino.dart';

typedef IndexedStringBuilder = String Function(int);

class SearchSpec {
  final IndexedWidgetBuilder itemBuilder;
  final IndexedStringBuilder searchValueBuilder;
  final int length;
  final String initQuery;
  final void Function(int i) onSelected;

  const SearchSpec({
    required this.searchValueBuilder,
    required this.itemBuilder,
    required this.length,
    required this.onSelected,
    this.initQuery = '',
  });

  SearchSpec copyWith({
    IndexedWidgetBuilder? itemBuilder,
    IndexedStringBuilder? searchValueBuilder,
    int? length,
    String? initQuery,
    void Function(int i)? onSelected,
  }) {
    return SearchSpec(
      itemBuilder: itemBuilder ?? this.itemBuilder,
      searchValueBuilder: searchValueBuilder ?? this.searchValueBuilder,
      length: length ?? this.length,
      initQuery: initQuery ?? this.initQuery,
      onSelected: onSelected ?? this.onSelected,
    );
  }
}
