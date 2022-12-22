import 'dart:async';

import 'package:deedee/generated/BucketService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/filter/filter_bloc.dart';
import 'package:deedee/ui/filter/filter_box/filter_box.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/map_cubit/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class FilterPage extends StatefulWidget {
  final User user;

  const FilterPage({Key? key, required this.user}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late Map<String, bool> _filterMap;

  Bucket bucket = Bucket();
  AutovalidateMode _validate = AutovalidateMode.disabled;

  late double _lat, _lon;

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;

  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterBloc>(
      create: (context) => FilterBloc(),
      child: WillPopScope(
        child: Scaffold(
          drawer: DeeDeeDrawer(user: widget.user),
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.filterTagsPageTitle,
              style: const TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: BlocConsumer<FilterBloc, FilterState>(
            listenWhen: (old, current) => old != current,
            listener: (context, state) {
              if (state is FilterChangeState) {
                setState(() {
                  _filterMap =
                      state.predefinedFilterActiveMap; //TODO: pass filtered map
                });
              } else if (state is FilterTagsDoneState) {
                context.read<LoadingCubit>().hideLoading();
                Map<LatLng, String> tagMap = {
                  for (var tag in state.bucket.tags)
                    LatLng(tag.geoLocation.latitude, tag.geoLocation.longitude):
                        tag.messengerId
                };
                pushReplacement(
                    context,
                    MapScreen(
                      tagDescriptionMap: tagMap,
                      user: widget.user,
                      topic: widget.user.selectedTopic,
                    ));
              } else if (state is FilterFailureState) {
                showSnackBar(context, state.errorMessage);
              }
            },
            buildWhen: (old, current) =>
                current is FilterFailureState && old != current,
            builder: (context, state) {
              if (state is FilterFailureState) {
                _validate = AutovalidateMode.onUserInteraction;
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, right: 10.0, left: 10.0),
                      child: FilterBox(
                        user: widget.user,
                        topic: widget.user.selectedTopic,
                      ),
                    ),
                    DeeDeeButton(AppLocalizations.of(context)!.filterTags, () {
                      context.read<LoadingCubit>().showLoading(
                          context,
                          AppLocalizations.of(context)!.filteringTagsHistTitle,
                          false);
                      context.read<FilterBloc>().add(FilterTagsActionEvent(
                          _filterMap, widget.user.accountType));
                    }),
                  ],
                ),
              );
            },
          ),
        ),
        onWillPop: () async {
          return pushReplacement(context, HomeScreen(user: widget.user!));
        },
      ),
    );
  }
}
