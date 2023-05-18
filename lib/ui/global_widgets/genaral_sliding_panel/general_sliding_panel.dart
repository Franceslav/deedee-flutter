import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GeneralSlidingPanel extends StatelessWidget {
  final List<Widget> generalSlidingPanelItemList;
  final PanelController _controller;
  final double maxHeight;

  const GeneralSlidingPanel({
    super.key,
    required this.maxHeight,
    required PanelController controller,
    required this.generalSlidingPanelItemList,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      minHeight: 0,
      maxHeight: maxHeight,
      controller: _controller,
      header: Container(
        margin: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width / 2 - 30, 10.0, 24.0, 0.0),
        width: 60,
        height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,
        ),
      ),
      panel: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: SingleChildScrollView(
            child: Column(
              children: generalSlidingPanelItemList,
            ),
          ),
        ),
      ),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
    );
  }
}
