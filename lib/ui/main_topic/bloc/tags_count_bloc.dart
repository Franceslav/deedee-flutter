import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/user.dart';
import '../../../repository/tag_repository.dart';

part 'tags_count_event.dart';
part 'tags_count_state.dart';

class TagsCountBloc extends Bloc<TagsCountEvent, TagsCountState> {
  final TagRepository tagRepository;
  final User user;

  TagsCountBloc({
    required this.tagRepository,
    required this.user,
  }) : super(TagsCountState(0)) {
    on<LoadingTagsCount>((event, emit) async {
      final response = await tagRepository.getTags(user.email);

      final int tagsCount = response
          .where((tag) => tag.compositeFilter.topic.topicId == event.topicId)
          .length;

      emit(TagsCountState(tagsCount));
    });
  }
}
