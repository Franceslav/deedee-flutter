import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/place_tag/place_tag_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'enum/topic_screens_enum.dart';

class MainTopicItem extends StatelessWidget {
  final TopicDescription topic;
  final double width;
  final ScreenType screenType;

  const MainTopicItem({
    super.key,
    required this.topic,
    required this.width,
    required this.screenType,
  });

  @override
  Widget build(BuildContext context) {
    switch (topic.title) {
      case 'Авто':
        topic.title = AppLocalizations.of(context)!.autoTag;
        break;
      case 'Бьюти':
        topic.title = AppLocalizations.of(context)!.beautyTag;
        break;
      case 'Отделка':
        topic.title = AppLocalizations.of(context)!.decoratingTag;
        break;
      case 'Дети':
        topic.title = AppLocalizations.of(context)!.childrenTag;
        break;
      case 'Рабочие':
        topic.title = AppLocalizations.of(context)!.workersTag;
        break;
      case 'Клининг':
        topic.title = AppLocalizations.of(context)!.cleaningTag;
        break;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          switch (screenType) {
            case ScreenType.placeTags:
              push(context, PlaceTagScreen(
                topicsName: topic.title,
              ));
              break;
            case ScreenType.filterTags:
              push(
                  context,
                  FilterPage(
                    topicsName: topic.title,
                  ));
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                _getImagePath(topic.id),
                width: width * 0.28,
                height: width * 0.28,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    '${topic.offerCount} ${AppLocalizations.of(context)!.offersTitle}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getImagePath(int topicId) {
    switch (topicId) {
      case 1:
        return 'assets/images/topic_auto.png';
      case 2:
        return 'assets/images/topic_beauty.png';
      case 3:
        return 'assets/images/topic_overhaul.png';
      case 4:
        return 'assets/images/topic_children.png';
      case 5:
        return 'assets/images/topic_workers.png';
      case 6:
        return 'assets/images/topic_cleaning.png';
      default:
        return 'assets/images/frame.png';
    }
  }
}
