import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';

import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/locator.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

part 'filter_box_event.dart';

part 'filter_box_state.dart';

class FilterBoxBloc extends Bloc<FilterBoxEvent, FilterBoxState> {
  Map<String, bool> predefinedFilterActiveMap = <String, bool>{
    "маникюр": false,
    "в салоне": false,
    "на дому": false,
    "аппаратный": false,
    "комби": false,
    "классический": false,
    "гель-лак": false,
    "японский": false,
    "наращивание": false,
    "твердым гелем": false,
    "коррекция наращивания": false,
    "детский": false,
    "мужской": false,
  };

  FilterBoxBloc() : super(FilterBoxInitialState()) {
    on<FilterBoxChangeEvent>((event, emit) async {
      predefinedFilterActiveMap[event.title] = event.isChecked;
      emit(FilterBoxChangeState(predefinedFilterActiveMap));
    });

    on<FilterBoxFilterTagsEvent>((event, emit) async {
      final activeFilters = {
        for (final key in event.predefinedFilterActiveMap.keys)
          if (event.predefinedFilterActiveMap[key]!)
            key: event.predefinedFilterActiveMap[key]
      }.keys.toList();

      Topic topic = await serviceLocator.get<GRCPUtils>().getFilteredTags(
          event.topicTitle, activeFilters, event.accountType); //TODO: fix type

      emit(FilterBoxFilteredTagsReceivedState(topic: topic));
    });
  }

  filter(GlobalKey<FormState> key, String _bucket) async {}
}
