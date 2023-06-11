import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:flutter/material.dart';

class DeeDeeRowInfoMyTagWidget extends StatefulWidget {
  final Tag tag;
  final Text mainText;
  final Text secondaryText;
  final Widget icon;
  final void Function()? onTap;

  const DeeDeeRowInfoMyTagWidget({
    Key? key,
    required this.tag,
    required this.mainText,
    required this.secondaryText,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DeeDeeRowInfoMyTagWidget> createState() =>
      _DeeDeeRowInfoMyTagWidgetState();
}

class _DeeDeeRowInfoMyTagWidgetState extends State<DeeDeeRowInfoMyTagWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: const Color(0xFFF8F4FE),
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onTap,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              widget.icon,
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.mainText,
                    widget.secondaryText,
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text('${widget.tag.observations.length}'),
              const SizedBox(
                width: 8,
              ),
              const Text('5'),
              const Icon(
                Icons.arrow_upward,
                size: 23,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
