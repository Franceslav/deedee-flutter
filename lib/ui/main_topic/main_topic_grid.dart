import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/ui/main_topic/main_topic_item.dart';
import 'package:flutter/material.dart';

import 'enum/topic_screens_enum.dart';

class MainTopicGrid extends StatefulWidget {
  final List<TopicDescription> mainTopics;
  final ScreenType screenType;

  const MainTopicGrid({
    super.key,
    required this.mainTopics,
    required this.screenType,
  });

  @override
  State<MainTopicGrid> createState() => _MainTopicGridState();
}

class _MainTopicGridState extends State<MainTopicGrid> {
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 48) / 2;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
      ),
      itemCount: widget.mainTopics.length,
      itemBuilder: ((
        context,
        index,
      ) {
        return MainTopicItem(
          topic: widget.mainTopics[index],
          width: width,
          screenType: widget.screenType,
        );
      }),
    );
  }
}
