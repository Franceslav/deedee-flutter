import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';

part 'selector_event.dart';
part 'selector_state.dart';

class SelectorBloc extends Bloc<SelectorEvent, SelectorState> {
  final GRCPRepository _grpcRepository;
  final User _user;

  SelectorBloc(this._grpcRepository, this._user) : super(InitialState()) {
    on<LoadTopicsEvent>(_onLoadSubTopics);
    on<SelectTopicEvent>(_onSelectTopic);
    on<LoadFilterKeysEvent>(_onLoadFilterKeys);
    on<SelectFilterKeyEvent>(_onSelectFilterKey);
    on<SelectListFilterKeyEvent>(_onSelectListFilterKey);
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
      final response = await _grpcRepository.getSubTopics(
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
      final response = await _grpcRepository.getFilterItems(event.topic);
      emit(LoadedFilterKeysState(response.map((fi) => fi.title).toList()));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _onSelectFilterKey(SelectFilterKeyEvent event, Emitter<SelectorState> emit) {
    emit(FilterKeySelectedState(event.filterKey));
  }

  _onSelectListFilterKey(
      SelectListFilterKeyEvent event, Emitter<SelectorState> emit) {
    for (var element in event.listFilterKey) {
      emit(FilterKeySelectedState(element));
    }
  }

  _onSelectLocation(SelectLocationEvent event, Emitter<SelectorState> emit) {
    emit(LocationSelectedState(event.data));
  }

  _onPushFilters(PushFiltersEvent event, Emitter<SelectorState> emit) async {
    emit(LoadingSelectorState());
    try {
      Topic topic = await _grpcRepository.getFilteredTags(
          event.topic, event.filterKeys, event.accountType);
      emit(UserFiltersDoneState(topic));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _onSaveFilters(SaveFiltersEvent event, Emitter<SelectorState> emit) async {
    emit(LoadingSelectorState());
    try {
      Topic topic = await _grpcRepository.getFilteredTags(
          event.topic, event.filterKeys, event.accountType);
      emit(UserFiltersDoneState(topic));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _onPushTag(PushTagEvent event, Emitter<SelectorState> emit) async {
    emit(LoadingSelectorState());
    try {
      await _grpcRepository.placeTag(
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
