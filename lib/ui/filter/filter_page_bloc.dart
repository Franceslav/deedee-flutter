import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/filter_repository.dart';
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

  List<String> _subtopics = [];

  FilterPageBloc(this._topicRepository, this._filterRepository, this._user,
      this.currentFilter)
      : super(SubtopicListInitialState()) {
    on<FilterPageChipSelectedEvent>((event, emit) async {
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

      emit(SubtopicListLoadedState(_subtopics, filterKeys,
          event.selectedFilterKeys));
    });

    initialize();
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
