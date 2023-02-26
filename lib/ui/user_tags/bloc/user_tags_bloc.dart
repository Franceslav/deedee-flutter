import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/grpc.dart';

part 'user_tags_event.dart';
part 'user_tags_state.dart';

class UserTagsBloc extends Bloc<UserTagsEvent, UserTagsState> {
  UserTagsBloc() : super(InitialState()) {
    on<LoadTagsEvent>(_onLoadTags);
    on<DeleteTagEvent>(_onDeleteTags);
  }

  _onLoadTags(LoadTagsEvent event, Emitter<UserTagsState> emit) async {
    try {
      final tags = await locator.get<GRCPUtils>().getUserTags(event.userId);
      emit(LoadedTagsState(tags: tags));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }

  _onDeleteTags(DeleteTagEvent event, Emitter<UserTagsState> emit) async {
    try {
      final response = await locator.get<GRCPUtils>().removeUserTag(
            event.userId,
            event.tag.tagId,
          );
      if (response) {
        emit(DeletedSuccessfulState());
      } else {
        //without delay this error appears 'A dismissed Dismissible widget is still part of the tree.'
        await Future.delayed(const Duration(seconds: 1));
        emit(DeletedErrorState(
          tag: event.tag,
          index: event.index,
        ));
      }
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }
}
