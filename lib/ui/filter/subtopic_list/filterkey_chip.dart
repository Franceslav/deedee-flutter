import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';

class FilterKeyChip extends StatefulWidget {
  final String chipTitle;
  final bool selected;
  Function(bool, String) onSelected;

  FilterKeyChip(
      {super.key,
      required this.chipTitle,
      required this.onSelected,
      required this.selected});

  @override
  State<FilterKeyChip> createState() => _FilterKeyChipState();
}

class _FilterKeyChipState extends State<FilterKeyChip> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipTitle),
      elevation: _isSelected ? 0 : 3,
      selected: widget.selected,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      backgroundColor: widget.selected
          ? const Color(COLOR_PRIMARY)
          : const Color(CHIPS_COLOR_WHITE),
      labelStyle: widget.selected
          ? const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.0)
          : const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          widget.onSelected(isSelected, widget.chipTitle);
        });
      },
    );
  }
}
