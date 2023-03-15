import 'package:flutter/material.dart';

import './selector_item.dart';

class SelectorAppBar extends StatefulWidget {
  final List<String> data;
  final void Function(String title) onTap;
  final List<String> selectedItems;

  const SelectorAppBar({
    super.key,
    required this.data,
    required this.onTap,
    required this.selectedItems,
  });

  @override
  State<SelectorAppBar> createState() => _SelectorAppBarState();
}

class _SelectorAppBarState extends State<SelectorAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...widget.data.map(
            (title) => SelectorItem(
              title: title,
              onTap: widget.onTap,
              isSelected: widget.selectedItems.contains(title),
            ),
          ),
        ],
      ),
    );
  }
}
