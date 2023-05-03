import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/page/filter/filter_page.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

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
              return Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.5,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {}),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.orange,
                      icon: CommunityMaterialIcons.star,
                    ),
                    SlidableAction(
                      onPressed: ((context) {}),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(COLOR_PRIMARY),
                      icon: Icons.edit,
                    ),
                    SlidableAction(
                      onPressed: ((context) {
                        final userId = BlocProvider.of<UserBloc>(context)
                            .state
                            .user
                            .userId;
                        widget.onDismissed(tag, userId, index);
                      }),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DeeDeeRowInfoWidget(
                    icon: Image.asset('assets/images/bookmark_icon.png'),
                    // icon: const Icon(Icons.bookmark_border),
                    mainText: Text(
                      tag.compositeFilter.topic
                          .title, // tag.compositeFilter.filterMap.values.first.filterKeys

                      style: AppTextTheme.bodyLarge,
                    ),
                    secondaryText: Text(
                      '${AppLocalizations.of(context)!.tagExpires}: ${DateFormat('dd-MM-yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(tag.createdAt.seconds.toInt() * 1000))}', //TODO:
                      style: AppTextTheme.labelMedium,
                    ),
                    //     subtitle: Text(bookmark.geolocation.toString()),
                    onTap: () {
                      Map<LatLng, TagDTO> tagMap = {
                        LatLng(tag.geolocation.latitude,
                                tag.geolocation.longitude):
                            TagDTO(tag.tagId, '' /*tag.messengerId*/) //TODO
                      };
                      context.router.push(
                        MapScreenRoute(
                          tagDescriptionMap: tagMap,
                          currentFilter: CompositeFilter(filterMap: {}), //TODO:
                        ),
                      );
                    },
                  ),
                ),
                // UserTagItem(tag: tag),
              );
            }),
            itemCount: tags.length,
            separatorBuilder: (context, index) {
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

class _TagCardWidget extends StatelessWidget {
  const _TagCardWidget({
    super.key,
    required this.tag,
  });

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DeeDeeRowInfoWidget(
        icon: Image.asset('assets/images/bookmark_icon.png'),
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
        onTap: () {
          Map<LatLng, TagDTO> tagMap = {
            LatLng(tag.geolocation.latitude, tag.geolocation.longitude):
                TagDTO(tag.tagId, '' /*tag.messengerId*/) //TODO
          };
          context.router.push(
            MapScreenRoute(
              tagDescriptionMap: tagMap,
              currentFilter: CompositeFilter(filterMap: {}), //TODO:
            ),
          );
        },
      ),
    );
  }
}
