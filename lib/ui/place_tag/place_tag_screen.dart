import 'dart:async';
import 'package:deedee/services/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../model/user.dart';
import '../deedee_button/deedee_button.dart';
import '../drawer/deedee_drawer.dart';
import '../selector/selector_list.dart';
import '../selector/bloc/selector_bloc.dart';
import 'package:deedee/ui/loading_cubit.dart';

class PlaceTagScreen extends StatefulWidget {
  final User user;

  const PlaceTagScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<PlaceTagScreen> createState() => _PlaceTagScreenState();
}

class _PlaceTagScreenState extends State<PlaceTagScreen> {
  late LatLng _userLocation;
  final String _messengerId = 'ronxbysu';
  bool _serviceStatus = false;
  bool _hasPermission = false;
  late LocationPermission _permission;
  late Position _position;
  late StreamSubscription<Position> _positionStream;

  final SelectorBloc bloc = SelectorBloc();
  List<String> _filterKeys = [];
  List<String> _topics = [];
  String _selectedTopic = '';
  List<String> _selectedFilterKeys = [];
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    checkGps();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isInit) {
      //without delay services fail to determine _userLocation
      await Future.delayed(const Duration(seconds: 2));
      bloc.add(LoadTopicsEvent(_userLocation));
    }
    _isInit = false;
  }

  checkGps() async {
    _serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (_serviceStatus) {
      _permission = await Geolocator.checkPermission();
      if (_permission == LocationPermission.denied) {
        _permission = await Geolocator.requestPermission();
        if (_permission == LocationPermission.denied) {
          // showSnackBar(context, 'Location permissions are denied');
        } else if (_permission == LocationPermission.deniedForever) {
          // showSnackBar(context, 'Location permissions are permanently denied');
        } else {
          _hasPermission = true;
        }
      } else {
        _hasPermission = true;
      }
      if (_hasPermission) {
        setState(() {});
        getLocation();
      }
    } else {
      // showSnackBar(context, 'GPS Service is not enabled, turn on GPS location');
    }
    setState(() {});
  }

  getLocation() async {
    _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userLocation = LatLng(_position.latitude, _position.longitude);
    });
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );
    StreamSubscription<Position> _positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.placeBidPageTitle),
      ),
      drawer: DeeDeeDrawer(
        user: widget.user,
      ),
      body: BlocConsumer<SelectorBloc, SelectorState>(
        bloc: bloc,
        listener: (context, state) async {
          if (state is LoadedTopicsState) {
            _topics = state.topics;
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
              bloc.add(LoadFilterKeysEvent(_selectedTopic));
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
                  AppLocalizations.of(context)!.placingTag,
                  false,
                );
          }
          if (state is UserTagPlacedState || state is ErrorState) {
            context.read<LoadingCubit>().hideLoading();
            final message = state is ErrorState
                ? state.errorMessage
                : AppLocalizations.of(context)!.tagPlacedCheckTheMap;
            showSnackBar(context, message);
          }
        },
        builder: ((context, state) {
          return state is InitialState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (_topics.isNotEmpty)
                          Column(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.chooseTopic,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SelectorList(
                                data: _topics,
                                onTap: (String topic) =>
                                    bloc.add(SelectTopicEvent(topic)),
                                selectedItems: [_selectedTopic],
                              ),
                            ],
                          ),
                        if (_filterKeys.isEmpty &&
                            state is LoadingFiltersKeyState)
                          const Center(child: CircularProgressIndicator()),
                        if (_filterKeys.isNotEmpty)
                          Column(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.chooseFilterKeys,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SelectorList(
                                data: _filterKeys,
                                onTap: (String filterKey) =>
                                    bloc.add(SelectFilterKeyEvent(filterKey)),
                                selectedItems: _selectedFilterKeys,
                              ),
                            ],
                          ),
                        if (_selectedFilterKeys.length >= 3)
                          DeeDeeButton(
                            AppLocalizations.of(context)!.placeBid,
                            () {
                              bloc.add(
                                PushTagEvent(
                                  accountType: widget.user.accountType,
                                  topic: _selectedTopic,
                                  messengerId: _messengerId,
                                  location: _userLocation,
                                  filterKeys: _selectedFilterKeys,
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
