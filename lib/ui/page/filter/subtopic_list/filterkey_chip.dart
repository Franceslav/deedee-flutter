import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../filter_page_bloc.dart';

class FilterKeyChip extends StatefulWidget {
  final String subtopic;
  final String chipTitle;
  final bool isSelected;
  final List<String> filterKeys;

  const FilterKeyChip({
    super.key,
    required this.subtopic,
    required this.chipTitle,
    required this.isSelected,
    required this.filterKeys,
  });

  @override
  State<FilterKeyChip> createState() => _FilterKeyChipState();
}

class _FilterKeyChipState extends State<FilterKeyChip> {

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipTitle),
      checkmarkColor: Colors.white,
      elevation:widget. isSelected ? 0 : 3,
      selected:widget. isSelected,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      selectedColor: const Color(COLOR_PRIMARY),
      backgroundColor: const Color(CHIPS_COLOR_WHITE),
      labelStyle:widget. isSelected
          ? const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.0)
          : const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0),
      onSelected: (isSelected) {
        context.read<FilterPageBloc>().add(FilterPageFilterKeySelectedEvent(
            widget.subtopic, widget.chipTitle));
      },
    );
  }
}
