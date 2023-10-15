import 'package:flutter/material.dart';

abstract class AppTextTheme {
  static const titleLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 22,
    color: Color(0xFF1A1A1B),
  );
  static const titleMedium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: 0.15,
    color: Color(0xFF1A1A1B),
  );
  static const titleNormal = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.5,
    color: Color(0xFF1A1A1B),
  );
  static const bodyLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.5,
    color: Color.fromRGBO(140, 140, 154, 1),
  );
  static const bodyMedium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.25,
    color: Color(0xFF8C8C9A),
  );
  static const labelLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.1,
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
