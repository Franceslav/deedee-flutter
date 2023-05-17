import 'package:flutter/material.dart';

@immutable
abstract class SearchEvent {}

class SearchEventNewQuery extends SearchEvent {
  final String query;

  SearchEventNewQuery(this.query);
}

class SearchEventSelected extends SearchEvent {
  final int index;

  SearchEventSelected(this.index);
}
