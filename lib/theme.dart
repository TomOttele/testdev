import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

//light
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Color.fromRGBO(255, 152, 0, 1);
  static const Color _lightOnPrimaryColor = Color.fromARGB(255, 221, 221, 221);
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.transparent;
  static const Color _bottomappbarColorLight = Colors.grey;

//dark
  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryVariantColor = Colors.yellow;
  static const Color _darkOnPrimaryColor = Color.fromARGB(255, 44, 44, 44);
  static const Color _darkTextColorPrimary = Colors.white;
  static const Color _appbarColorDark = Colors.transparent;
  static const Color _bottomappbarColorDark = Color.fromARGB(255, 14, 14, 14);

  // light //

  static const TextStyle _lightPageHeading = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontSize: 30,
      fontWeight: FontWeight.bold);

  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary, fontSize: 25, fontFamily: "Rubik");

  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontSize: 20,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _lightPageHeading,
    headline2: _lightHeadingText,
    bodyText1: _lightBodyText,
  );

  // Dark //

  static const TextStyle _darkPageHeading = TextStyle(
      color: _darkTextColorPrimary,
      fontFamily: "Rubik",
      fontSize: 30,
      fontWeight: FontWeight.bold);

  static final TextStyle _darkThemeHeadingText =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyText =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkPageHeading,
    headline2: _darkThemeHeadingText,
    bodyText1: _darkThemeBodyText,
  );

  // Scaffold light //

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
          color: _appbarColorLight,
          iconTheme: IconThemeData(color: Colors.black)),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: _bottomappbarColorLight,
      ),
      colorScheme: const ColorScheme.light(
          primary: _lightPrimaryColor,
          onPrimary: _lightOnPrimaryColor,
          primaryContainer: _lightPrimaryVariantColor),
      textTheme: _lightTextTheme);

//Scaffold dark//

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: const AppBarTheme(
          color: _appbarColorDark,
          iconTheme: IconThemeData(color: Colors.white)),
      bottomAppBarTheme: const BottomAppBarTheme(color: _bottomappbarColorDark),
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimaryColor,
        onPrimary: _darkOnPrimaryColor,
        primaryContainer: _darkPrimaryVariantColor,
      ),
      textTheme: _darkTextTheme);
}
