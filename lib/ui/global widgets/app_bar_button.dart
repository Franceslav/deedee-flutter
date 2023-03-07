import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required PanelController controller,
  }) : _controller = controller;

  final PanelController _controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (_controller.isPanelOpen) {
          _controller.close();
        }
        if (_controller.isPanelClosed) {
          _controller.open();
        }
      },
      icon: const Icon(
        Icons.density_medium,
      ),
    );
  }
}
