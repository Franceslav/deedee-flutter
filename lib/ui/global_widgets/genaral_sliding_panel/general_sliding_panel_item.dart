import 'package:flutter/material.dart';

class GeneralSlidingPanelItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;

  const GeneralSlidingPanelItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(color: Colors.black,),
      ),
      leading: Transform.rotate(
        angle: 0,
        child: Icon(
          icon,
          color: Colors.black,
          size: 24,

        ),

      ),
      onTap: onTap,
    );
  }
}
