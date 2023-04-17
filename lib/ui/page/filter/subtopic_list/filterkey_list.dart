import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'filterkey_chip.dart';

class SubtopicFilterKeyList extends StatefulWidget {
  final String subtopic;
  final List<String> filterKeys;
  final List<String> selectedFilterKeys;

  SubtopicFilterKeyList({
    super.key,
    required this.subtopic,
    required this.filterKeys,
    required this.selectedFilterKeys,
  });

  @override
  State<SubtopicFilterKeyList> createState() => _SubtopicFilterKeyListState();
}

class _SubtopicFilterKeyListState extends State<SubtopicFilterKeyList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: List<Widget>.generate(
              widget.filterKeys.length,
              (int index) {
                return FilterKeyChip(
                  chipTitle: widget.filterKeys[index],
                  filterKeys: widget.filterKeys,
                  isSelected: widget.filterKeys.contains(
                      widget.selectedFilterKeys.firstOrNullWhere(
                          (element) => widget.filterKeys[index] == element)),
                  subtopic: widget.subtopic,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
