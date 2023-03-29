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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deedee/repository/filter_repository.dart';

class SlidableFilterList extends StatefulWidget {
  final List<FilterDTO> filters;

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
      itemBuilder: ((context, index)  {
        return FutureBuilder<List<String>>(
          future: Future<List<String>>(
                  () async {
                List<String>  _filterKeys = (await _filterRepository.getFilterItems( widget.filters[index].subtopic))
                    .map((fk) => fk.title)
                    .toList();
                return _filterKeys;
              }
          ),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.5,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {
                        FilterDTOBloc()
                            .add(
                            AddFilterDTOSubscription(widget.filters[index]));
                      }),
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      icon: widget.filters[index].subscribed
                          ? CommunityMaterialIcons.star
                          : CommunityMaterialIcons.star_off,
                    ),
                    SlidableAction(
                      onPressed: ((context)  {
                        context.router.replace(
                            FilterPageRoute(
                              topicName: widget.filters[index].topic,
                              currentFilter: CompositeFilter(
                                snapshot.data!,
                                widget.filters[index].filterKeys,
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
                        FilterDTOBloc().add(
                            RemoveFilterEvent(
                                filters: widget.filters, index: index));
                      }),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: DeeDeeRowInfoWidget(
                    icon: Image.asset('assets/images/bookmark_icon.png'),
                    mainText: Text(
                      '${AppLocalizations.of(context)!
                          .filterTagsPageTitle}: ${widget.filters[index]
                          .subtopic}',
                      style: AppTextTheme.bodyLarge,
                    ),
                    secondaryText: Text(
                      '${AppLocalizations.of(context)!.filterTags}: ${widget
                          .filters[index].filterKeys.toString()}',
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
                          user: user,
                          topicName: widget.filters[index].topic,
                          currentFilter: CompositeFilter(
                            snapshot.data!,
                            widget.filters[index].filterKeys,
                          ),
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
            }
            else{
             return const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(Color(COLOR_PRIMARY)),
              );
            }
          }
        );
      }),
      separatorBuilder: (BuildContext context, int index) {
        return const DeeDeeDeviderWidget();
      },
    );
  }
}
