import 'package:flutter/material.dart';

import '../../generated/filter_service.pb.dart';
import './selector_item.dart';

class SelectorList extends StatefulWidget {
  final List<FilterKey> allItems;
  final List<String> selectedItems;
  final void Function(FilterKey title) onTap;

  const SelectorList({
    super.key,
    required this.allItems,
    required this.selectedItems,
    required this.onTap,
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
            horizontal: 16,
            vertical: 16,
          ),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              ...widget.allItems.map(
                (filterKey) => SelectorItem(
                  filterKey: filterKey,
                  onTap: widget.onTap,
                  isSelected: widget.selectedItems.contains(filterKey),
                  icon: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
