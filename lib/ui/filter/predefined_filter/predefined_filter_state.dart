part of 'predefined_filter_bloc.dart';

@immutable
abstract class PredefinedFilterState {}

class PredefinedFilterInitial extends PredefinedFilterState {}

class PredefinedFilterChangedState extends PredefinedFilterState {
  final String title;
  final bool isChecked;

  PredefinedFilterChangedState(this.title, this.isChecked);
}
