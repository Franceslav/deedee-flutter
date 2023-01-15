import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';

ThemeData deeDeeTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
  snackBarTheme:
      const SnackBarThemeData(contentTextStyle: TextStyle(color: Colors.white)),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: const Color(COLOR_PRIMARY)),
);
