import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/ui/place_tag/search_address_screen.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';

import 'bloc/set_location_bloc.dart';

class MapSetLocationScreen extends StatefulWidget {
  final LatLng userLocation;

  const MapSetLocationScreen({
    super.key,
    required this.userLocation,
  });

  @override
  State<MapSetLocationScreen> createState() => _MapSetLocationState();
}

class _MapSetLocationState extends State<MapSetLocationScreen> {
  String? _currentAddress;
  bool _isMoving = false;
  double _zoom = DEFAULT_ZOOM;

  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetLocationBloc, SetLocationState>(
      listener: (ctx, state) {
        if (state.address != null && state.address!.address != null) {
          _currentAddress = state.address!.address;
        }
      },
      builder: (context, state) {
        return StreamBuilder<LatLng>(
          stream: state.locationStream,
          builder: (context, snapshot) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              body: SafeArea(
                child: Stack(
                  children: [
                    FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        center: snapshot.hasData
                            ? snapshot.data
                            : widget.userLocation,
                        zoom: _zoom,
                        onPositionChanged: (position, hasGesture) {
                          BlocProvider.of<SetLocationBloc>(context).add(
                              CenterPositionChanged(
                                  newPosition: position.center!));
                        },
                        onMapReady: () {
                          BlocProvider.of<SetLocationBloc>(context).add(
                              SearchAddressByLocation(widget.userLocation));
                        },
                        onMapEvent: (event) {
                          if (event is MapEventMove) {
                            _isMoving = true;
                            _currentAddress = null;
                          }
                          if (event is MapEventMoveEnd) {
                            _isMoving = false;
                            BlocProvider.of<SetLocationBloc>(context)
                                .add(SearchAddressByLocation(snapshot.data!));
                          }
                        },
                      ),
                      children: [
                        TileLayer(
                          minZoom: 2,
                          maxZoom: 18,
                          backgroundColor: Colors.grey,
                          urlTemplate: MAP_TILE_URL,
                          userAgentPackageName: MAP_USER_AGENT_PACKAGE_NAME,
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: snapshot.hasData
                                  ? snapshot.data!
                                  : widget.userLocation,
                              builder: (context) => Image.asset(
                                _isMoving
                                    ? 'assets/images/pin_put_away.png'
                                    : 'assets/images/pin_put_down.png',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (_isMoving == false)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'near_me',
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  _moveToPosition(widget.userLocation);
                                },
                                child: const Icon(
                                  Icons.near_me,
                                  color: Color(COLOR_PRIMARY),
                                ),
                              ),
                              const SizedBox(height: 8),
                              FloatingActionButton(
                                heroTag: 'add',
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _zoom += DEFAULT_ZOOM_STEP;
                                    _moveToPosition(widget.userLocation);
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Color(COLOR_PRIMARY),
                                ),
                              ),
                              const SizedBox(height: 8),
                              FloatingActionButton(
                                heroTag: 'remove',
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _zoom -= DEFAULT_ZOOM_STEP;
                                    _moveToPosition(widget.userLocation);
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Color(COLOR_PRIMARY),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (_isMoving == false)
                      Positioned(
                        top: 8,
                        left: 8,
                        right: 16,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                context.router.pop();
                              },
                            ),
                            Flexible(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: CupertinoSearchTextField(
                                  controller: _searchController,
                                  onTap: () async {
                                    final LatLng? selectedLocation =
                                        await showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25),
                                        ),
                                      ),
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) =>
                                          const FractionallySizedBox(
                                        heightFactor: 0.9,
                                        child: SearchAddressScreen(),
                                      ),
                                    );
                                    if (selectedLocation == null) {
                                      return;
                                    }
                                    _moveToPosition(selectedLocation);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (_isMoving == false)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25))),
                          child: Stack(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FractionalTranslation(
                                translation: const Offset(5.25, -0.5),
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: FloatingActionButton(
                                    heroTag: 'check',
                                    backgroundColor: const Color(COLOR_PRIMARY),
                                    onPressed: () {
                                      context.router
                                          .push(const PlaceOrderScreenRoute());
                                    },
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Center(
                                  child: Row(
                                    children: [
                                      //const Icon(Icons.circle_outlined, size: 30),
                                      const SizedBox(width: 16),
                                      Flexible(
                                        child: Text(
                                          _currentAddress ??
                                              AppLocalizations.of(context)!
                                                  .loading,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _moveToPosition(LatLng position) {
    _mapController.move(
      position,
      _zoom,
    );
    _isMoving = false;
    BlocProvider.of<SetLocationBloc>(context)
        .add(CenterPositionChanged(newPosition: position));
    BlocProvider.of<SetLocationBloc>(context)
        .add(SearchAddressByLocation(position));
  }
}
