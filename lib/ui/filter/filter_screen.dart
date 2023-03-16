import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/gps.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/selector/bloc/selector_bloc.dart';
import 'package:deedee/ui/selector/selector_list.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../global_widgets/deedee_appbar.dart';

class TagDTO {
  final String tagId;
  final String messengerId;

  TagDTO(this.tagId, this.messengerId);
}

class FilterPage extends StatefulWidget {
  final String topicsName;

  const FilterPage({super.key, required this.topicsName});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final PanelController _controller = PanelController();

  List<String> _filterKeys = [];
  List<String> _topics = [];
  String _selectedTopic = '';
  List<String> _selectedFilterKeys = [];

  @override
  void initState() {
    super.initState();
    locator.get<GPSRepository>().getGPSPosition();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final selectorBloc = SelectorBloc(locator.get<GRCPRepository>(), user);
    return BlocProvider<SelectorBloc>(
      create: (_) => selectorBloc,
      child: Scaffold(
        appBar: DeeDeeAppBar(
          controller: _controller,
          title: AppLocalizations.of(context)!.filterTagsPageTitle,
          child: const ProfilePhotoWithBadge(),
        ),
        body: Stack(
          children: [
            BlocConsumer<SelectorBloc, SelectorState>(
              bloc: selectorBloc,
              listener: (context, state) {
                if (state is LoadedTopicsState) {
                  _topics = state.topics.map((e) => e.title).toList();
                }
                if (state is TopicSelectedState) {
                  if (_selectedTopic == state.topic) {
                    _selectedTopic = '';
                    _selectedFilterKeys = [];
                    _filterKeys = [];
                  } else {
                    _selectedTopic = state.topic;
                    _filterKeys = [];
                    _selectedFilterKeys = [];
                    selectorBloc.add(LoadFilterKeysEvent(_selectedTopic));
                  }
                }
                if (state is LoadedFilterKeysState) {
                  _filterKeys = state.filterKeys;
                }
                if (state is FilterKeySelectedState) {
                  _selectedFilterKeys.contains(state.filterKey)
                      ? _selectedFilterKeys.remove(state.filterKey)
                      : _selectedFilterKeys.add(state.filterKey);
                }
                if (state is LoadingSelectorState) {
                  context.read<LoadingCubit>().showLoading(
                        context,
                        AppLocalizations.of(context)!.filteringTagsHistTitle,
                        false,
                      );
                }
                if (state is UserFiltersDoneState || state is ErrorState) {
                  context.read<LoadingCubit>().hideLoading();
                  if (state is ErrorState) {
                    showSnackBar(context, state.errorMessage);
                  }
                  if (state is UserFiltersDoneState) {
                    Map<LatLng, TagDTO> tagMap = {
                      for (var tag in state.topic.tags)
                        LatLng(tag.geoLocation.latitude,
                                tag.geoLocation.longitude):
                            TagDTO(tag.tagId, tag.messengerId)
                    };
                    context.router.push(MapScreenRoute(
                      tagDescriptionMap: tagMap,
                      user: user,
                      filterKeys: _filterKeys,
                      selectedFilterKeys: _selectedFilterKeys,
                      topicsName: widget.topicsName,
                    ));
                  }
                }
              },
              builder: (context, state) {
                var bloc = context.read<SelectorBloc>();
                return state is InitialState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 66),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    children: [
                                      if (_topics.isNotEmpty)
                                        Column(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .chooseTopic,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
                                            ),
                                            SelectorList(
                                              data: _topics,
                                              onTap: (String topic) => bloc
                                                  .add(SelectTopicEvent(topic)),
                                              selectedItems: [_selectedTopic],
                                            ),
                                          ],
                                        ),
                                      if (_filterKeys.isEmpty &&
                                          state is LoadingFiltersKeyState)
                                        const Center(
                                            child: CircularProgressIndicator()),
                                      if (_filterKeys.isNotEmpty)
                                        Column(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .chooseFilterKeys,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
                                            ),
                                            SelectorList(
                                              data: _filterKeys,
                                              onTap: (String filterKey) =>
                                                  selectorBloc.add(
                                                      SelectFilterKeyEvent(
                                                          filterKey)),
                                              selectedItems:
                                                  _selectedFilterKeys,
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (_selectedFilterKeys.length >= 3)
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
                                      title: AppLocalizations.of(context)!
                                          .placeOrder,
                                      onPressed: () {
                                        context.router
                                            .push(PlaceOrderScreenRoute());
                                      },
                                      gradientButton: false,
                                    ),
                                    DeeDeeButton(
                                      title: AppLocalizations.of(context)!
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
                                        selectorBloc
                                            .add(SelectLocationEvent(data));
                                      },
                                      gradientButton: false,
                                    ),
                                    const SizedBox(height: 8),
                                    DeeDeeButton(
                                      title:
                                          AppLocalizations.of(context)!.seeTags,
                                      gradientButton: true,
                                      onPressed: () {
                                        context.read<SelectorBloc>().add(
                                              SaveFiltersEvent(
                                                isSubscribe: false,
                                                topic: widget.topicsName,
                                                subtopic: _selectedTopic,
                                                filterKeys: _selectedFilterKeys,
                                                accountType: user.accountType,
                                                userId: user.userId,
                                              ),
                                            );
                                      },
                                    ),
                                  ],
                                ),
                              )
                          ],
                        ),
                      );
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
