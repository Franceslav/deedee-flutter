import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/page/filter/filter_page.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class TagCardWidget extends StatelessWidget {
  const TagCardWidget({
    super.key,
    required this.tag,
    required this.onDismissed,
  });
  final Tag tag;
  final void Function() onDismissed;
  ImageIcon getIcon(Tag tag) {
    switch (tag.compositeFilter.topic.title) {
      case 'Children':
        return const ImageIcon(AssetImage('assets/images/topic_children.png'));
      case 'Auto':
        return const ImageIcon(AssetImage('assets/images/topic_auto.png'));
      case 'Beauty':
        return const ImageIcon(AssetImage('assets/images/topic_beauty.png'));
      case 'Cleaning':
        return const ImageIcon(AssetImage('assets/images/topic_cleaning.png'));
      case 'Overhaul':
        return const ImageIcon(AssetImage('assets/images/topic_overhaul.png'));
      case 'Workers':
        return const ImageIcon(AssetImage('assets/images/topic_workers.png'));
      default:
        return const ImageIcon(AssetImage('assets/images/topic_children.png'));
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget widget = Padding(
      padding: const EdgeInsets.all(8),
      child: DeeDeeRowInfoWidget(
        icon: getIcon(tag),
        // icon: const Icon(Icons.bookmark_border),
        mainText: Text(
          tag.compositeFilter.topic.title,
          // tag.compositeFilter.filterMap.values.first.filterKeys
          style: AppTextTheme.bodyLarge,
        ),
        secondaryText: Text(
          '${AppLocalizations.of(context)!.tagExpires}: ${DateFormat('dd-MM-yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(tag.createdAt.seconds.toInt() * 1000))}', //TODO:
          style: AppTextTheme.labelMedium,
        ),
        //     subtitle: Text(bookmark.geolocation.toString()),
        onTap: () async {
          Map<LatLng, TagDTO> tagMap = {
            LatLng(tag.geolocation.latitude, tag.geolocation.longitude):
                TagDTO(tag.tagId, '' /*tag.messengerId*/) //TODO
          };
          var compositeFilter = CompositeFilter(
            compositeFilterId: Int64(0),
            topic: Topic(topicId: 2, userId: '', title: 'Children'),
            filterMap: {
              "Car Wash": FilterKeyList(filterKeys: [
                FilterKey()
                  ..subtopicId = '3'
                  ..title = '24 Hour',
                FilterKey()
                  ..subtopicId = '2'
                  ..title = 'Covered'
                  ..selected = true,
                FilterKey()
                  ..subtopicId = '1'
                  ..title = 'Valet'
              ])
            },
            status: CompositeFilter_Status.FAVORITE,
          );
          print('Tags $compositeFilter');
          context.router.push(
            MapScreenMyTagsRoute(
              backTapRoute: const UserTagsScreenRoute(),
              tagDescriptionMap: tagMap,
              currentFilter: tag.compositeFilter, //TODO:
            ),
          );
        },
      ),
    );
    if (tag.status != Tag_Status.DELETED) {
      widget = Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.5,
          motion: const ScrollMotion(),
          children: [
            (tag.status != Tag_Status.DELETED)
                ? SlidableAction(
                    onPressed: ((context) {}),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                    icon: CommunityMaterialIcons.star,
                  )
                : SlidableAction(
                    onPressed: ((context) {}),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.red,
                    icon: CommunityMaterialIcons.star,
                  ),
            SlidableAction(
              onPressed: ((context) {}),
              backgroundColor: Colors.white,
              foregroundColor: const Color(COLOR_PRIMARY),
              icon: Icons.edit,
            ),
            SlidableAction(
              onPressed: (_) => onDismissed(),
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
              icon: Icons.delete,
            ),
          ],
        ),
        child: widget,
      );
    }
    return widget;
  }
}
