import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/tag_service.pb.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class UserTagItem extends StatefulWidget {
  final Tag tag;

  const UserTagItem({
    super.key,
    required this.tag,
  });

  @override
  State<UserTagItem> createState() => _UserTagStateState();
}

class _UserTagStateState extends State<UserTagItem> {
  @override
  Widget build(BuildContext context) {
    final tag = widget.tag;
    final String formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(
        DateTime.fromMillisecondsSinceEpoch(
            tag.createdAt.seconds.toInt() * 1000)); //TODO
    return ListTile(
      title: Text(tag.compositeFilter.topic.title),
      subtitle:
          Text('${AppLocalizations.of(context)!.tagExpires}: $formattedDate'),
      onTap: () {
        final userId = BlocProvider.of<UserBloc>(context).state.user.userId;
        context.router.push(UserTagDetailsScreenRoute(
          userId: userId,
          tagId: tag.tagId.toString(),
        ));
      },
    );
  }
}
