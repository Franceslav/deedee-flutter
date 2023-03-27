import 'package:deedee/ui/filter/filter_page_bloc.dart';
import 'package:deedee/ui/filter/subtopic_list/filterkey_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterKeyList extends StatefulWidget {
  final String subtopic;
  final List<String> filterKeys;
  final List<String> selectedFilterKeys;

  FilterKeyList(
      {super.key,
      required this.subtopic,
      required this.filterKeys,
      required this.selectedFilterKeys});

  @override
  State<FilterKeyList> createState() => _FilterKeyListState();
}

class _FilterKeyListState extends State<FilterKeyList> {

  late List<String> _selectedFilterKeys = List.of(widget.selectedFilterKeys);

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
                  selected: widget.selectedFilterKeys
                      .contains(widget.filterKeys[index]),
                  onSelected: (isChecked, filterKey) {
                    // if (isChecked) {
                    isChecked ?
                    _selectedFilterKeys.add(filterKey):
                    _selectedFilterKeys.remove(filterKey);
/*                      if (!selectedItems.contains(filterKey)) {
                        selectedItems.add(filterKey);
                      }*/
                    // } else {
/*                      if (selectedItems.contains(filterKey)) {
                        selectedItems.remove(filterKey);
                      }*/
                    // }
                    context.read<FilterPageBloc>().add(
                        FilterPageChipSelectedEvent(
                            widget.subtopic, _selectedFilterKeys));
                  },
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
