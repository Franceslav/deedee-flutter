import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
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
  }
}
