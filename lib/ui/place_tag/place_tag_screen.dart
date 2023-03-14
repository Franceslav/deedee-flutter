import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/gps.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:search_address_repository/search_address_repository.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../deedee_button/deedee_button.dart';
import '../global_widgets/deedee_appbar.dart';
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
  late Position _position;

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
    locator.get<GPSRepository>().getGPSPosition();
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
          controller: _controller,
          child: GestureDetector(
            child: const Icon(Icons.bookmark_border),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const DialogWidget();
                  });
            },
          )),
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
                  padding: const EdgeInsets.only(top: 16, bottom: 66),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            if (_topics.isNotEmpty)
                              Column(
                                children: [
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
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
