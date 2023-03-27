import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

//light
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryBottomSheetColor =
      Color.fromARGB(255, 20, 20, 20);
  static const Color _lightOnPrimaryColor = Color.fromARGB(255, 95, 95, 95);
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _lightTextColorSecondary = Color.fromARGB(255, 61, 61, 61);
  static const Color _appbarColorLight = Colors.transparent;
  static const Color _bottomappbarColorLight = Colors.grey;

//dark
  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryBottomSheetColor =
      Color.fromARGB(255, 20, 20, 20);
  static const Color _darkOnPrimaryColor = Color.fromARGB(255, 44, 44, 44);
  static const Color _darkTextColorPrimary = Colors.white;
  static const Color _darkTextColorSecondary =
      Color.fromARGB(255, 109, 109, 109);
  static const Color _appbarColorDark = Colors.transparent;
  static const Color _bottomappbarColorDark = Color.fromARGB(255, 75, 75, 75);

  // light //

  static const TextStyle _lightPageHeading = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Tenorite",
      fontSize: 30,
      fontWeight: FontWeight.bold);

  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary,
      fontSize: 22,
      fontFamily: "Tenorite",
      fontWeight: FontWeight.bold);

  static const TextStyle _lightHeading2Text = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Tenorite",
    fontSize: 22,
  );

  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Tenorite",
    fontSize: 16,
  );

  static const TextStyle _lightBodyText2 = TextStyle(
    color: _lightTextColorSecondary,
    fontFamily: "Tenorite",
    fontSize: 20,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightPageHeading,
    displayMedium: _lightHeadingText,
    displaySmall: _lightHeading2Text,
    bodyLarge: _lightBodyText,
    bodyMedium: _lightBodyText2,
  );

  // Dark //

  static final TextStyle _darkPageHeading =
      _lightPageHeading.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkHeadingText =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkHeading2Text = _lightHeading2Text.copyWith(
    color: _darkTextColorPrimary,
  );

  static final TextStyle _darkBodyText =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkBodyText2 =
      _lightBodyText.copyWith(color: _darkTextColorSecondary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkPageHeading,
    displayMedium: _darkHeadingText,
    displaySmall: _darkHeading2Text,
    bodyLarge: _darkBodyText,
    bodyMedium: _darkBodyText2,
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
          primaryContainer: _lightPrimaryBottomSheetColor),
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
        primaryContainer: _darkPrimaryBottomSheetColor,
      ),
      textTheme: _darkTextTheme);
}
