import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:latlong2/latlong.dart';

part 'main_topics_event.dart';
part 'main_topics_state.dart';

class MainTopicsBloc extends Bloc<MainTopicsEvent, MainTopicsState> {
  final TopicRepository _topicRepository;

  MainTopicsBloc(this._topicRepository) : super(InitialState()) {
    on<LoadMainTopicsEvent>(_onLoadMainTopics);
  }

  void _onLoadMainTopics(
      LoadMainTopicsEvent event, Emitter<MainTopicsState> emit) async {
    try {
      final mainTopics = await _topicRepository.getTopics(
        event.userLocation.latitude,
        event.userLocation.longitude,
      );
      emit(LoadedMainTopicsState(mainTopics));
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }
}
