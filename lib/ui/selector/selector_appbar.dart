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
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              ...widget.data.map((title) => SelectorItem(
                    title: title,
                    onTap: widget.onTap,
                    isSelected: widget.selectedItems.contains(title),
                    icon: false,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
