import 'package:bloc/bloc.dart';
part 'main_topic_event.dart';
part 'main_topic_state.dart';

class MainTopicBloc extends Bloc<MainTopicEvent, MainTopicState> {
  MainTopicBloc() : super(MainTopicUpdateState()) {

    on<MainTopicUpdateEvent>((event, emit) {
      _updateScreen();
    });
  }

  void _updateScreen() async {
    emit(
      MainTopicUpdateState(),
    );
  }
}
