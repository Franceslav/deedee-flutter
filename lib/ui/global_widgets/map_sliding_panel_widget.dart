import 'package:deedee/ui/page/map_cubit/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapSlidingPanelWidget extends StatelessWidget {
  final Size size;
  final DeeDeeSliderController _pc;
  final String _selectedMessengerId;
  final bool _openedFirstTime;

  const MapSlidingPanelWidget({
    super.key,
    required this.size,
    required DeeDeeSliderController pc,
    required String selectedMessengerId,
    required bool openedFirstTime,
  })  : _pc = pc,
        _selectedMessengerId = selectedMessengerId,
        _openedFirstTime = openedFirstTime;

  @override
  Widget build(BuildContext context) {
    SlidingUpPanel panel = SlidingUpPanel(
      renderPanelSheet: true,
      panelSnapping: true,
      defaultPanelState: PanelState.CLOSED,
      backdropEnabled: true,
      collapsed: CustomCollapsedWidget(
        openedFirstTime: _openedFirstTime,
      ),
      minHeight:
          _openedFirstTime ? 0 : MediaQuery.of(context).size.height * 0.04,
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
        openedFirstTime: _openedFirstTime,
      ),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
    );

    return panel;
  }
}

class CustomCollapsedWidget extends StatelessWidget {
  final bool _openedFirstTime;

  const CustomCollapsedWidget({
    super.key,
    required openedFirstTime,
  }) : _openedFirstTime = openedFirstTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        color: Colors.white,
      ),
      child:
          const Center(child: Text('Нажмите на маркер для просмотра заявки')),
    );
    // }
  }
}
