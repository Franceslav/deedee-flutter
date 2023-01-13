import 'dart:async';

import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/locator.dart';
import 'package:deedee/ui/place_bid/place_tag_bloc.dart';
import 'package:deedee/ui/place_bid/place_tag_filter_box/filter_box_bloc.dart';
import 'package:deedee/ui/place_bid/predefined_filter/predefined_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';


class FilterBox extends StatefulWidget {
  final User user;

  const FilterBox({Key? key, required this.user}) : super(key: key);

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

  Set<String> _titles = {"маникюр"};

  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    super.initState();
    serviceLocator.get<GRCPUtils>().getFilterItems("маникюр").then((value) {
      setState(() {
        _titles = {for (var v in value) v.title};
        _titles.add("маникюр");
      });
    });
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
                    context.read<PlaceTagBloc>().add(PlaceTagFilterChangeEvent(
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
                    padding: const EdgeInsets.only(
                        top: 32.0, right: 10.0, left: 10.0),
                    child: Wrap(
                        children: _titles
                            .map((title) => PredefinedFilter(
                                user: widget.user, title: title))
                            .toList())),
              ],
            ),
          );
        },
      ),
    );
  }
}
