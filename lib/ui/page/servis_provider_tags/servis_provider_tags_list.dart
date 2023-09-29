import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'tag_card_widget.dart';

enum TagsType { actual, archive }

class UserTagsList extends StatefulWidget {
  final TagsType tagsType;
  final List<Tag> tags;
  final void Function(Tag tag, String userId, int index) onDismissed;

  const UserTagsList({
    super.key,
    required this.tags,
    required this.tagsType,
    required this.onDismissed,
  });

  @override
  State<UserTagsList> createState() => _UserTagsListState();
}

class _UserTagsListState extends State<UserTagsList> {
  @override
  Widget build(BuildContext context) {
    final tags = sortTags();
    final userId = context.read<UserBloc>().state.user.userId;

    if (tags.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context)!.noUserTags,
          style: Theme.of(context).textTheme.headline1,
        ),
      );
    }
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: ((context, i) {
        return TagCardWidget(
          onDismissed: () => widget.onDismissed(tags[i], userId, i),
          tag: tags[i],
        );
      }),
      itemCount: tags.length,
      separatorBuilder: (_, __) {
        return const DeeDeeDeviderWidget();
      },
    );
  }

  List<Tag> sortTags() {
    switch (widget.tagsType) {
      case TagsType.actual:
        return widget.tags
            .where((tag) =>
                tag.status == Tag_Status.PLACED ||
                tag.status == Tag_Status.CHANGED ||
                tag.status == Tag_Status.BOOKMARKED ||
                tag.status == Tag_Status.SUBSCRIBED)
            .toList();
      case TagsType.archive:
        return widget.tags
            .where((tag) => tag.status == Tag_Status.DELETED)
            .toList();
    }
  }
}
