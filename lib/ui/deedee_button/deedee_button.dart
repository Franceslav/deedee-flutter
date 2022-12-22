import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeeDeeButton extends StatelessWidget {
  late String title;
  late VoidCallback onPressed;

  DeeDeeButton(this.title, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(COLOR_PRIMARY),
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: const BorderSide(
              color: Color(COLOR_PRIMARY),
            ),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
