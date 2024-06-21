// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class GlobalThemData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 25.0,
          color: lightColorScheme.primary,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
        headlineMedium: TextStyle(
          fontSize: 20.0,
          color: lightColorScheme.primary,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
        headlineSmall: TextStyle(
          fontSize: 15.0,
          color: lightColorScheme.primary,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
        bodyLarge: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
        bodyMedium: TextStyle(
          fontSize: 10.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
        bodySmall: TextStyle(
          fontSize: 8.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
        labelLarge: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
        labelMedium: TextStyle(
          fontSize: 10.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
        labelSmall: TextStyle(
          fontSize: 8.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          height: 1.5,
        ),
        displayLarge: TextStyle(
          fontSize: 15.0,
          color: lightColorScheme.secondary,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
        displayMedium: TextStyle(
          fontSize: 12.0,
          color: lightColorScheme.secondary,
          fontWeight: FontWeight.bold,
          height: 1.5,
        ),
        displaySmall: TextStyle(
          fontSize: 8.0,
          color: lightColorScheme.secondary,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(lightColorScheme.primary),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: lightColorScheme.primary,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(lightColorScheme.secondary),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(150, 50),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(lightColorScheme.secondary),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color.fromRGBO(37, 60, 89, 1),
    onPrimary: Colors.white,
    secondary: Color.fromRGBO(45, 75, 115, 1),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Color(0xFFFFFFFF),
    surface: Colors.white,
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
}
