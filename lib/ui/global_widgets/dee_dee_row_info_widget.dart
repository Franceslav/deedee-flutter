import 'package:flutter/material.dart';

class DeeDeeRowInfoWidget extends StatelessWidget {
  final Text mainText;
  final Text secondaryText;
  final Image icon;

  final void Function()? onTap;
  const DeeDeeRowInfoWidget({
    Key? key,
    required this.mainText,
    required this.secondaryText,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: const Color(0xFFF8F4FE),
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              icon,
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mainText,
                    secondaryText,
                  ],
                ),
              ),
              Image.asset('assets/images/chevron_right_icon.png'),
            ],
          ),
        ),
      ],
    );
  }
}
