import '../search_spec.dart';

typedef Index = int;

abstract class StringSearcher {
  Future<void> import(IndexedStringBuilder stringBuilder, int length);

  Future<SearchResult> search(String query);
}

class SearchResult {
  final List<Index> matches;
  final String query;

  SearchResult({
    required this.matches,
    required this.query,
  });
}
