import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: primaryColorLight,
    secondary: secondaryColorLight,
    surface: surfaceColorLight,
    background: backgroundColorLight,
    error: errorColorLight,
    onPrimary: onPrimaryColorLight,
    onSecondary: onSecondaryColorLight,
    onSurface: onSurfaceColorLight,
    onBackground: onBackgroundColorLight,
    onError: onErrorColorLight,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColorLight,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.black),
    titleMedium: TextStyle(color: Colors.black),
    titleSmall: TextStyle(color: Colors.black),
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: primaryColorDark,
    secondary: secondaryColorDark,
    surface: surfaceColorDark,
    background: backgroundColorDark,
    error: errorColorDark,
    onPrimary: onPrimaryColorDark,
    onSecondary: onSecondaryColorDark,
    onSurface: onSurfaceColorDark,
    onBackground: onBackgroundColorDark,
    onError: onErrorColorDark,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColorDark,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white),
  ),
);

const Color primaryColorLight = Color(0xFF0F8AE6);
const Color secondaryColorLight = Color(0xFF03DAC6);
const Color backgroundColorLight = Color(0xFFFFFFFF);
const Color surfaceColorLight = Color(0xFFFFFFFF);
const Color errorColorLight = Color(0xFFB00020);
const Color onPrimaryColorLight = Color(0xFFFFFFFF);
const Color onSecondaryColorLight = Color(0xFF000000);
const Color onBackgroundColorLight = Color(0xFF000000);
const Color onSurfaceColorLight = Color(0xFF000000);
const Color onErrorColorLight = Color(0xFFFFFFFF);

const Color primaryColorDark = Color(0xFF0F8AE6);
const Color secondaryColorDark = Color(0xFF03DAC6);
const Color backgroundColorDark = Color(0xFF121212);
const Color surfaceColorDark = Color(0xFF121212);
const Color errorColorDark = Color(0xFFCF6679);
const Color onPrimaryColorDark = Color(0xFF000000);
const Color onSecondaryColorDark = Color(0xFF000000);
const Color onBackgroundColorDark = Color(0xFFFFFFFF);
const Color onSurfaceColorDark = Color(0xFFFFFFFF);
const Color onErrorColorDark = Color(0xFF000000);
