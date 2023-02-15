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
    //text style for DrawerHeader
    headline2: TextStyle(
      fontSize: 20,
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
    ),
    //text style for DrawerHeader
    subtitle2: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 16,
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  snackBarTheme:
      const SnackBarThemeData(contentTextStyle: TextStyle(color: Colors.white)),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(COLOR_PRIMARY),
    secondary: const Color(COLOR_PRIMARY),
    onPrimary: Colors.white,
    onSurface: const Color(COLOR_PRIMARY).withOpacity(0.6),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(COLOR_PRIMARY),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color(COLOR_PRIMARY),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  ),
  sliderTheme: SliderThemeData(
      thumbColor: const Color(COLOR_PRIMARY),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
      trackHeight: 10,
      activeTrackColor: const Color(COLOR_PRIMARY).withOpacity(0.8),
      inactiveTrackColor: const Color(COLOR_PRIMARY).withOpacity(0.4),
      inactiveTickMarkColor: Colors.black,
      valueIndicatorColor: const Color(COLOR_PRIMARY),
      valueIndicatorTextStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )),
);
