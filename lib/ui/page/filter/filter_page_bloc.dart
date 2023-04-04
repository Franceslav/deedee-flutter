import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/filter_repository.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:flutter/material.dart';
import 'package:search_address_repository/search_address_repository.dart';
import 'filter_screen.dart';

part 'filter_page_event.dart';
part 'filter_page_state.dart';

class FilterPageBloc extends Bloc<FilterPageEvent, FilterPageState> {
  final TopicRepository _topicRepository;
  final FilterRepository _filterRepository;
  final User _user;
  final CompositeFilter currentFilter;
  final TagRepository _tagRepository;

  List<String> _subtopics = [];
  List<String> _filterKeys = [];
  final Map<String, List<String>> _allSubtopicsFilter = {};
  final Map<String, List<String>> _selectedSubtopicsFilter = {};

  FilterPageBloc(this._topicRepository, this._filterRepository, this._user,
      this.currentFilter, this._tagRepository)
      : super(SubtopicListInitialState()) {
    on<FilterPageSubtopicSelectedEvent>(_selectSubtopics);
    on<FilterPageFilterKeySelectedEvent>(_selectFilterKey);
    on<PushFiltersEvent>(_onPushFilters);
    _initialize();
  }

  _selectSubtopics(FilterPageSubtopicSelectedEvent event, emit) async {
    final selectedSubtopic = event.selectedSubtopic;

    if (_selectedSubtopicsFilter.containsKey(selectedSubtopic)) {
      _selectedSubtopicsFilter.remove(selectedSubtopic);
    } else {
      _selectedSubtopicsFilter.addAll({selectedSubtopic: []});
    }

    emit(
      SubtopicListLoadedState(
        allSubtopicsFilter: _allSubtopicsFilter,
        selectedSubtopicsFilter: _selectedSubtopicsFilter,
      ),
    );
  }

  _selectFilterKey(FilterPageFilterKeySelectedEvent event, emit) async {
    final selectedSubtopic = event.selectedSubtopic;
    final selectedFilterKey = event.selectedFilterKey;

    if (_selectedSubtopicsFilter[selectedSubtopic] != null) {
      if (_selectedSubtopicsFilter[selectedSubtopic]!
          .contains(selectedFilterKey)) {
        _selectedSubtopicsFilter.update(
          selectedSubtopic,
          (value) {
            value.remove(selectedFilterKey);
            return value;
          },
        );
      } else {
        _selectedSubtopicsFilter.update(
          selectedSubtopic,
          (value) {
            value.add(selectedFilterKey);
            return value;
          },
        );
      }
    }
    emit(
      SubtopicListLoadedState(
        allSubtopicsFilter: _allSubtopicsFilter,
        selectedSubtopicsFilter: _selectedSubtopicsFilter,
      ),
    );
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

  _initialize() async {
    _subtopics = (await _topicRepository.getSubTopics(
            _user.lastGeoLocation.latitude, _user.lastGeoLocation.longitude))
        .map((e) => e.title)
        .toList();

    for (var i = 0; i <= _subtopics.length - 1; i++) {
      _filterKeys = (await _filterRepository.getFilterItems(_subtopics[i]))
          .map((fk) => fk.title)
          .toList();
      _allSubtopicsFilter.addAll({_subtopics[i]: _filterKeys});
    }
    emit(
      SubtopicListLoadedState(
        allSubtopicsFilter: _allSubtopicsFilter,
        selectedSubtopicsFilter: const {},
      ),
    );
  }
}
