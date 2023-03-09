import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DeeDeeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final PanelController controller;

  DeeDeeAppBar({
    required this.title,
    required this.controller,
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: ProfilePhotoWithBadge(),
          ),
        )
      ],
    );
  }
}
