import 'package:deedee/ui/map_cubit/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapSlidingPanelWidget extends StatelessWidget {
  final String tagId;
  final String userId;

  const MapSlidingPanelWidget({
    super.key,
    required this.size,
    required DeeDeeSliderController pc,
    required String selectedMessengerId,
    required this.tagId,
    required this.userId,
  })  : _pc = pc,
        _selectedMessengerId = selectedMessengerId;

  final Size size;
  final DeeDeeSliderController _pc;
  final String _selectedMessengerId;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      collapsed: const CustomCollapsedWidget(),
      minHeight: size.height * 0.04,
      maxHeight: size.height * 0.5,
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
        userId: userId,
        tagId: tagId,
      ),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
    );
  }
}
