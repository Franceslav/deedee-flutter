import 'dart:async';
import 'package:auto_route/auto_route.dart';

import 'package:deedee/constants.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/gps.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/place_tag/map_set_location_screen.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';

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
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../deedee_button/deedee_button.dart';
import '../global_widgets/deedee_appbar.dart';
import '../main_topic/enum/topic_screens_enum.dart';
import '../selector/bloc/selector_bloc.dart';
import '../selector/selector_list.dart';
import 'dialog_widget.dart';

class PlaceTagScreen extends StatefulWidget {
  const PlaceTagScreen({super.key});

  @override
  State<PlaceTagScreen> createState() => _PlaceTagScreenState();
}

class _PlaceTagScreenState extends State<PlaceTagScreen> {
  final PanelController _controller = PanelController();
  late LatLng _userLocation;
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

  @override
  void initState() {
    super.initState();
    locator.get<GPSUtils>().checkGps();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isInit) {
      _position = await Geolocator.getCurrentPosition();
      _userLocation = LatLng(_position.latitude, _position.longitude);
      //without delay services fail to determine _userLocation
      await Future.delayed(const Duration(seconds: 2));
      bloc.add(LoadTopicsEvent(_userLocation));
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.placeBidPageTitle,
        controller: _controller,
        child: GestureDetector(
            child: const Icon(Icons.bookmark_border),
          onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogWidget();
                  });
          },
        )
      ),
      body: BlocConsumer<SelectorBloc, SelectorState>(
        bloc: bloc,
        listener: (context, state) async {
          if (state is LoadedTopicsState) {
            _topics = state.topics.map((e) => e.title).toList();
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
            context.router.popUntil((route) => route.isFirst);
          }
        },
        builder: ((context, state) {
          return state is InitialState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DeeDeeButton(AppLocalizations.of(context)!.placeBid,
                            () {
                          context.router.push(MainTopicScreenRoute(
                              screenType: ScreenType.placeTags));
                        }),
                        DeeDeeButton(AppLocalizations.of(context)!.seeTags, () {
                          context.router.push(MainTopicScreenRoute(
                              screenType: ScreenType.filterTags));
                        }),
                        Column(
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
                                  state is! DurationSelectedState
                                      ? ElevatedButton(
                                          onPressed: () => bloc.add(
                                              DurationSelectedEvent(
                                                  duration: _duration)),
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .placeRequest),
                                        )
                                      : const SizedBox(
                                          height: 0.1,
                                        ),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            if (user.premiumStatus ==
                                    PremiumStatus.notPremium &&
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
                                        },
                                        icon: Icon(
                                          Icons.calendar_month_rounded,
                                          size: 42.0,
                                          color: const Color(COLOR_PRIMARY)
                                              .withOpacity(0.5),
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
                                      thumbColor: const Color.fromARGB(
                                          255, 116, 119, 199),
                                      value: _duration,
                                      max: 15,
                                      divisions: 15,
                                      label: _duration.round().toString(),
                                      onChanged: (value) {}),
                                  const SizedBox(height: 15),
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
                                  state is! DurationSelectedState &&
                                          _selectedLocation == DEFAULT_LOCATION
                                      ? ElevatedButton(
                                          onPressed: () => bloc.add(
                                              DurationSelectedEvent(
                                                  duration: _duration)),
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .resume),
                                        )
                                      : const SizedBox(
                                          height: 0.1,
                                        ),
                                ],
                              ),
                            if ((state is DurationSelectedState) ||
                                (_selectedLocation != DEFAULT_LOCATION))
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
                                      final data = await context.router.push(
                                              MapSetLocationScreenRoute(
                                                  userLocation: _userLocation))
                                          as AddressModel?;
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
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
