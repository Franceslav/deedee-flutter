import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../chart_type.dart';

part 'line_chart_event.dart';

part 'line_chart_state.dart';

class LineChartBloc extends Bloc<LineChartEvent, LineChartState> {
   LineChartBloc() : super(LineChartInitial(chartType: ChartType.bar)) {
    on<LoadLineChartEvent>((event, emit) {
      emit(SelectedChartTypeState(chartType: event.type));
      
    });
    
  }
}
