import 'package:flutter/material.dart';

abstract class AppTextTheme {
  static const titleLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 22,
    color: Color(0xFF1A1A1B),
  );
  static const bodyLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.5,
    color: Color(0xFF1A1A1B),
  );
  static const labelMedium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 0.5,
    color: Color(0xFF717D96),
  );
}
