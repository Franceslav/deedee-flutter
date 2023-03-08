import 'package:deedee/ui/global_widgets/genaral_sliding_panel/general_sliding_panel_item.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GeneralSlidingPanel extends StatelessWidget {
  final List<GeneralSlidingPanelItem> generalSlidingPanelItemList;
  final PanelController _controller;

  const GeneralSlidingPanel({
    super.key,
    required PanelController controller,
    required this.generalSlidingPanelItemList,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height * 0.77,
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
          child: Column(
            children: generalSlidingPanelItemList,
          ),
        ),
      ),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
    );
  }
}
