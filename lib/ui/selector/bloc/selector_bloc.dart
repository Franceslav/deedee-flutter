import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/generated/deedee/api/model/subtopic.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/composite_filter_repository.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';

part 'selector_event.dart';
part 'selector_state.dart';

class SelectorBloc extends Bloc<SelectorEvent, SelectorState> {
  final TagRepository _tagRepository;
  final TopicRepository _topicRepository;
  final CompositeFilterRepository _compositeFilterRepository;
  final User _user;

  SelectorBloc(
    this._tagRepository,
    this._topicRepository,
    this._compositeFilterRepository,
    this._user,
  ) : super(InitialState()) {
    on<LoadTopicsEvent>(_onLoadSubTopics);
    on<SelectTopicEvent>(_onSelectTopic);
    on<LoadFilterKeysEvent>(_onLoadFilterKeys);
    on<SelectFilterKeyEvent>(_onSelectFilterKey);
    on<PushFiltersEvent>(_onPushFilters);
    on<SaveFiltersEvent>(_onSaveFilters);
    on<PushTagEvent>(_onPushTag);
    on<SelectLocationEvent>(_onSelectLocation);

    on<DurationSelectedEvent>(_userChoseDuration);

    on<SelectFirstLvlTopicEvent>(_onSelectFirstLvlTopic);
    initialize();
  }

  initialize() async {
    try {
      final response = await _topicRepository.getSubTopics(
        _user.userId,
        0, //FIXME:
        _user.lastGeoLocation.latitude,
        _user.lastGeoLocation.longitude,
      );
      emit(LoadedTopicsState(response));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _onLoadSubTopics(LoadTopicsEvent event, Emitter<SelectorState> emit) async {}

  _onSelectTopic(SelectTopicEvent event, Emitter<SelectorState> emit) {
    emit(TopicSelectedState(event.topic));
  }

  _onSelectFirstLvlTopic(
      SelectFirstLvlTopicEvent event, Emitter<SelectorState> emit) {
    emit(FirstLvlTopicSelectedState(event.topic));
  }

  _onLoadFilterKeys(
      LoadFilterKeysEvent event, Emitter<SelectorState> emit) async {
    emit(LoadingFiltersKeyState());
    try {
      final response =
          await _compositeFilterRepository.getFilterKeys(event.topic);
      emit(LoadedFilterKeysState(response.map((fi) => fi.title).toList()));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _onSelectFilterKey(SelectFilterKeyEvent event, Emitter<SelectorState> emit) {
    emit(FilterKeySelectedState(event.filterKey));
  }

  _onSelectLocation(SelectLocationEvent event, Emitter<SelectorState> emit) {
    emit(LocationSelectedState(event.data));
  }

  _onPushFilters(PushFiltersEvent event, Emitter<SelectorState> emit) async {
    try {
      Topic topic = (await _topicRepository.getTopics(0, 0)).first; //TODO:
      emit(UserFiltersDoneState(topic));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _onSaveFilters(SaveFiltersEvent event, Emitter<SelectorState> emit) async {
    try {
      Topic topic = (await _topicRepository.getTopics(0, 0)).first; //TODO:
      emit(UserFiltersDoneState(topic));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _onPushTag(PushTagEvent event, Emitter<SelectorState> emit) async {
    emit(LoadingSelectorState());
    try {
      await _tagRepository.placeTag(
        event.accountType,
        event.topic,
        event.messengerId,
        event.location.latitude,
        event.location.longitude,
        event.filterKeys,
      );
      emit(UserTagPlacedState());
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _userChoseDuration(
      DurationSelectedEvent event, Emitter<SelectorState> emit) async {
    try {
      emit(DurationSelectedState());
    } catch (error) {
      ErrorState(error.toString());
    }
  }
}
