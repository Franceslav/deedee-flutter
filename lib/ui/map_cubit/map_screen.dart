import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/map_cubit/tag_marker/tag_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../constants.dart';
import '../auth/welcome/welcome_screen.dart';

class MapScreen extends StatefulWidget {
  final User user;
  final Map<LatLng, String> tagDescriptionMap;

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
  bool click = true;
  bool click_bm = true;

  final List<TagMarker> _markers = [];

  late TagMarker _selectedMarker;
  String _selectedMessengerId = '';

  @override
  void initState() {
    widget.tagDescriptionMap.forEach(
      (point, messengerId) {
        TagMarker tagMarker = TagMarker(
          tagMessengerId: messengerId,
          marker: Marker(
            point: point,
            width: 30,
            height: 30,
            builder: (context) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedMessengerId = messengerId;
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
      child: WillPopScope(
          onWillPop: () async {
            return pushReplacement(context, const FilterPage());
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
                swPanBoundary: LatLng(
                    geo.latitude - MAP_BOUNDS, geo.longitude - MAP_BOUNDS),
                nePanBoundary: LatLng(
                    geo.latitude + MAP_BOUNDS, geo.longitude + MAP_BOUNDS),
                center: LatLng(geo.latitude, geo.longitude),
                // bounds: LatLngBounds.fromPoints(_latLngList),
                zoom: MAP_ZOOM,
                onTap: (tapPosition, tapLatLon) {
                  _pc.close();
                },
              ),
              nonRotatedChildren: [
                SlidingUpPanel(
                  defaultPanelState: PanelState.CLOSED,
                  minHeight: size.height * 0,
                  maxHeight: size.height * 0.5,
                  controller: _pc,
                  header: Container(
                    margin: EdgeInsets.fromLTRB(size.width / 2 - 30, 10.0, 24.0, 0.0),
                    width: 60,
                    height: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                  ),
                  panel: Column(
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.account_box_sharp,
                            size: 26.0,
                          ),
                          const SizedBox(width: 10),
                          Text(_selectedMessengerId,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 40),
                          const Icon(Icons.star_rounded,
                              size: 26.0, color: Colors.deepPurple),
                          const Icon(Icons.star_rounded,
                              size: 26.0, color: Colors.deepPurple),
                          const Icon(Icons.star_rounded,
                              size: 26.0, color: Colors.deepPurple),
                          const Icon(Icons.star_rounded,
                              size: 26.0, color: Colors.deepPurple),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: const <Widget>[
                          SizedBox(width: 13),
                          Text('# lorem # ipsum',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                          SizedBox(width: 210),
                          Icon(
                            Icons.whatsapp_sharp,
                            size: 26.0,
                            // color: Colors.green,
                          ),
                          Icon(
                            Icons.telegram_sharp,
                            size: 26.0,
                            // color: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
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
                          const Icon(
                            Icons.message,
                            size: 26.0,
                          ),
                          const Text('Спросить',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          const Icon(Icons.phone,
                              size: 26.0, color: Colors.black),
                          const Text('пн-пт 9.00 - 21.00',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ))
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  click = !click;
                                });
                              },
                              icon: Icon(
                                  size: 26.0,
                                  click
                                      ? Icons.favorite_border
                                      : Icons.favorite),
                              color: click ? Colors.black : Colors.red,
                              splashRadius: 50,
                              splashColor: Colors.lightGreenAccent),
                          const Text('В избранное',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          const SizedBox(width: 80),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                click_bm = !click_bm;
                              });
                            },
                            icon: Icon(
                                size: 26.0,
                                click_bm
                                    ? Icons.bookmark_add_outlined
                                    : Icons.bookmark_add),
                            color: click_bm ? Colors.black : Colors.red,
                          ),
                          const Text('В закладки',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ))
                        ],
                      ),
                    ],
                  ),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(25)),
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
          )),
    );
  }
}
