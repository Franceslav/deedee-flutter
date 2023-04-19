import 'package:deedee/ui/map_sliding_panel/bloc/map_sliding_panel_bloc.dart';
import 'package:deedee/ui/page/map_cubit/map_screen.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../injection.dart';
import '../../repository/service_request_repository.dart';
import '../global_widgets/custom_panel_widget.dart';
import '../user_bloc/user_bloc.dart';

class MapSlidingPanel extends StatelessWidget {
  final Size size;
  final DeeDeeSliderController _pc;
  final String _selectedMessengerId;
  final Int64 _selectedTagId;
  final bool _openedFirstTime;

  const MapSlidingPanel({
    super.key,
    required this.size,
    required DeeDeeSliderController pc,
    required String selectedMessengerId,
    required Int64 selectedTagId,
    required bool openedFirstTime,
  })  : _pc = pc,
        _selectedMessengerId = selectedMessengerId,
        _selectedTagId = selectedTagId,
        _openedFirstTime = openedFirstTime;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc =
        MapSlidingPanelBloc(locator.get<ServiceRequestRepository>(), user);

    return BlocProvider<MapSlidingPanelBloc>(
      create: (context) => bloc,
      child: BlocConsumer<MapSlidingPanelBloc, MapSlidingPanelState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SlidingUpPanel(
            renderPanelSheet: true,
            panelSnapping: true,
            defaultPanelState: PanelState.CLOSED,
            backdropEnabled: true,
            collapsed: _CustomCollapsedWidget(
              openedFirstTime: _openedFirstTime,
            ),
            minHeight: _openedFirstTime
                ? 0
                : MediaQuery.of(context).size.height * 0.04,
            maxHeight: MediaQuery.of(context).size.height * 0.5,
            controller: _pc,
            header: Container(
              margin: EdgeInsets.fromLTRB(size.width / 2 - 30, 10.0, 24.0, 0.0),
              width: 60,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
            ),
            panel: CustomPanelWidget(
              selectedMessengerId: _selectedMessengerId,
              selectedTagId: _selectedTagId,
              openedFirstTime: _openedFirstTime,
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          );
        },
      ),
    );
  }
}

class _CustomCollapsedWidget extends StatelessWidget {
  final bool _openedFirstTime;

  const _CustomCollapsedWidget({
    required openedFirstTime,
  }) : _openedFirstTime = openedFirstTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        color: Colors.white,
      ),
      child: Center(
          child:
              Text(AppLocalizations.of(context)!.clickMarkerViewApplication)),
    );
    // }
  }
}
