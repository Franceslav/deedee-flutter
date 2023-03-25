// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/account/account_info_widget.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/selector/selector_appbar.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/services/social_service.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/global_widgets/map_sliding_panel_widget.dart';
import 'package:deedee/ui/map_cubit/tag_marker/tag_marker.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/auth/authentication_bloc.dart';
import 'package:deedee/ui/bookmarks/bloc/bookmarks_bloc.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/map_cubit/tag_marker/tag_marker.dart';
import 'package:deedee/ui/selector/bloc/selector_bloc.dart';

import '../auth/welcome/welcome_screen.dart';

class MapScreen extends StatefulWidget {
  final User user;
  final Map<LatLng, TagDTO> tagDescriptionMap;
  List<String> filterKeys;
  List<String> selectedFilterKeys;
  final String topicsName;

  MapScreen({
    Key? key,
    required this.user,
    required this.tagDescriptionMap,
    required this.filterKeys,
    required this.selectedFilterKeys,
    required this.topicsName,
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
  LatLng get geo => widget.user.lastGeoLocation;

  final MapController _mapController = MapController();
  final DeeDeeSliderController _pc = DeeDeeSliderController();

  final List<TagMarker> _markers = [];

  String _selectedMessengerId = '';
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
    Size size = MediaQuery.of(context).size;
    final selectorBloc =
        SelectorBloc(locator.get<GRCPRepository>(), widget.user);
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
                    if (state is LoadedFilterKeysState) {
                      widget.filterKeys = state.filterKeys;
                    }
                    if (state is FilterKeySelectedState) {
                      widget.selectedFilterKeys.contains(state.filterKey)
                          ? widget.selectedFilterKeys.remove(state.filterKey)
                          : widget.selectedFilterKeys.add(state.filterKey);
                    }
                  },
                  builder: (context, state) {
                    return SelectorAppBar(
                      data: widget.filterKeys,
                      onTap: (String filterKey) =>
                          selectorBloc.add(SelectFilterKeyEvent(filterKey)),
                      selectedItems: widget.selectedFilterKeys,
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
                  center: LatLng(geo.latitude, geo.longitude),
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
              MapSlidingPanelWidget(
                size: size,
                pc: _pc,
                selectedMessengerId: _selectedMessengerId,
                openedFirstTime: openedFirstTime,
              ),
              Positioned(
                  top: 16,
                  left: 16,
                child: GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    context.router.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPanelWidget extends StatefulWidget {
  final String _selectedMessengerId;
  final bool _openedFirstTime;

  const CustomPanelWidget({
    super.key,
    required String selectedMessengerId,
    required bool openedFirstTime,
  })  : _selectedMessengerId = selectedMessengerId,
        _openedFirstTime = openedFirstTime;

  @override
  State<CustomPanelWidget> createState() => _CustomPanelWidgetState();
}

class _CustomPanelWidgetState extends State<CustomPanelWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 52, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget._openedFirstTime
              ? []
              : [
                  const AccountInfoWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: ContactsWidget(widget: widget),
                  ),
                  const AddressInfoWidget(),
                ],
        ),
      ),
    );
  }
}

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({
    super.key,
    required this.widget,
  });

  final CustomPanelWidget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          //TODO implement data
          onPressed: () {},
          child: Image.asset('assets/images/telegram_logo.png'),
        ),
        TextButton(
          onPressed: () =>
              SocialService.launchInstagram(widget._selectedMessengerId),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          child: Image.asset('assets/images/instagram_logo.png'),
        ),
        TextButton(
          //TODO implement data
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),

          child: Image.asset('assets/images/phone_icon.png'),
        ),
        TextButton(
          //TODO implement data
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          child: Image.asset('assets/images/favorite_icon.png'),
        ),
      ],
    );
  }
}

class AddressInfoWidget extends StatelessWidget {
  const AddressInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //TODO implement data
        children: const [
          Text(
            'Время работы',
            style: AppTextTheme.bodyMedium,
          ),
          SizedBox(height: 2),
          Text(
            'Пн-Пт 9:00 - 18:00',
            style: AppTextTheme.bodyLarge,
          ),
          SizedBox(height: 12),
          Text(
            'Адрес',
            style: AppTextTheme.bodyMedium,
          ),
          SizedBox(height: 2),
          Text(
            'ул.Калиновского д.235/4',
            style: AppTextTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
