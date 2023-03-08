import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/bookmarks/bloc/bookmarks_bloc.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/map_cubit/tag_marker/tag_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../auth/welcome/welcome_screen.dart';
import '../global_widgets/map_sliding_panel_widget.dart';

class MapScreen extends StatefulWidget {
  final User user;
  final Map<LatLng, TagDTO> tagDescriptionMap;

  const MapScreen({
    Key? key,
    required this.tagDescriptionMap,
    required this.user,
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
  LatLng get geo => widget.user.lastGeoLocation ?? LatLng(0, 0);

  final PopupController _popupController = PopupController();
  final MapController _mapController = MapController();
  late DeeDeeSliderController _pc;

  // bool click = true;
  // bool click_bm = true;

  final List<TagMarker> _markers = [];

  late TagMarker _selectedMarker;
  String _selectedMessengerId = '';
  String _selectedTagId = '';

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
    _pc = DeeDeeSliderController();
    super.initState();
  }

  final FitBoundsOptions _fitBoundsOptions =
      const FitBoundsOptions(padding: EdgeInsets.all(8.0));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.authState == AuthState.unauthenticated) {
          pushAndRemoveUntil(context, const WelcomeScreen(), false);
        }
      },
      child: Scaffold(
        drawer: const DeeDeeDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
              color: isDarkMode(context) ? Colors.white : Colors.black),
          elevation: 0.0,
        ),
        body: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            // swPanBoundary: LatLng(
            //     geo.latitude - MAP_BOUNDS, geo.longitude - MAP_BOUNDS),
            // nePanBoundary: LatLng(
            //     geo.latitude + MAP_BOUNDS, geo.longitude + MAP_BOUNDS),
            center: LatLng(geo.latitude, geo.longitude),
            // bounds: LatLngBounds.fromPoints(_latLngList),
            zoom: MAP_ZOOM,
            onTap: (tapPosition, tapLatLon) {
              _pc.close();
            },
          ),
          nonRotatedChildren: [
            MapSlidingPanelWidget(
              size: size,
              pc: _pc,
              selectedMessengerId: _selectedMessengerId,
              tagId: _selectedTagId,
              userId: widget.user.userId,
            ),
          ],
          children: [
            TileLayer(
              minZoom: 2,
              maxZoom: 18,
              backgroundColor: Colors.black,
              subdomains: const ['a', 'b', 'c'],
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
      ),
    );
  }
}

class CustomPanelWidget extends StatefulWidget {
  final String userId;
  final String tagId;

  const CustomPanelWidget({
    super.key,
    required String selectedMessengerId,
    required this.userId,
    required this.tagId,
  }) : _selectedMessengerId = selectedMessengerId;

  final String _selectedMessengerId;

  @override
  State<CustomPanelWidget> createState() => _CustomPanelWidgetState();
}

class _CustomPanelWidgetState extends State<CustomPanelWidget> {
  @override
  Widget build(BuildContext context) {
    final bookmarksBloc = context.watch<BookmarksBloc>();
    final bookmarksState = bookmarksBloc.state;
    bool isBookmarkAdded = false;
    if (bookmarksState is LoadedBookmarksState) {
      isBookmarkAdded = bookmarksState.bookmarks
          .where((tag) => tag.tagId == widget.tagId)
          .isNotEmpty;
    }
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.account_box_sharp,
                  size: 26.0,
                ),
                const Spacer(flex: 1),
                Text(widget._selectedMessengerId,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const Spacer(flex: 6),
                Row(
                  children: const [
                    Icon(Icons.star_rounded,
                        size: 26.0, color: Color(COLOR_PRIMARY)),
                    Icon(Icons.star_rounded,
                        size: 26.0, color: Color(COLOR_PRIMARY)),
                    Icon(Icons.star_rounded,
                        size: 26.0, color: Color(COLOR_PRIMARY)),
                    Icon(Icons.star_rounded,
                        size: 26.0, color: Color(COLOR_PRIMARY)),
                    Icon(Icons.star_border, size: 26.0, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: const <Widget>[
                Text('# lorem # ipsum',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    )),
                Spacer(flex: 10),
                Icon(
                  CommunityMaterialIcons.whatsapp,
                  size: 26.0,
                  // color: Colors.green,
                ),
                Spacer(flex: 1),
                Icon(
                  Icons.telegram_sharp,
                  size: 26.0,
                  // color: Colors.blue,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023, 1),
                        lastDate: DateTime(2024, 12),
                      );
                    },
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      size: 26.0,
                    ),
                  ),
                  const Text('Записаться',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message,
                      size: 26.0,
                    ),
                  ),
                  const Text('Спросить',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.phone,
                        size: 26.0, color: Colors.black),
                  ),
                  const Text('пн-пт 9.00 - 21.00',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ))
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      // setState(() {
                      //   // bool click = false;
                      //   click = !click;
                      // });
                    },
                    // icon: Icon(
                    //     size: 26.0,
                    //     click
                    //         ? Icons.favorite_border
                    //         : Icons.favorite),
                    icon: const Icon(
                      size: 26.0,

                      Icons.favorite_border,
                      // color: click ? Colors.black : Colors.red,
                      color: Colors.black,
                    ),
                    splashRadius: 50,
                    splashColor: Colors.lightGreenAccent),
                const Text('В избранное',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    context.read<BookmarksBloc>().add(AddBookmarkEvent(
                        userId: widget.userId, tagId: widget.tagId));
                  },
                  icon: Icon(
                      size: 26.0,
                      isBookmarkAdded
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined),
                  //Icons.bookmark_add_outlined),
                  color: isBookmarkAdded
                      ? const Color(COLOR_PRIMARY)
                      : Colors.black,
                  //color: Colors.black,
                ),
                const Text('В закладки',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCollapsedWidget extends StatelessWidget {
  const CustomCollapsedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15))),
      child:
          const Center(child: Text('Нажмите на маркер для просмотра заявки')),
    );
  }
}
