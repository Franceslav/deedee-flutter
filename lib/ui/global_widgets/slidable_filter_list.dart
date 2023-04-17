import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/filter_service.pb.dart';
import 'package:deedee/repository/filter_repository.dart';
import 'package:deedee/ui/composite_filter_bloc/composite_filter_bloc.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableFilterList extends StatefulWidget {
  final List<CompositeFilter> filters;

  const SlidableFilterList({super.key, required this.filters});

  @override
  State<SlidableFilterList> createState() => _SlidableFilterListState();
}

class _SlidableFilterListState extends State<SlidableFilterList> {
  late FilterRepository _filterRepository;

  @override
  void initState() {
    super.initState();
    _filterRepository = FilterRepository();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return ListView.separated(
      itemCount: widget.filters.length,
      itemBuilder: ((context, index) {
        return FutureBuilder<List<String>>(
            future: Future<List<String>>(() async {
          List<String> _filterKeys = (await _filterRepository
                  .getFilterItems(widget.filters[index].topic.title))
              .map((fk) => fk.title)
              .toList();
          return _filterKeys;
        }), builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Slidable(
              endActionPane: ActionPane(
                extentRatio: 0.5,
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: ((context) {
                      CompositeFilterBloc().add(
                          AddFilterSubscriptionEvent(widget.filters[index]));
                    }),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    icon: widget.filters[index].status ==
                            CompositeFilter_Status.SUBSCRIBED
                        ? CommunityMaterialIcons.star
                        : CommunityMaterialIcons.star_off,
                  ),
                  SlidableAction(
                    onPressed: ((context) {
                      context.router.replace(FilterPageRoute(
                        currentFilter: CompositeFilter(
                          filterMap: {
                            '${snapshot.data!}':
                                widget.filters[index].filterMap.values.first
                          }, //TODO
                          // snapshot.data!,
                          // widget.filters[index].filterKeys,
                        ),
                      ));
                    }),
                    backgroundColor: const Color(COLOR_PRIMARY),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                  ),
                  SlidableAction(
                    onPressed: ((context) {
                      setState(() {
                        widget.filters.removeAt(index);
                      });
                      CompositeFilterBloc().add(RemoveFilterEvent(
                          filters: widget.filters, index: index));
                    }),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: DeeDeeRowInfoWidget(
                  icon: Image.asset('assets/images/bookmark_icon.png'),
                  mainText: Text(
                    '${AppLocalizations.of(context)!.filterTagsPageTitle}: ${widget.filters[index].topic.title}',
                    style: AppTextTheme.bodyLarge,
                  ),
                  secondaryText: Text(
                    '${AppLocalizations.of(context)!.filterTags}: ${widget.filters[index].filterMap.toString()}',
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    softWrap: false,
                    style: AppTextTheme.bodyMedium,
                  ),
                  onTap: () {
                    context.router.replace(
                      MapScreenRoute(
                        // добавить сюда фильтры для меток
                        tagDescriptionMap: {},
                        currentFilter: CompositeFilter(
                          filterMap: {
                            widget.filters[index].filterMap.keys.first:
                                widget.filters[index].filterMap.values.first
                          }, //TODO
                          // snapshot.data!,
                          // widget.filters[index].filterKeys,
                        ),
                      ),
                    );
                    CompositeFilterBloc().add(PushSavedFiltersEvent(
                      accountType: user.accountType,
                      filterKeys: widget.filters[index].filterMap.values
                          .map((e) => e.filterKeys.map((e) => e.title).toList())
                          .toList()[0],
                      topic: widget.filters[index].topic.title,
                    ));
                  },
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Color(COLOR_PRIMARY)),
            );
          }
        });
      }),
      separatorBuilder: (BuildContext context, int index) {
        return const DeeDeeDeviderWidget();
      },
    );
  }
}
