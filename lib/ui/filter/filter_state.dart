part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}

class ValidFilterField extends FilterState {}

class FilterFailureState extends FilterState {
  final String errorMessage;

  FilterFailureState({required this.errorMessage});
}

class FilterTagsDoneState extends FilterState {
  final Bucket bucket;

  FilterTagsDoneState(this.bucket);
}

class FilterChangeState extends FilterState {
  final Map<String, bool> predefinedFilterActiveMap;
  final AccountType accountType;

  FilterChangeState(this.predefinedFilterActiveMap, this.accountType);
}
