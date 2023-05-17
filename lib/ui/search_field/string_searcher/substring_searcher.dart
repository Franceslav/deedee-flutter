import 'package:deedee/ui/search_field/string_searcher/string_searcher.dart';

import '../search_spec.dart';

/// Uses elementary dynamic programming optimization for searching
class SubstringSearcher implements StringSearcher {
  late IndexedStringBuilder stringBuilder;
  late final int length;

  SearchResult? prevResult;

  @override
  Future<void> import(IndexedStringBuilder stringBuilder, int length) async {
    this.stringBuilder = stringBuilder;
    this.length = length;
  }

  @override
  Future<SearchResult> search(String query) async {
    late List<Index> matches;
    if (prevResult != null && query.contains(prevResult!.query)) {
      matches = searchQueryInIndexed(prevResult!.matches, query);
    } else {
      final indexes = List.generate(length, (i) => i);
      matches = searchQueryInIndexed(indexes, query);
    }
    prevResult = SearchResult(matches: matches, query: query);
    return prevResult!;
  }

  List<Index> searchQueryInIndexed(List<Index> indexes, String query) {
    final matches = <Index>[];
    for (final i in indexes) {
      if (stringBuilder(i).contains(query)) {
        matches.add(i);
      }
    }
    return matches;
  }
}
