import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';

class SelectorItem extends StatefulWidget {
  final String title;
  final void Function(String title) onTap;
  final bool isSelected;
  final bool icon;

  const SelectorItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
    required this.icon
  });

  @override
  State<SelectorItem> createState() => _SelectorItemState();
}

class _SelectorItemState extends State<SelectorItem> {

  @override
  Widget build(BuildContext context) {
    return ActionChip(
        label: widget.isSelected && widget.icon
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check,
                    size: 18.0,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(widget.title),
                ],
              )
            : Text(widget.title),
        elevation: widget.isSelected ? 0 : 3,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        backgroundColor: widget.isSelected
            ? const Color(COLOR_PRIMARY)
            : const Color(CHIPS_COLOR_WHITE),
        labelStyle: widget.isSelected
            ? const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0)
            : const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        shadowColor: const Color(CHIPS_SHADOW_COLOR),
        onPressed: () => widget.onTap(widget.title)
        );
  }

}
