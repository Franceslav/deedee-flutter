import 'dart:async';

import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/locator.dart';
import 'package:deedee/ui/filter/filter_bloc.dart';
import 'package:deedee/ui/filter/filter_box/filter_box_bloc.dart';
import 'package:deedee/ui/filter/predefined_filter/predefined_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class FilterBox<T> extends StatefulWidget {
  final User user;
  final String topic;

  const FilterBox({
    Key? key,
    required this.user,
    required this.topic,
  }) : super(key: key);

  @override
  _FilterBoxState createState() => _FilterBoxState();
}

class _FilterBoxState extends State<FilterBox> {
  final GlobalKey<FormState> _key = GlobalKey();
  Topic topic = Topic();

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;

  Set<String>? titles;

  late StreamSubscription<Position> positionStream;

  _FilterBoxState();

  void _initializeTitles() async {
    final filtersItems =
        await serviceLocator.get<GRCPUtils>().getFilterItems(widget.topic);
    setState(() {
      titles = {for (var v in filtersItems) v.title};
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeTitles();
  }

  @override
  Widget build(BuildContext context) {
    // final bloc = context.watch<PredefinedFilterBloc>();

    return BlocProvider<FilterBoxBloc>(
      create: (context) => FilterBoxBloc(),
      child: Builder(
        builder: (context) {
          return MultiBlocListener(
            listeners: [
              BlocListener<FilterBoxBloc, FilterBoxState>(
                listener: (context, state) {
                  if (state is FilterBoxChangeState) {
                    context.read<FilterBloc>().add(FilterChangeEvent(
                        state.predefinedFilterActiveMap,
                        widget.user.accountType));
                  }
                },
              ),
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, right: 10.0, left: 10.0),
                  child: titles != null && (titles?.isNotEmpty ?? false)
                      ? Wrap(
                          children: titles!
                              .map((title) => PredefinedFilter(
                                  user: widget.user, title: title))
                              .toList())
                      : Container(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
