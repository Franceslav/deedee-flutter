import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';

class DeeDeeButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool gradientButton;
  final double borderRadius = 12.0;

  const DeeDeeButton(
      {required this.title,
      required this.onPressed,
      required this.gradientButton,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(GRADIENT_COLOR_START), Color(GRADIENT_COLOR_END)]),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  gradientButton ? Colors.transparent : Colors.white,
              disabledBackgroundColor: const Color(BASIC_GREY_COLOR),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: (gradientButton)
                      ? const BorderSide(color: Colors.transparent)
                      : const BorderSide(color: Colors.black, width: 0.0))),
          onPressed: onPressed,
          child: Text(title,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: gradientButton
                      ? Colors.white
                      : const Color(BASIC_GREY_COLOR))),
        ),
      ),
    );
  }
}
