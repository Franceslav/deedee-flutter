import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';

class SubtopicChip extends StatefulWidget {
  final String chipTitle;
  Function(bool, String) onSelected;

  SubtopicChip(
      {super.key,
      required this.chipTitle,
      required this.onSelected});

  @override
  State<SubtopicChip> createState() => _SubtopicChipState();
}

class _SubtopicChipState extends State<SubtopicChip> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipTitle),
      checkmarkColor: Colors.white,
      elevation: _isSelected ? 0 : 3,
      selected: _isSelected,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      selectedColor: const Color(COLOR_PRIMARY),
      backgroundColor: const Color(CHIPS_COLOR_WHITE),
      labelStyle: _isSelected
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
