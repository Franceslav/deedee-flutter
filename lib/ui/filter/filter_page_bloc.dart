import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/filter_repository.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:search_address_repository/search_address_repository.dart';

part 'subtopic_list/subtopic_list_event.dart';
part 'subtopic_list/subtopic_list_state.dart';

class FilterPageBloc extends Bloc<FilterPageEvent, FilterPageState> {
  final TopicRepository _topicRepository;
  final FilterRepository _filterRepository;
  final User _user;
  final CompositeFilter currentFilter;
  final TagRepository _tagRepository;

  List<String> _subtopics = [];

  FilterPageBloc(this._topicRepository, this._filterRepository, this._user,
      this.currentFilter, this._tagRepository)
      : super(SubtopicListInitialState()) {
    on<FilterPageChipSelectedEvent>(_selectChips);
    on<PushFiltersEvent>(_onPushFilters);
    initialize();
  }

  FutureOr<void> _selectChips(event, emit) async {
    var subtopic = event.selectedSubtopic;
    List<String> filterKeys = [];
    if (event.selectedSubtopic != '') {
      filterKeys = (await _filterRepository.getFilterItems(subtopic))
          .map((fk) => fk.title)
          .toList();
    }
    /*      currentFilter.filterKeys.clear();
    currentFilter.filterKeys.addAll(filterKeys);
  
    currentFilter.selectedFilterKeys.clear();
    currentFilter.selectedFilterKeys.addAll(event.selectedFilterKeys);*/

    emit(SubtopicListLoadedState(
        _subtopics, filterKeys, event.selectedFilterKeys));
  }

  _onPushFilters(event, emit) async {
    try {
      Topic topic = await _tagRepository.getFilteredTags(
          event.topic, event.filterKeys, event.accountType);
      emit(UserFiltersDoneState(topic));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  initialize() async {
    _subtopics = (await _topicRepository.getSubTopics(
            _user.lastGeoLocation.latitude, _user.lastGeoLocation.longitude))
        .map((e) => e.title)
        .toList();
    emit(SubtopicListLoadedState(
      _subtopics,
      currentFilter.filterKeys,
      currentFilter.selectedFilterKeys,
    ));
  }
}
