import 'package:deedee/constants.dart';
import 'package:deedee/ui/place_tag/search_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocConsumer<SetLocationBloc, SetLocationState>(
        listener: (ctx, state) {
          if (state.address != null && state.address!.address != null) {
            _currentAddress = state.address!.address;
          }
        },
        builder: (context, state) {
          return StreamBuilder<LatLng>(
            stream: state.locationStream,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      center: snapshot.hasData
                          ? snapshot.data
                          : widget.userLocation,
                      zoom: 16,
                      onPositionChanged: (position, hasGesture) {
                        BlocProvider.of<SetLocationBloc>(context).add(
                            CenterPositionChanged(
                                newPosition: position.center!));
                      },
                      onMapReady: () {
                        BlocProvider.of<SetLocationBloc>(context)
                            .add(SearchAddressByLocation(widget.userLocation));
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
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                height: 80,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Center(
                                    child: Text(
                                      _currentAddress ??
                                          AppLocalizations.of(context)!.loading,
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ElevatedButton(
                                onPressed: () async {
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
                                child: Text(AppLocalizations.of(context)!
                                    .searchByAddress),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    _moveToPosition(widget.userLocation);
                                  },
                                  child: const Icon(Icons.near_me),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(
                                    AddressModel(
                                      address: _currentAddress,
                                      location:
                                          snapshot.data ?? widget.userLocation,
                                    ),
                                  );
                                },
                                child: Text(
                                    AppLocalizations.of(context)!.setLocation),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void _moveToPosition(LatLng position) {
    _mapController.move(
      position,
      _mapController.zoom,
    );
    _isMoving = false;
    BlocProvider.of<SetLocationBloc>(context)
        .add(CenterPositionChanged(newPosition: position));
    BlocProvider.of<SetLocationBloc>(context)
        .add(SearchAddressByLocation(position));
  }
}
