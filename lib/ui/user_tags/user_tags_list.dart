import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:deedee/ui/user_tags/user_tag_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return tags.isEmpty
        ? Center(
            child: Text(
              AppLocalizations.of(context)!.noUserTags,
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        : ListView.separated(
            itemBuilder: ((context, index) {
              final tag = tags[index];
              return Dismissible(
                key: ValueKey(tag.tagId),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Theme.of(context).errorColor,
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  final userId =
                      BlocProvider.of<UserBloc>(context).state.user.userId;
                  widget.onDismissed(tag, userId, index);
                },
                child: UserTagItem(tag: tag),
              );
            }),
            itemCount: tags.length,
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              );
            },
          );
  }

  List<Tag> sortTags() {
    switch (widget.tagsType) {
      case TagsType.actual:
        return widget.tags
            .where((tag) =>
                tag.dueDate.seconds.toInt() >=
                DateTime.now().millisecondsSinceEpoch / 1000)
            .toList();
      case TagsType.archive:
        return widget.tags
            .where((tag) =>
                tag.dueDate.seconds.toInt() <
                DateTime.now().millisecondsSinceEpoch / 1000)
            .toList();
    }
  }
}
