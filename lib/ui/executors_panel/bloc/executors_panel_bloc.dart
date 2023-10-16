import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/ui/page/map_cubit/tag_marker/tag_marker.dart';

part 'executors_panel_event.dart';
part 'executors_panel_state.dart';

class ExecutorsPanelBloc extends Bloc<ExecutorsPanelEvent, ExecutorsPanelState> {
  late TagRepository _tagRepository;

  ExecutorsPanelBloc() : super(ExecutorsPanelInitial()) {
    on<LoadExecutorsPanelEvent>((event, emit) async {

      emit(ExecutorsPanelLoadedState());
    });
  }
}
