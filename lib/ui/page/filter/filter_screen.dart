import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/filter_repository.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/page/filter/subtopic_list/filterkey_list.dart';
import 'filter_page_bloc.dart';
import '../../global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/page/filter/subtopic_list/subtopic_list.dart';
import 'package:deedee/ui/place_tag/dialog_widget.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TagDTO {
  final String tagId;
  final String messengerId;

  TagDTO(this.tagId, this.messengerId);
}

class FilterPage extends StatefulWidget {
  final String topicName;
  final CompositeFilter currentFilter;

  const FilterPage(
      {super.key, required this.topicName, required this.currentFilter});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final PanelController _controller = PanelController();
  late List<String> _filterKeys;
  late List<String> _selectedFilterKeys;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = FilterPageBloc(
      locator.get<TopicRepository>(),
      locator.get<FilterRepository>(),
      user,
      widget.currentFilter,
      locator.get<TagRepository>(),
    );
    return BlocProvider<FilterPageBloc>(
      create: (_) => bloc,
      child: Scaffold(
        appBar: DeeDeeAppBar(
          controller: _controller,
          title: AppLocalizations.of(context)!.filterTagsPageTitle,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                GestureDetector(
                  child: const Icon(Icons.bookmark_border),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const DialogWidget();
                        });
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
            BlocConsumer<FilterPageBloc, FilterPageState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is UserFiltersDoneState) {
                  Map<LatLng, TagDTO> tagMap = {
                    for (var tag in state.topic.tags)
                      LatLng(tag.geoLocation.latitude,
                              tag.geoLocation.longitude):
                          TagDTO(tag.tagId, tag.messengerId)
                  };
                  context.router.popAndPush(
                    MapScreenRoute(
                      tagDescriptionMap: tagMap,
                      user: user,
                      topicName: widget.topicName,
                      currentFilter:
                          CompositeFilter(_filterKeys, _selectedFilterKeys),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is SubtopicListLoadedState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 66),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: [
                                if (state.allSubtopicsFilter.isNotEmpty)
                                  Column(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .chooseTopic,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                      SubtopicList(
                                        selectedSubtopics: state
                                            .selectedSubtopicsFilter.keys
                                            .toList(),
                                        subtopics: state.allSubtopicsFilter.keys
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                if (state.selectedSubtopicsFilter.isNotEmpty)
                                  Column(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .chooseFilterKeys,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: ListView.builder(
                                          itemCount: state
                                              .selectedSubtopicsFilter.length,
                                          itemBuilder: (context, index) {
                                            final subtopic = state
                                                .selectedSubtopicsFilter.keys
                                                .toList()[index];
                                            return Column(
                                              children: [
                                                FilterKeyList(
                                                  subtopic: subtopic,
                                                  filterKeys:
                                                      state.allSubtopicsFilter[
                                                          subtopic]!,
                                                ),
                                                const DeeDeeDeviderWidget(),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                        if (state.selectedSubtopicsFilter.values.isNotEmpty &&
                            state.selectedSubtopicsFilter.values
                                .every((element) => element.length >= 3))
                          Expanded(
                            child: Column(
                              children: [
                                const Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(),
                                  ),
                                ),
                                DeeDeeButton(
                                  title:
                                      AppLocalizations.of(context)!.placeOrder,
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
                                  gradientButton: false,
                                ),
                                const SizedBox(height: 8),
                                DeeDeeButton(
                                  title: AppLocalizations.of(context)!.seeTags,
                                  gradientButton: true,
                                  onPressed: () {
                                    bloc.add(PushFiltersEvent(
                                      topic: widget.topicName,
                                      filterKeys: state
                                          .selectedSubtopicsFilter.values.first,
                                      accountType: user.accountType,
                                    ));
                                    var filterKeys = <String>[];
                                    var selectedFilterKeys = <String>[];
                                    for (var i = 0; i <= state.selectedSubtopicsFilter.length - 1; i++) {
                                      filterKeys.addAll(state.allSubtopicsFilter[state.selectedSubtopicsFilter.keys.toList()[i]]!);
                                    }
                                    for (var i = 0; i <= state.selectedSubtopicsFilter.length - 1; i++) {
                                      selectedFilterKeys.addAll(state.selectedSubtopicsFilter.values.toList()[i]);
                                    }
                                    _filterKeys = filterKeys;
                                    _selectedFilterKeys = selectedFilterKeys;
                                  },
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            DeeDeeMenuSlider(
              context,
              controller: _controller,
              user: user,
            ),
          ],
        ),
      ),
    );
  }
}

class CompositeFilter {
  final List<String> _filterKeys;
  final List<String> _selectedFilterKeys;

  List<String> get selectedFilterKeys => _selectedFilterKeys;

  List<String> get filterKeys => _filterKeys;

  CompositeFilter(this._filterKeys, this._selectedFilterKeys);
}
