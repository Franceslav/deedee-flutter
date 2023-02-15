import 'dart:async';

import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/place_tag/map_set_location_screen.dart';

import 'package:deedee/ui/theme/deedee_theme.dart';

import 'package:deedee/ui/topic/topic_widget.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';

import '../deedee_button/deedee_button.dart';
import '../selector/bloc/selector_bloc.dart';
import '../selector/selector_list.dart';

class PlaceTagScreen extends StatefulWidget {
  const PlaceTagScreen({super.key});

  @override
  State<PlaceTagScreen> createState() => _PlaceTagScreenState();
}

class _PlaceTagScreenState extends State<PlaceTagScreen> {
  // TODO: [DEEMOB-68]
  late LatLng _userLocation = DEFAULT_LOCATION;
  final String _messengerId = 'ronxbysu';
  bool _serviceStatus = false;
  bool _hasPermission = false;
  late LocationPermission _permission;
  late Position _position;
  late StreamSubscription<Position> _positionStream;
  double _duration = 3;
  DateTime _date = DateTime.now();

  final SelectorBloc bloc = SelectorBloc();
  List<String> _filterKeys = [];
  List<String> _topics = [];
  String _selectedTopic = '';
  List<String> _selectedFilterKeys = [];
  LatLng _selectedLocation = DEFAULT_LOCATION;
  String _selectedAddress = '';
  bool _isInit = true;

  ScrollController scrollController = ScrollController();

  final List<Map> topics = [
    {"color": Colors.red, "title": "Рабочие"},
    {
      "color": Colors.pink,
      "title": "Авто",
    },
    {
      "color": Colors.green,
      "title": "Бьюти",
    },
    {
      "color": Colors.orange,
      "title": "Отделка",
    },
    {
      "color": Colors.deepPurple,
      "title": "Дети",
    },
    {
      "color": Colors.blue,
      "title": "Клининг",
    },
    {
      "color": Colors.blue,
      "title": "Клининг",
    },
    {
      "color": Colors.blue,
      "title": "Клининг",
    },
    {
      "color": Colors.blue,
      "title": "Клининг",
    },
    {
      "color": Colors.blue,
      "title": "Клининг",
    },
    {
      "color": Colors.blue,
      "title": "Клининг",
    },
    {
      "color": Colors.blue,
      "title": "Клининг",
    },
  ];

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
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.placeBidPageTitle),
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
              _selectedLocation = DEFAULT_LOCATION;
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
            if (_selectedFilterKeys.length < 3) {
              _selectedLocation = DEFAULT_LOCATION;
            }
          }
          // if (state is DurationSelectedState) {
          //   _userChoseDuration = true;
          // }
          if (state is LocationSelectedState) {
            _selectedAddress = state.data.address ?? '';
            _selectedLocation = state.data.location ?? DEFAULT_LOCATION;
          }
          if (state is LoadingSelectorState) {
            context.read<LoadingCubit>().showLoading(
                  context,
                  AppLocalizations.of(context)!.placingTag,
                  false,
                );
          }
          if (state is ErrorState) {
            context.read<LoadingCubit>().hideLoading();
            final message = state.errorMessage;
            showSnackBar(context, message);
          }
          if (state is UserTagPlacedState) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
        builder: ((context, state) {
          return state is InitialState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white70,
                        child: TopicWidget(
                          topicTitle: topics,
                          onTap: () {
                            scrollController.animateTo(
                                MediaQuery.of(context).size.height - 20,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                            bloc.add(
                                SelectFirstLvlTopicEvent(topics.toString()));
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 80,
                        color: Colors.white60,
                        child: Column(
                          children: [
                            if (_topics.isNotEmpty)
                              Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.chooseTopic,
                                    style:
                                        Theme.of(context).textTheme.headline1,
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
                                    AppLocalizations.of(context)!
                                        .chooseFilterKeys,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  SelectorList(
                                    data: _filterKeys,
                                    onTap: (String filterKey) => bloc
                                        .add(SelectFilterKeyEvent(filterKey)),
                                    selectedItems: _selectedFilterKeys,
                                  ),
                                ],
                              ),
                            if (user.premiumStatus == PremiumStatus.isPremium &&
                                _selectedFilterKeys.length >= 3)
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .applicationBegin,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          DateTime? newDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: _date,
                                            firstDate: DateTime(2023, 1),
                                            lastDate: DateTime(2024, 12),
                                          );
                                          if (newDate == null) {
                                            return;
                                          }
                                          setState(() {
                                            _date = newDate;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.calendar_month_rounded,
                                          size: 42.0,
                                          color: Color(COLOR_PRIMARY),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '${AppLocalizations.of(context)!.applicationStart} ${DateFormat.yMMMEd().format(_date)}',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .applicationDays,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  Slider(
                                      value: _duration,
                                      max: 15,
                                      divisions: 15,
                                      label: _duration.round().toString(),
                                      onChanged: (value) {
                                        setState(() {
                                          _duration = value;
                                        });
                                      }),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .applicationActivity,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  Text(
                                    DateFormat.yMMMEd().format(_date.add(
                                        Duration(days: _duration.toInt()))),
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                      onPressed: () => bloc.add(
                                          DurationSelectedEvent(
                                              duration: _duration)),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .placeRequest,
                                      )),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            if (user.premiumStatus ==
                                    PremiumStatus.notPremium &&
                                _selectedFilterKeys.length >= 3)
                              Column(
                                children: [
                                  Text(
                                    '${AppLocalizations.of(context)!.applicationAction} $DEFAULT_EXPECTATION_NUMBER_OF_DAYS',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  Text(
                                    DateFormat.yMMMEd().format(DateTime.now()
                                        .add(const Duration(
                                            days:
                                                DEFAULT_EXPECTATION_NUMBER_OF_DAYS))),
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .upgradePremium,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(AppLocalizations.of(context)!
                                          .upgradeToPremium)),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                      onPressed: () => bloc.add(
                                          DurationSelectedEvent(
                                              duration: _duration)),
                                      child: Text(
                                          AppLocalizations.of(context)!.resume))
                                ],
                              ),
                            if (state is DurationSelectedState)
                              Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .chooseLocation,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final data = await Navigator.of(context)
                                          .push<AddressModel?>(
                                        MaterialPageRoute(
                                          builder: (_) => MapSetLocationScreen(
                                            userLocation: _userLocation,
                                          ),
                                        ),
                                      );
                                      if (data == null) {
                                        return;
                                      }
                                      bloc.add(SelectLocationEvent(data));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      height: 40.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Colors.black26,
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                        color: _selectedLocation ==
                                                DEFAULT_LOCATION
                                            ? Colors.white
                                            : const Color(COLOR_PRIMARY),
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .selectLocationOnMap,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: _selectedLocation ==
                                                    DEFAULT_LOCATION
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_selectedLocation != DEFAULT_LOCATION)
                                    Text(
                                      '${AppLocalizations.of(context)!.selectedLocation}: $_selectedAddress',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                ],
                              ),
                            if (_selectedLocation != DEFAULT_LOCATION)
                              DeeDeeButton(
                                AppLocalizations.of(context)!.placeBid,
                                () {
                                  bloc.add(
                                    PushTagEvent(
                                      accountType: user.accountType,
                                      topic: _selectedTopic,
                                      messengerId: _messengerId,
                                      location: _selectedLocation,
                                      filterKeys: _selectedFilterKeys,
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
            onPressed: () {
              scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            child: const Icon(Icons.arrow_upward_outlined)),
      ),
    );
  }
}
