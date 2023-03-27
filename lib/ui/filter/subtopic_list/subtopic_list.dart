import 'package:deedee/ui/filter/filter_page_bloc.dart';
import 'package:deedee/ui/filter/subtopic_list/subtopic_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubtopicList extends StatefulWidget {
  final List<String> subtopics;
  final String selectedSubtopic;

  const SubtopicList(
      {super.key, required this.subtopics, required this.selectedSubtopic});

  @override
  State<SubtopicList> createState() => _SubtopicListState();
}

class _SubtopicListState extends State<SubtopicList> {
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
              widget.subtopics.length,
              (int index) {
                return SubtopicChip(
                  chipTitle: widget.subtopics[index],
                  selected: widget.subtopics[index] == widget.selectedSubtopic,
                  onSelected: (isChecked, selectedSubtopic) {
                    if (!isChecked) {
                      selectedSubtopic = '';
                    }
                    context.read<FilterPageBloc>().add(
                        FilterPageChipSelectedEvent(
                            selectedSubtopic, const []));
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
