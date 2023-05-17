import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/composite_filter_repository.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:flutter/material.dart';
import 'package:search_address_repository/search_address_repository.dart';

part 'filter_page_event.dart';

part 'filter_page_state.dart';

class FilterPageBloc extends Bloc<FilterPageEvent, FilterPageState> {
  final TopicRepository _topicRepository;
  final CompositeFilterRepository _filterRepository;
  final User _user;
  final CompositeFilter _currentFilter;
  final TagRepository _tagRepository;
  String deviceLanguage = Platform.localeName.substring(0, 2);

  List<String> _subtopics = [];
  List<String> _filterKeys = [];
  final Map<String, FilterKeyList> _allSubtopicsFilter = {};
  final Map<String, List<String>> _selectedSubtopicsFilter = {};

  FilterPageBloc(this._topicRepository, this._filterRepository, this._user,
      this._currentFilter, this._tagRepository)
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

  _onPushFilters(PushFiltersEvent event, emit) async {
    try {
      List<Tag> tagsOnMap = [];
      List<Tag> tags = await _tagRepository.getTags(_user.email);
      tagsOnMap.addAll(tags.filter((element) =>
          element.compositeFilter.topic.title == event.topic &&
          element.compositeFilter.filterMap.containsKey(event.subtopic.first) &&
          _filterKeys.containsAll(event.filterKeys)));

      emit(UserFiltersDoneState(tagsOnMap));
    } catch (error) {
      ErrorState(error.toString());
    }
  }

  _initialize() async {
    _subtopics = (await _topicRepository.getSubTopics(
      _user.userId,
      _currentFilter.topic.topicId,
      _user.lastGeoLocation.latitude,
      _user.lastGeoLocation.longitude,
    ))
        .map((e) => e.title)
        .toList();

    for (var i = 0; i <= _subtopics.length - 1; i++) {
      _filterKeys = (await _filterRepository.getFilterKeys(_subtopics[i]))
          .map((fk) => fk.title)
          .toList();
      final filterKeyList = FilterKeyList(
        filterKeys: _filterKeys.map(
          (e) => FilterKey(title: e),
        ),
      );
      _allSubtopicsFilter.addAll({_subtopics[i]: filterKeyList});
    }

    _currentFilter.filterMap.forEach((key, value) {
      if (value.filterKeys.firstOrNullWhere((element) => element.selected) !=
          null) {
        for (var filter in value.filterKeys) {
          if (filter.selected) {
            if (_selectedSubtopicsFilter.containsKey(key)) {
              _selectedSubtopicsFilter.update(key, (value) {
                value.add(filter.title);
                return value;
              });
            } else {
              _selectedSubtopicsFilter.addAll({
                key: [filter.title]
              });
            }
          }
        }
      }
    });

    emit(
      SubtopicListLoadedState(
        allSubtopicsFilter: _allSubtopicsFilter,
        selectedSubtopicsFilter: _selectedSubtopicsFilter,
      ),
    );
  }
}
