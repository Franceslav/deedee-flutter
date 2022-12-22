import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/map_cubit/map_popup/map_popup_screen.dart';
import 'package:deedee/ui/map_cubit/tag_marker/tag_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

import '../auth/welcome/welcome_screen.dart';

class MapScreen extends StatefulWidget {
  final User user;
  final Map<LatLng, String> tagDescriptionMap;
  final String topic;

  const MapScreen(
      {Key? key,
      required this.tagDescriptionMap,
      required this.user,
      required this.topic})
      : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final PopupController _popupController = PopupController();
  final MapController _mapController = MapController();
  final double _zoom = 12;

  List<TagMarker> _markers = [];

  @override
  void initState() {
    widget.tagDescriptionMap.forEach((_point, messengerId) {
      _markers.add(TagMarker(
          tagMessengerId: messengerId,
          marker: Marker(
            point: _point,
            width: 30,
            height: 30,
            builder: (context) => const Icon(
              Icons.location_on_sharp,
              size: 30,
              color: Colors.black38,
            ),
          )));
    });

    super.initState();
  }

  final FitBoundsOptions _fitBoundsOptions =
      const FitBoundsOptions(padding: EdgeInsets.all(8.0));

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.authState == AuthState.unauthenticated) {
          pushAndRemoveUntil(context, const WelcomeScreen(), false);
        }
      },
      child: WillPopScope(
          onWillPop: () async {
            return pushReplacement(
                context,
                FilterPage(
                  user: widget.user!,
                ));
          },
          child: Scaffold(
            drawer: DeeDeeDrawer(user: widget.user),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                  color: isDarkMode(context) ? Colors.white : Colors.black),
              elevation: 0.0,
            ),
            body: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                // swPanBoundary: LatLng(52, 24),
                // nePanBoundary: LatLng(52.1, 23.8),
                center: LatLng(widget.user.lastGeoLocation.latitude,
                    widget.user.lastGeoLocation.longitude),
                // bounds: LatLngBounds.fromPoints(_latLngList),
                zoom: _zoom,
                // onTap: (_) => {},
              ),
              children: [
                TileLayer(
                  minZoom: 2,
                  maxZoom: 18,
                  backgroundColor: Colors.black,
                  subdomains: ['a', 'b', 'c'],
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.dinobit.deedeeapp',
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
                PopupMarkerLayerWidget(
                  options: PopupMarkerLayerOptions(
                    popupController: _popupController,
                    markers: _markers.map((e) => e.marker).toList(),
                    markerRotateAlignment:
                        PopupMarkerLayerOptions.rotationAlignmentFor(
                            AnchorAlign.top),
                    popupBuilder: (BuildContext context, Marker marker) =>
                        MapPopup(
                            _markers.firstWhere((tag) => tag.marker == marker)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
