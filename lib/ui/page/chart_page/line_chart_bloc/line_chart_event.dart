part of 'line_chart_bloc.dart';

@immutable
abstract class LineChartEvent {}

class LoadLineChartEvent extends LineChartEvent {
  final ChartType type;
  LoadLineChartEvent({required this.type});
}
