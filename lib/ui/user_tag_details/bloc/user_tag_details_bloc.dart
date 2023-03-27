import 'package:bloc/bloc.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';

part 'user_tag_details_event.dart';

part 'user_tag_details_state.dart';

class UserTagDetailsBloc
    extends Bloc<UserTagDetailsEvent, UserTagDetailsState> {
  UserTagDetailsBloc() : super(InitialState()) {
    on<LoadTagEvent>(_onLoadTag);
  }

  _onLoadTag(LoadTagEvent event, Emitter<UserTagDetailsState> emit) async {
    try {
      final tag = await locator
          .get<TagRepository>()
          .getUserTag(event.userId, event.tagId);
      final tagDetails = await locator
          .get<TagRepository>()
          .getUserTagDetails(event.userId, event.tagId);
      emit(LoadedTagState(
        tag: tag,
        tagDetails: tagDetails,
      ));
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
