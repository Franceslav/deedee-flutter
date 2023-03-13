import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/main_topic/main_topic_custom_toggle.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DeeDeeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final PanelController controller;
  final Widget child;

  DeeDeeAppBar({
    required this.controller,
    required this.child,
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const CustomToggleButton(),
      actions: [
        GestureDetector(
          onTap: () {
            if (controller.isPanelOpen) {
              controller.close();
            }
            if (controller.isPanelClosed) {
              controller.open();
            }
          },
          child:  Padding(
            padding: const EdgeInsets.all(5),
            child: child,
          ),
        )
      ],
    );
  }
}
