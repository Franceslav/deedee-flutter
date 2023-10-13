import 'package:bloc/bloc.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/ui/page/map_cubit/tag_marker/tag_marker.dart';

part 'executors_panel_event.dart';
part 'executors_panel_state.dart';

class ExecutorsPanelBloc extends Bloc<ExecutorsPanelEvent, ExecutorsPanelState> {
  final User _user;
  final TagRepository _tagRepository;

  ExecutorsPanelBloc(this._user, this._tagRepository) : super(ExecutorsPanelInitial()) {
    on<LoadExecutorsPanelEvent>((event, emit) async {
       // var markersList = await _tagRepository.getTags(_user.email);
      emit(ExecutorsPanelLoadedState());
    });
  }
}
