import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:flutter/material.dart';

import './selector_item.dart';

class SelectorAppBar extends StatefulWidget {
  final List<FilterKey> allItems;
  final List<FilterKey> selectedItems;
  final void Function(FilterKey filterKey) onTap;

  const SelectorAppBar({
    super.key,
    required this.allItems,
    required this.selectedItems,
    required this.onTap,
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
              ...widget.allItems.map((filterKey) => SelectorItem(
                    filterKey: filterKey,
                    onTap: widget.onTap,
                    isSelected: widget.selectedItems.contains(filterKey),
                    icon: false,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
