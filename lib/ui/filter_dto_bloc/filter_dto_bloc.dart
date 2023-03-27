import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/generated/filter_service.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/filter_dto.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/filter_repository.dart';
import 'package:deedee/repository/tag_repository.dart';

part 'filter_dto_event.dart';

part 'filter_dto_state.dart';

class FilterDTOBloc extends Bloc<FilterDTOEvent, FilterDTOState> {
  FilterDTOBloc() : super(FilterDTOState([])) {
    on<LoadFiltersEvent>(_onLoadFilters);
    on<PushSavedFiltersEvent>(_onPushSavedFilters);
    on<AddFilterDTOSubscription>(_onAddFilterDTOSubscription);
    on<GetFilterDTOSubscription>(_onGetFilterDTOSubscription);
    on<RemoveFilterEvent>(_onRemoveFilterEvent);
  }

  _onLoadFilters(LoadFiltersEvent event, Emitter<FilterDTOState> emit) async {
    try {
      // TODO: DEEMOB-97
      final stream = await locator
          .get<FilterRepository>()
          .getUserSavedFilters(event.userId);

      // StreamSubscription<Filter>? _filterSubscription = _someShitTasksNotifier.listen(
      //       (someShitTask) => add(CurrentBlocEvent._someShit(someShitTask)),
      // );

      List<FilterDTO> filters = [];
      stream.listen((value) {
        filters.add(
          FilterDTO(
            filterId: value.filterId,
            userId: value.userId,
            topic: value.topic,
            subtopic: value.topic,
            filterKeys: value.filterKeys.map((fk) => fk.title).toList(),
            bookmarked: value.bookmarked,
            subscribed: value.subscribed,
          ),
        );
      });

      // StreamSubscription<Filter> streamSubscription = filters.listen(filter)
      //  print('Value from controller: $value');

      // final filterDTOList = await filters
      // .map(
      //   (filter) => FilterDTO(
      //     filterId: filter.filterId,
      //     userId: filter.userId,
      //     topic: filter.topic,
      //     subtopic: filter.subtopic,
      //     filterKeys: filter.filterKeys.map((fk) => fk.title).toList(),
      //     bookmarked: filter.bookmarked,
      //     subscribed: filter.subscribed,
      //   ),
      // )
      // .toList();

      emit(FilterDTOState(filters));
    } catch (error) {
      print(error.toString());
    }
  }

  _onPushSavedFilters(
      PushSavedFiltersEvent event, Emitter<FilterDTOState> emit) async {
    try {
      Topic topic = await locator
          .get<TagRepository>()
          .getFilteredTags(event.topic, event.filterKeys, event.accountType);
      // emit(UserSavedFiltersDoneState(topic));
    } catch (error) {
      print(error.toString());
    }
  }

  _onRemoveFilterEvent(
      RemoveFilterEvent event, Emitter<FilterDTOState> emit) async {
    FilterDTOState(
      state.filterDTOList..removeAt(event.index),
    );
    try {
      await locator
          .get<FilterRepository>()
          .removeFilterSubscriptionElement(state.filterDTOList[event.index]);
    } catch (error) {
      print(error.toString());
    }
  }

  _onAddFilterDTOSubscription(
      AddFilterDTOSubscription event, Emitter<FilterDTOState> emit) async {
    emit(
      FilterDTOState(
        state.filterDTOList
          ..add(
            const FilterDTO(
              filterId: '',
              userId: '',
              topic: '',
              subtopic: '',
              filterKeys: [],
              bookmarked: true,
              subscribed: false,
            ),
          ),
      ),
    );
    try {
/*      final response = await locator
          .get<GRCPRepository>()
          .addFilterSubscriptionElement(event.userPersonalFilter);*/
    } catch (error) {
      print(error.toString());
    }
  }

  _onGetFilterDTOSubscription(
      GetFilterDTOSubscription event, Emitter<FilterDTOState> emit) async {
    try {
      final stream = await locator
          .get<FilterRepository>()
          .getFilterSubscriptions(event.userId);

      List<Filter> fproto = await stream.toList();

      List<FilterDTO> filters = fproto
          .map((f) => FilterDTO(
                filterId: f.filterId,
                userId: f.userId,
                filterKeys: f.filterKeys.map((e) => e.title).toList(),
                bookmarked: f.bookmarked,
                subscribed: f.subscribed,
                subtopic: f.subtopic,
                topic: f.topic,
              ))
          .toList();

      emit(
        FilterDTOState(
          state.filterDTOList..addAll(filters),
        ),
      );
    } catch (error) {
      print(error.toString());
    }
  }
}
