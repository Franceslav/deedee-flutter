import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'predefined_filter_event.dart';

part 'predefined_filter_state.dart';

class PredefinedFilterBloc
    extends Bloc<PredefinedFilterEvent, PredefinedFilterState> {
  PredefinedFilterBloc() : super(PredefinedFilterInitial()) {
    on<PredefinedFilterChangedEvent>((event, emit) async {
      emit(PredefinedFilterChangedState(event.title, event.isChecked));
    });
  }
}
