part of 'predefined_filter_bloc.dart';

abstract class PredefinedFilterEvent {}

class PredefinedFilterChangedEvent extends PredefinedFilterEvent {
  final String title;
  final bool isChecked;

  PredefinedFilterChangedEvent(this.title, this.isChecked);
}
