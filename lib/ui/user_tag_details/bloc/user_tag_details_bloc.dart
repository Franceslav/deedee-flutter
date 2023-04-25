import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:fixnum/fixnum.dart';

part 'user_tag_details_event.dart';

part 'user_tag_details_state.dart';

class UserTagDetailsBloc
    extends Bloc<UserTagDetailsEvent, UserTagDetailsState> {
  UserTagDetailsBloc() : super(InitialState()) {
    on<LoadTagEvent>(_onLoadTag);
  }
  Tag? _tag;

  _onLoadTag(LoadTagEvent event, Emitter<UserTagDetailsState> emit) async {
    try {
      if (_tag != null) {
        final tags = await locator.get<TagRepository>().getTags(
            _tag!.compositeFilter.topic.topicId.toString());/*
            AccountType.buy); //TODO
*/
        emit(LoadedTagState(
          tag: tags.first,
        ));
      } else {
        final tags = await locator
            .get<TagRepository>()
            .getTags(''); //TODO
        emit(LoadedTagState(
          tag: tags.first,
        ));
      }
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
