part of 'line_chart_bloc.dart';


abstract class LineChartState {
  LineChartState();
}

class LineChartInitial extends LineChartState {
  final ChartType chartType;

  LineChartInitial({required this.chartType});
  
}

class SelectedChartTypeState extends LineChartState {
  final ChartType chartType;

  SelectedChartTypeState({required this.chartType});
  
}

class FailureSelectedChartState extends LineChartState {
  final String? failureMessage;

  FailureSelectedChartState({required this.failureMessage});
  
  
}
