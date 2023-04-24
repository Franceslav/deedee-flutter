import 'package:bloc/bloc.dart';
import 'package:deedee/generated/tag_service.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';
// import 'package:deedee/services/fake/api/tag_repository.dart';
import 'package:deedee/services/grpc.dart';
import 'package:fixnum/fixnum.dart';

part 'user_tags_event.dart';

part 'user_tags_state.dart';

class UserTagsBloc extends Bloc<UserTagsEvent, UserTagsState> {
  final TagRepository _tagRepository;
  UserTagsBloc(this._tagRepository) : super(InitialState()) {
    on<LoadTagsEvent>(_onLoadTags);
    on<DeleteTagEvent>(_onDeleteTags);
    on<SearchUserTagsEvent>(_onSearchTags);
  }

  _onLoadTags(LoadTagsEvent event, Emitter<UserTagsState> emit) async {
    try {
      // final tags =
      //     await locator.get<GRCPRepository>().getUserTags(event.userId);
      // emit(LoadedTagsState(tags: tags));
      final tags = await _tagRepository.getTags(
        event.userId,
      );
      emit(LoadedTagsState(tags: tags));
    } catch (error) {
      emit(ErrorState(
        errorMessage: error.toString(),
      ));
    }
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
}
