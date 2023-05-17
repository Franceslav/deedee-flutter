import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DeeDeeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final PanelController controller;
  final Widget? child;

  DeeDeeAppBar({
    required this.title,
    required this.controller,
    required this.child,
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: const Color(APPBAR_SHADOW_COLOR),
      title: Text(title),
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
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: child,
          ),
        )
      ],
    );
  }
}
