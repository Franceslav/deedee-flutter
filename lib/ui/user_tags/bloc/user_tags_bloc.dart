import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/repository/observation_repository.dart';
import 'package:fixnum/fixnum.dart';

import '../../../model/user.dart';

part 'user_tags_event.dart';

part 'user_tags_state.dart';

class UserTagsBloc extends Bloc<UserTagsEvent, UserTagsState> {
  final TagRepository _tagRepository;
  final User _user;
  final ObservationRepository _observationRepository;

  UserTagsBloc(this._tagRepository, this._observationRepository, this._user) : super(InitialState()) {
    on<DeleteTagEvent>(_onDeleteTags);
    on<SearchUserTagsEvent>(_onSearchTags);
    _init();
  }

  _onDeleteTags(DeleteTagEvent event, Emitter<UserTagsState> emit) async {
    try {
      final response =
          await _tagRepository.deleteTag(event.userId, event.tag.tagId);
      if (response.status == Tag_Status.DELETED) {
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

  _onSearchTags(SearchUserTagsEvent event, Emitter<UserTagsState> emit) async {
    final searchTag = await _tagRepository.getTags(event.tagName);
    emit(LoadedTagsState(tags: searchTag));
  }

  _init() async {
    try {
      final tags = await _tagRepository.getTags(_user.email);
      _observationRepository.addObservation(
        observationId: Int64(DateTime.now().microsecondsSinceEpoch),
        userId: Int64(1),
        latitude: 8.91489,
        longitude: 38.5169,
        );
      emit(LoadedTagsState(tags: tags));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
  }
}
