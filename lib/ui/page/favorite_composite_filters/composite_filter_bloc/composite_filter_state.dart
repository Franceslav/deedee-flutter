part of 'composite_filter_bloc.dart';

@immutable
abstract class CompositeFilterState {}

class CompositeFilterInitial extends CompositeFilterState {}

class CompositeFilterLoadState extends CompositeFilterState {
  final List<CompositeFilter> compositeFilterList;

  CompositeFilterLoadState(this.compositeFilterList);
}

class CompositeFilterCreateState extends CompositeFilterState {
  final CompositeFilter compositeFilter;

  CompositeFilterCreateState(this.compositeFilter);
}

class CompositeFilterDeleteSuccessfulState extends CompositeFilterState {}

class CompositeFilterDeleteErrorState extends CompositeFilterState {
  final CompositeFilter compositeFilter;
  final int index;

  CompositeFilterDeleteErrorState({
    required this.compositeFilter,
    required this.index,
  });
}

class ErrorState extends CompositeFilterState {
  final String errorMessage;

  ErrorState({
    required this.errorMessage,
  });
}
