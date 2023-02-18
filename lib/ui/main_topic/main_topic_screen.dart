import 'dart:async';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/main_topic/enum/topic_screens_enum.dart';
import 'package:deedee/ui/place_tag/place_tag_screen.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../topic/topic_widget.dart';
import 'main_topic_bloc.dart';

class MainTopicPage extends StatelessWidget {
  MainTopicPage({super.key, required this.screenType});
  
  final ScreenType screenType;

  final List<Map> topics = [
    {"color": Colors.red, "title": "Рабочие"},
    {
      "color": Colors.pink,
      "title": "Авто",
    },
    {
      "color": Colors.green,
      "title": "Бьюти",
    },
    {
      "color": Colors.orange,
      "title": "Отделка",
    },
    {
      "color": Colors.deepPurple,
      "title": "Дети",
    },
    {
      "color": Colors.blue,
      "title": "Клининг",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.filterTagsPageTitle),
      ),
      body: BlocBuilder<MainTopicBloc, MainTopicState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: TopicWidget(
              topicTitle: topics,
              onTap: () {
                context.read<MainTopicBloc>().add(MainTopicUpdateEvent());
                switch(screenType) {
                  case ScreenType.placeTags:
                    push(context, const PlaceTagScreen());
                    break;
                  case ScreenType.filterTags:
                    push(context, const FilterPage());
                    break;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
