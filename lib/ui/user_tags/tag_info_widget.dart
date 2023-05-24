import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/calendar_dialog.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:deedee/ui/user_tags/bloc/user_tags_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../generated/deedee/api/model/composite_filter.pb.dart';

class TagInfoWidget extends StatefulWidget {
  final CompositeFilter currentFilter;
  const TagInfoWidget({
    super.key, required this.currentFilter,
  });

  @override
  State<TagInfoWidget> createState() => _TagInfoWidget();
}

class _TagInfoWidget extends State<TagInfoWidget> {
  List<Tag> _tags = [];

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = UserTagsBloc(locator.get<TagRepository>(), user);

    ImageIcon getIcon(CompositeFilter currentFilter) {
      switch (currentFilter.topic.title) {
        case 'Children':
          return const ImageIcon(
              AssetImage('assets/images/topic_children.png'));
        case 'Auto':
          return const ImageIcon(AssetImage('assets/images/topic_auto.png'));
        case 'Beauty':
          return const ImageIcon(AssetImage('assets/images/topic_beauty.png'));
        case 'Cleaning':
          return const ImageIcon(
              AssetImage('assets/images/topic_cleaning.png'));
        case 'Overhaul':
          return const ImageIcon(
              AssetImage('assets/images/topic_overhaul.png'));
        case 'Workers':
          return const ImageIcon(AssetImage('assets/images/topic_workers.png'));
        default:
          return const ImageIcon(
              AssetImage('assets/images/topic_children.png'));
      }
    }
    return Row(
      children: [
        const SizedBox(width: 15),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: 45,
            width: 45,
            child: getIcon(widget.currentFilter),
          ),
        ),
        const SizedBox(width: 50,),
        const Icon(
          Icons.visibility,
        ),
        const SizedBox(width: 5,),
        const Text('45', style: TextStyle(fontSize: 20)),
        const SizedBox(width: 20,),
        const Text('6', style: TextStyle(fontSize: 20)),
        const SizedBox(width: 5,),
        const Icon(
          Icons.arrow_upward,
        ),
        const SizedBox(width: 40,),
        IconButton(
          onPressed: () =>
              showDialog(
                context: context,
                builder: (ctx) => const CalendarDialog(),
              ),
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }
}
