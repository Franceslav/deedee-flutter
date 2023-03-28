import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/model/filter_dto.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/filter_dto_bloc/filter_dto_bloc.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableFilterList extends StatefulWidget {
  final List<FilterDTO> filters;

  const SlidableFilterList({super.key, required this.filters});

  @override
  State<SlidableFilterList> createState() => _SlidableFilterListState();
}

class _SlidableFilterListState extends State<SlidableFilterList> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return ListView.separated(
      itemCount: widget.filters.length,
      itemBuilder: ((context, index) {
        return Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.5,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: ((context) {
                  FilterDTOBloc()
                      .add(AddFilterDTOSubscription(widget.filters[index]));
                }),
                backgroundColor: Colors.white,
                foregroundColor: Colors.orange,
                icon: widget.filters[index].subscribed
                    ? CommunityMaterialIcons.star
                    : CommunityMaterialIcons.star_off,
              ),
              SlidableAction(
                onPressed: ((context) {
                  context.router.replace(FilterPageRoute(
                    topicName: widget.filters[index].topic,
                    currentFilter: CompositeFilter([], []),
                    // index: index
                  ));
                }),
                backgroundColor: Colors.white,
                foregroundColor: const Color(COLOR_PRIMARY),
                icon: Icons.edit,
              ),
              SlidableAction(
                onPressed: ((context) {
                  setState(() {
                    widget.filters.removeAt(index);
                  });
                  FilterDTOBloc().add(
                      RemoveFilterEvent(filters: widget.filters, index: index));
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
              mainText: Text(
                widget.filters[index].topic,
                style: AppTextTheme.bodyLarge,
              ),
              secondaryText: Text(
                '${widget.filters[index].subtopic} ${widget.filters[index].filterKeys}',
                style: AppTextTheme.labelMedium,
              ),
              //     subtitle: Text(bookmark.geoLocation.toString()),
              onTap: () {
                context.router.replace(
                  MapScreenRoute(
                    // добавить сюда фильтры для меток
                    tagDescriptionMap: {},
                    user: user,
                    topicName: '',
                    currentFilter: CompositeFilter([], []),
                  ),
                );
                FilterDTOBloc().add(PushSavedFiltersEvent(
                  accountType: user.accountType,
                  filterKeys: widget.filters[index].filterKeys,
                  topic: widget.filters[index].subtopic,
                ));
              },
            ),
          ),
        );
      }),
      separatorBuilder: (BuildContext context, int index) {
        return const DeeDeeDeviderWidget();
      },
    );
  }
}
