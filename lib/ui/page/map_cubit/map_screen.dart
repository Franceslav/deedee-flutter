import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/composite_filter_repository.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/auth/welcome/welcome_screen.dart';
import 'package:deedee/ui/page/filter/filter_page.dart';
import 'package:deedee/ui/page/map_cubit/tag_marker/tag_marker.dart';
import 'package:deedee/ui/selector/bloc/selector_bloc.dart';
import 'package:deedee/ui/selector/selector_appbar.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../map_sliding_panel/map_sliding_panel.dart';
import '../../routes/app_router.gr.dart';
import '../../user_bloc/user_bloc.dart';

class MapScreen extends StatefulWidget {
  final Map<LatLng, TagDTO> tagDescriptionMap;
  final CompositeFilter currentFilter;

  const MapScreen({
    Key? key,
    required this.tagDescriptionMap,
    required this.currentFilter,
  }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class DeeDeeSliderController extends PanelController {
  late Marker selectedMarker;

  set setSelectedMarker(selectedMarker) {
    this.selectedMarker = selectedMarker;
  }
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final DeeDeeSliderController _pc = DeeDeeSliderController();

  final List<TagMarker> _markers = [];

  String _selectedMessengerId = '';
  Int64 _selectedTagId = Int64();
  bool openedFirstTime = true;

  @override
  void initState() {
    widget.tagDescriptionMap.forEach(
      (point, dto) {
        TagMarker tagMarker = TagMarker(
          tagId: dto.tagId,
          tagMessengerId: dto.messengerId,
          marker: Marker(
            point: point,
            width: 30,
            height: 30,
            builder: (context) => GestureDetector(
              onTap: () {
                setState(() {
                  openedFirstTime = false;
                  _selectedMessengerId = dto.messengerId;
                  _selectedTagId = dto.tagId;
                });
                _pc.open();
              },
              child: const Icon(
                Icons.location_on_sharp,
                size: 30,
                color: Colors.black38,
              ),
            ),
          ),
        );
        _markers.add(
          tagMarker,
        );
      },
    );
    super.initState();
  }

  final FitBoundsOptions _fitBoundsOptions =
      const FitBoundsOptions(padding: EdgeInsets.all(8.0));

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    var filterKeys = _allFilterKeys(widget.currentFilter.filterMap);
    var selectedFilterKeys =
        _selectedFilterKeys(widget.currentFilter.filterMap);

    LatLng geo = user.lastGeoLocation;
    Size size = MediaQuery.of(context).size;
    final selectorBloc = SelectorBloc(
      locator.get<TagRepository>(),
      locator.get<TopicRepository>(),
      locator.get<CompositeFilterRepository>(),
      user,
    );
    //selectorBloc.add(SelectListFilterKeyEvent(widget.selectedFilterKeys));
    return BlocProvider(
      create: (_) => selectorBloc,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.authState == AuthState.unauthenticated) {
            pushAndRemoveUntil(context, const WelcomeScreen(), false);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: size.height * 0.07,
            backgroundColor: Colors.transparent,
            actions: [
              Expanded(
                child: BlocConsumer<SelectorBloc, SelectorState>(
                  listener: (context, state) {
                    if (state is FilterKeySelectedState) {
                      selectedFilterKeys.contains(state.filterKey)
                          ? selectedFilterKeys.remove(state.filterKey)
                          : selectedFilterKeys.add(state.filterKey);
                    }
                  },
                  builder: (context, state) {
                    return SelectorAppBar(
                      allItems: filterKeys,
                      selectedItems: selectedFilterKeys,
                      onTap: (FilterKey filterKey) =>
                          selectorBloc.add(SelectFilterKeyEvent(filterKey)),
                    );
                  },
                ),
              ),
            ],
            iconTheme: IconThemeData(
                color: isDarkMode(context) ? Colors.white : Colors.black),
            elevation: 0.0,
          ),
          body: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  // swPanBoundary: LatLng(
                  //     geo.latitude - MAP_BOUNDS, geo.longitude - MAP_BOUNDS),
                  // nePanBoundary: LatLng(
                  //     geo.latitude + MAP_BOUNDS, geo.longitude + MAP_BOUNDS),
                  center: widget.tagDescriptionMap.isEmpty
                      ? LatLng(geo.latitude, geo.longitude)
                      : widget.tagDescriptionMap.keys.first,
                  // bounds: LatLngBounds.fromPoints(_latLngList),
                  zoom: MAP_ZOOM,
                  onTap: (tapPosition, tapLatLon) {
                    _pc.close();
                  },
                ),
                children: [
                  TileLayer(
                    minZoom: 2,
                    maxZoom: 18,
                    backgroundColor: Colors.black,
                    subdomains: const ['a', 'b', 'c'],
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.dinobit.deedeeapp',
                  ),
                  MarkerLayer(
                    rotate: false,
                    markers: _markers.map((e) => e.marker).toList(),
                  ),
                  MarkerClusterLayerWidget(
                    options: MarkerClusterLayerOptions(
                      maxClusterRadius: 190,
                      disableClusteringAtZoom: 12,
                      size: const Size(50, 50),
                      // fitBoundsOptions: LatLngBounds.fromPoints(listOfPoints),
                      markers: _markers.map((e) => e.marker).toList(),
                      polygonOptions: const PolygonOptions(
                          borderColor: Colors.blueAccent,
                          color: Colors.black12,
                          borderStrokeWidth: 3),
                      builder: (context, markers) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.orange, shape: BoxShape.circle),
                          child: Text('${markers.length}'),
                        );
                      },
                    ),
                  ),
                ],
              ),
              MapSlidingPanel(
                size: size,
                pc: _pc,
                selectedMessengerId: _selectedMessengerId,
                selectedTagId: _selectedTagId,
                openedFirstTime: openedFirstTime,
              ),
              Positioned(
                top: 16,
                left: 16,
                child: GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    var filterMap = _updateFilterMap(
                      widget.currentFilter.filterMap,
                      selectedFilterKeys,
                    );
                    context.router.popAndPush(FilterPageRoute(
                      currentFilter: CompositeFilter(
                        compositeFilterId:
                            widget.currentFilter.compositeFilterId,
                        topic: widget.currentFilter.topic,
                        filterMap: filterMap,
                        status: widget.currentFilter.status,
                      ),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<FilterKey> _allFilterKeys(Map<String, FilterKeyList> filterMap) {
    var filterKeys = <FilterKey>[];
    for (var i = 0; i <= filterMap.length - 1; i++) {
      var subtopic = filterMap.keys.toList()[i];
      var filterList = filterMap[subtopic]!.filterKeys;
      if (filterList.firstWhereOrNull((element) => element.selected) != null) {
        filterKeys
            .addAll(filterList.map((filter) => filter..subtopicId = subtopic));
      }
    }
    return filterKeys;
  }

  List<FilterKey> _selectedFilterKeys(Map<String, FilterKeyList> filterMap) {
    var selectedFilterKeys = <FilterKey>[];
    for (var i = 0; i <= filterMap.length - 1; i++) {
      var subtopic = filterMap.keys.toList()[i];
      var filterList = filterMap[subtopic]!.filterKeys;
      if (filterList.firstWhereOrNull((element) => element.selected) != null) {
        for (var filter in filterList) {
          if (filter.selected) {
            selectedFilterKeys.add(filter..subtopicId = subtopic);
          }
        }
      }
    }
    return selectedFilterKeys;
  }

  Map<String, FilterKeyList> _updateFilterMap(
    Map<String, FilterKeyList> widgetFilterMap,
    List<FilterKey> selectedFilterKeys,
  ) {
    var selectedFilterMap = <String, FilterKeyList>{};
    for (var filter in selectedFilterKeys) {
      if (selectedFilterMap.containsKey(filter.subtopicId)) {
        selectedFilterMap.update(filter.subtopicId, (value) {
          value.filterKeys.add(filter..selected = true);
          return value;
        });
      } else {
        selectedFilterMap.addAll({
          filter.subtopicId:
              FilterKeyList(filterKeys: [filter..selected = true])
        });
      }
    }
    return selectedFilterMap;
  }
}
