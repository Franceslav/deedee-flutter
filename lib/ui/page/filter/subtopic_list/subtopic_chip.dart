import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';

class SubtopicChip extends StatefulWidget {
  final String chipTitle;
  final Function(bool, String) onSelected;
  final bool isSelected;

  const SubtopicChip({
    super.key,
    required this.chipTitle,
    required this.onSelected,
    required this.isSelected,
  });

  @override
  State<SubtopicChip> createState() => _SubtopicChipState();
}

class _SubtopicChipState extends State<SubtopicChip> {


  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipTitle),
      checkmarkColor: Colors.white,
      elevation:widget. isSelected ? 0 : 3,
      selected:widget.isSelected,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      selectedColor: const Color(COLOR_PRIMARY),
      backgroundColor: const Color(CHIPS_COLOR_WHITE),
      labelStyle:widget. isSelected
          ? const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.0)
          : const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0),
      onSelected: (isSelected) {
        setState(() {
          widget.onSelected(isSelected, widget.chipTitle);
        });
      },
    );
  }
}
