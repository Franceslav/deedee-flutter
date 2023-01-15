import 'package:flutter/material.dart';

import './selector_item.dart';

class SelectorList extends StatefulWidget {
  final List<String> data;
  final void Function(String title) onTap;
  final List<String> selectedItems;

  const SelectorList({
    super.key,
    required this.data,
    required this.onTap,
    required this.selectedItems,
  });

  @override
  State<SelectorList> createState() => _SelectorListState();
}

class _SelectorListState extends State<SelectorList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          child: Wrap(
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
        ),
      ],
    );
  }
}
