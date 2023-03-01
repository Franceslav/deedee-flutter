import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/model/user_personal_filter.dart';
import 'package:deedee/services/grpc.dart';
import 'package:meta/meta.dart';

part 'saved_filters_event.dart';

part 'saved_filters_state.dart';

class SavedFiltersBloc extends Bloc<SavedFiltersEvent, SavedFiltersState> {
  SavedFiltersBloc() : super(InitialState()) {
    on<LoadFiltersEvent>(_onLoadFilters);
    on<PushSavedFiltersEvent>(_onPushSavedFilters);
    // on<TapBookmarkEvent>(_onTapBookmark);
  }

  _onLoadFilters(
      LoadFiltersEvent event, Emitter<SavedFiltersState> emit) async {
    try {
      final filters =
          await locator.get<GRCPUtils>().getUserSavedFilters(event.userId);
      print(filters);
      print('object');
      emit(LoadedFiltersState(filters as List<Filter>));
    } catch (error) {
      print('error');
      emit(ErrorState(error.toString()));
    }
  }

  _onPushSavedFilters(
      PushSavedFiltersEvent event, Emitter<SavedFiltersState> emit) async {
    // emit(LoadedFiltersState());
    try {
      Topic topic = await locator
          .get<GRCPUtils>()
          .getFilteredTags(event.topic, event.filterKeys, event.accountType);
      emit(UserSavedFiltersDoneState(topic));
      print('Перейти на карту');
      print(topic);
      print('Topic fin');
    } catch (error) {
      ErrorState(error.toString());
    }
  }
}
