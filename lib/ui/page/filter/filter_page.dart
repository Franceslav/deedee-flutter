import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/composite_filter_repository.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:deedee/ui/page/filter/subtopic_list/filterkey_list.dart';
import 'package:deedee/ui/page/filter/subtopic_list/subtopic_list.dart';
import 'package:deedee/ui/place_tag/dialog_widget.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../global_widgets/deedee_appbar.dart';
import '../favorite_composite_filters/composite_filter_bloc/composite_filter_bloc.dart';
import 'filter_page_bloc.dart';

class TagDTO {
  final Int64 tagId;
  final String messengerId;

  TagDTO(this.tagId, this.messengerId);
}

class FilterPage extends StatefulWidget {
  final CompositeFilter currentFilter;

  const FilterPage({super.key, required this.currentFilter});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final PanelController _controller = PanelController();
  late CompositeFilter _compositeFilter;
  String subtopicForTags = '';
  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = FilterPageBloc(
      locator.get<TopicRepository>(),
      locator.get<CompositeFilterRepository>(),
      user,
      widget.currentFilter,
      locator.get<TagRepository>(),
    );
    final compositeFilterBloc = CompositeFilterBloc(
      locator.get<CompositeFilterRepository>(),
      user,
    );

    return BlocProvider<FilterPageBloc>(
      create: (_) => bloc,
      child: BlocConsumer<FilterPageBloc, FilterPageState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is UserFiltersDoneState) {
            Map<LatLng, TagDTO> tagMap = {
              for (var tag in state.tags)
                LatLng(tag.geolocation.latitude, tag.geolocation.longitude):
                    TagDTO(tag.tagId, '' /*tag.messengerId*/) //TODO:
            };
            context.router.popAndPush(
              MapScreenRoute(
                tagDescriptionMap: tagMap,
                currentFilter: _compositeFilter,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SubtopicListLoadedState) {
            final allSubtopicsFilter = state.allSubtopicsFilter;
            final selectedSubtopicsFilter = state.selectedSubtopicsFilter;

            return Scaffold(
              appBar: DeeDeeAppBar(
                controller: _controller,
                title: AppLocalizations.of(context)!.filterTagsPageTitle,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      if (selectedSubtopicsFilter.values.isNotEmpty &&
                          selectedSubtopicsFilter.values
                              .every((element) => element.length >= 3))
                        GestureDetector(
                          child: const Icon(Icons.bookmark_border),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DialogWidget(
                                  compositeFilter: CompositeFilter(
                                    compositeFilterId: Int64(),
                                    topic: widget.currentFilter.topic,
                                    filterMap: _filtersWithSelected(
                                      allSubtopicsFilter: allSubtopicsFilter,
                                      selectedSubtopicsFilter:
                                          selectedSubtopicsFilter,
                                    ),
                                    status: widget.currentFilter.status,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      const SizedBox(width: 16),
                      const Icon(Icons.menu),
                    ],
                  ),
                ),
              ),
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (allSubtopicsFilter.isNotEmpty)
                          Text(
                            AppLocalizations.of(context)!.chooseTopic,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        SubtopicList(
                          selectedSubtopics:
                              selectedSubtopicsFilter.keys.toList(),
                          subtopics: allSubtopicsFilter.keys.toList(),
                        ),
                        if (selectedSubtopicsFilter.isNotEmpty)
                          Text(
                            AppLocalizations.of(context)!.chooseFilterKeys,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: selectedSubtopicsFilter.length,
                            itemBuilder: (context, index) {
                              final subtopic =
                                  selectedSubtopicsFilter.keys.toList()[index];
                              subtopicForTags = subtopic;
                              return Column(
                                children: [
                                  SubtopicFilterKeyList(
                                    subtopic: subtopic,
                                    filterKeys: allSubtopicsFilter[subtopic]!
                                        .filterKeys
                                        .map((e) => e.title)
                                        .toList(),
                                    selectedFilterKeys: selectedSubtopicsFilter
                                        .getOrElse(subtopic, () => []),
                                  ),
                                  const DeeDeeDeviderWidget(),
                                ],
                              );
                            },
                          ),
                        ),
                        if (selectedSubtopicsFilter.values.isNotEmpty &&
                            selectedSubtopicsFilter.values
                                .every((element) => element.length >= 3))
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: OutlinedButtonWidget(
                                    text: AppLocalizations.of(context)!
                                        .placeOrder,
                                    onPressed: () async {
                                      final data = await context.router.push(
                                              MapSetLocationScreenRoute(
                                                  userLocation:
                                                      user.lastGeoLocation))
                                          as AddressModel?;
                                      if (data == null) {
                                        return;
                                      }
                                      bloc.add(SelectLocationEvent(data));
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: OutlinedButtonWidget(
                                    text: AppLocalizations.of(context)!.seeTags,
                                    onPressed: () {
                                      bloc.add(PushFiltersEvent(
                                        topic: widget.currentFilter.topic.title,
                                        filterKeys: selectedSubtopicsFilter
                                            .values.first,
                                        subtopic: [subtopicForTags],
                                      ));
                                      var filterMap = _filtersWithSelected(
                                          allSubtopicsFilter:
                                              allSubtopicsFilter,
                                          selectedSubtopicsFilter:
                                              selectedSubtopicsFilter);

                                      _compositeFilter = CompositeFilter(
                                        compositeFilterId: widget
                                            .currentFilter.compositeFilterId,
                                        topic: widget.currentFilter.topic,
                                        filterMap: filterMap,
                                        status: widget.currentFilter.status,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  DeeDeeMenuSlider(
                    context,
                    controller: _controller,
                    user: user,
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              appBar: DeeDeeAppBar(
                title: AppLocalizations.of(context)!.filterTagsPageTitle,
                controller: _controller,
                child: const Icon(Icons.menu),
              ),
              body: Stack(
                children: [
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                  DeeDeeMenuSlider(
                    context,
                    controller: _controller,
                    user: user,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

Map<String, FilterKeyList> _filtersWithSelected(
    {required Map<String, FilterKeyList> allSubtopicsFilter,
    required Map<String, List<String>> selectedSubtopicsFilter}) {
  var filtersWithSelected = allSubtopicsFilter;

  for (var index = 0; index < filtersWithSelected.length; index++) {
    var subtopic = filtersWithSelected.keys.toList()[index];
    var selectedList = selectedSubtopicsFilter[subtopic];
    if (selectedList != null) {
      filtersWithSelected.update(subtopic, (value) {
        for (var i = 0; i < selectedList.length; i++) {
          if (value.filterKeys.map((e) => e.title).contains(selectedList[i])) {
            value.filterKeys
                .firstWhere((element) => element.title == selectedList[i])
                .selected = true;
          }
        }
        return value;
      });
    }
  }
  return filtersWithSelected;
}
