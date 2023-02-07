import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final void Function() onTap;

  const DrawerButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      leading: Transform.rotate(
        angle: 0,
        child: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }
}
