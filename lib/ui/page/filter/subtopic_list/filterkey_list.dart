import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'filterkey_chip.dart';

class FilterKeyList extends StatefulWidget {
  final String subtopic;
  final List<String> filterKeys;

  FilterKeyList(
      {super.key,
      required this.subtopic,
      required this.filterKeys,});

  @override
  State<FilterKeyList> createState() => _FilterKeyListState();
}

class _FilterKeyListState extends State<FilterKeyList> {

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
                    subtopic: widget.subtopic);
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
