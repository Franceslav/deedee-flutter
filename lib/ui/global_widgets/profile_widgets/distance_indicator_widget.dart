import 'package:flutter/material.dart';

class DistanceIndicatorWidget extends StatefulWidget {
  final String distence;
  final String distenceUnit;

  const DistanceIndicatorWidget({super.key,
    required this.distence, required this.distenceUnit});

  @override
  State<DistanceIndicatorWidget> createState() => _DistanceIndicatorWidgetState();
}

class _DistanceIndicatorWidgetState extends State<DistanceIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
            Text(widget.distence),
            Text(widget.distenceUnit)
        ],
      ),
    );
  }
}
