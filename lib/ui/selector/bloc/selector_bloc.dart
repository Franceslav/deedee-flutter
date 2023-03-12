import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';

part 'selector_event.dart';
part 'selector_state.dart';

class SelectorBloc extends Bloc<SelectorEvent, SelectorState> {
  SelectorBloc() : super(InitialState()) {
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
  }

  _onLoadSubTopics(LoadTopicsEvent event, Emitter<SelectorState> emit) async {
    try {
      final response = await locator.get<GRCPRepository>().getSubTopics(
            event.location.latitude,
            event.location.longitude,
          );
      emit(LoadedTopicsState(response));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

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
          await locator.get<GRCPRepository>().getFilterItems(event.topic);
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
    emit(LoadingSelectorState());
    try {
      Topic topic = await locator
          .get<GRCPRepository>()
          .getFilteredTags(event.topic, event.filterKeys, event.accountType);
      emit(UserFiltersDoneState(topic));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _onSaveFilters(SaveFiltersEvent event, Emitter<SelectorState> emit) async {
    emit(LoadingSelectorState());
    try {
      Topic topic = await locator
          .get<GRCPRepository>()
          .getFilteredTags(event.topic, event.filterKeys, event.accountType);
      emit(UserFiltersDoneState(topic));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _onPushTag(PushTagEvent event, Emitter<SelectorState> emit) async {
    emit(LoadingSelectorState());
    try {
      await locator.get<GRCPRepository>().placeTag(
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
