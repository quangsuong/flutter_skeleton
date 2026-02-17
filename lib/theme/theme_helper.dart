import 'package:flutter/material.dart';
import '../core/app_export.dart';

CodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  var _isDarkMode = StorageUtil.loadTheme();

  // A map of custom color themes supported by the app
  Map<String, CodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
    'darkCode': DarkCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
    'darkCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  CodeColors _getThemeColors() {
    return _supportedCustomColor[_isDarkMode ? 'darkCode' : 'lightCode'] ??
        CodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_isDarkMode ? 'darkCode' : 'lightCode'] ??
            ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            width: 2,
            color: colorScheme.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray10001,
      ),
    );
  }

  CodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 18.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray500,
          fontSize: 14.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 12.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 48.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 32.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 24.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray700,
          fontSize: 12.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.gray500,
          fontSize: 10.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 20.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.gray900,
          fontSize: 18.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 14.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w500,
        ),
      );
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF246BFD),
    primaryContainer: Color(0XFFD8E2FF),
    secondary: Color(0XFF6200EE),
    secondaryContainer: Color(0XFFE8E0FF),
    tertiary: Color(0XFF009688),
    tertiaryContainer: Color(0XFFF0F9F9),
    error: Color(0XFFE31D1C),
    errorContainer: Color(0XFFF2F2F2),
    onPrimary: Color(0XFFFFFF),
    onPrimaryContainer: Color(0XFF003087),
    onSecondary: Color(0XFFFFFF),
    onSecondaryContainer: Color(0XFF003087),
    onTertiary: Color(0XFF00363F),
    onTertiaryContainer: Color(0XFF003087),
    onError: Color(0XFF000000),
    onErrorContainer: Color(0XFF00363F),
    background: Color(0XFFFFFFFF),
    onBackground: Color(0XFF1C1B1F),
    surface: Color(0XFFFFFFFF),
    onSurface: Color(0XFF1C1B1F),
    surfaceVariant: Color(0XFFE0E0E0),
    onSurfaceVariant: Color(0XFF49454F),
    outline: Color(0XFF79747E),
    onInverseSurface: Color(0XFFF6F4F6),
    inverseSurface: Color(0XFF313036),
    inversePrimary: Color(0XFF003087),
    shadow: Color(0XFF000000),
  );
}

class CodeColors{
  // Amber
  Color get amber500 => Color(0XFFFFCC15);

  Color get amber50001 => Color(0XFFFFB905);

  Color get amber100 => Color(0XFFFFE57F);

  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blueA200 => Color(0XFF4285F4);

  // BlueGray
  Color get blueGray100 => Color(0XFFCCCCCC);

  Color get blueGray10001 => Color(0XFFCBCBCB);

  Color get blueGray50 => Color(0XFFF1F1F1);

  Color get blueGray600 => Color(0XFF575A89);

  Color get blueGray800 => Color(0XFF3F3D56);

  Color get blueGray900 => Color(0XFF2F2E41);

  // DeepOrange
  Color get deepOrange100 => Color(0XFFFFB6B6);

  Color get deepOrange10001 => Color(0XFFFFB7B7);

  Color get deepOrange10002 => Color(0XFFFBBEBE);

  // DeepPurple
  Color get deepPurpleA200 => Color(0XFFAE48FF);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);

  Color get gray300 => Color(0XFFE6E6E6);

  Color get gray400 => Color(0XFFBDBDBD);

  Color get gray50 => Color(0XFFF9F9F9);

  Color get gray500 => Color(0XFF9E9E9E);

  Color get gray50001 => Color(0XFFA8A8A8);

  Color get gray5001 => Color(0XFFF7FCFF);

  Color get gray5002 => Color(0XFFFFF6F6);

  Color get gray5003 => Color(0XFFF6F8FB);

  Color get gray600 => Color(0XFF757575);

  Color get gray700 => Color(0XFF616161);

  Color get gray900 => Color(0XFF212121);

  // Gray

  Color get gray70001 => Color(0xFF7A5548);

// Green
  Color get green300 => Color(0XFF6ADA92);

  Color get green500 => Color(0XFF38CD6D);

  Color get green600 => Color(0XFF34A853);

// Indigo
  Color get indigo700 => Color(0XFF2E42A4);

  Color get indigo900 => Color(0XFF012169);

  Color get indigoA200 => Color(0XFF5E81FF);

  Color get indigoA400 => Color(0XFF335EF7);

// LightBlue
  Color get lightBlue600 => Color(0XFF009CDE);

// Orange
  Color get orangeA200 => Color(0XFFFFAB38);

  Color get orangeA400 => Color(0XFFF9B400);

  Color get orangeA700 => Color(0XFFFF5F00);

// Pink
  Color get pink300 => Color(0XFFFF6584);

  Color get pinkA100 => Color(0XFFFF8A9B);

// Purple
  Color get purpleA700 => Color(0XFF9610FF);

// Red
  Color get red500 => Color(0XFFEBE435);

  Color get red700 => Color(0XFFBE4040);

  Color get red70001 => Color(0XFFBE4240);

  Color get redA200 => Color(0XFFFF5555);

  Color get redA20001 => Color(0XFFFF4D67);

  Color get redA700 => Color(0XFFEB001B);

  Color get redA70001 => Color(0XFFE10606);

// Teal
  Color get teal500 => Color(0XFF009689);

// White
  Color get whiteA700 => Color(0XFFFFFFFF);

// Yellow
  Color get yellow600 => Color(0XFFFFD037);

  Color get yellow800 => Color(0XFFF79E1B);
}
class LightCodeColors extends CodeColors {
  // Amber
  Color get amber500 => Color(0XFFFFCC15);

  Color get amber50001 => Color(0XFFFFB905);

  Color get amber100 => Color(0XFFFFE57F);

  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blueA200 => Color(0XFF4285F4);

  // BlueGray
  Color get blueGray100 => Color(0XFFCCCCCC);

  Color get blueGray10001 => Color(0XFFCBCBCB);

  Color get blueGray50 => Color(0XFFF1F1F1);

  Color get blueGray600 => Color(0XFF575A89);

  Color get blueGray800 => Color(0XFF3F3D56);

  Color get blueGray900 => Color(0XFF2F2E41);

  // DeepOrange
  Color get deepOrange100 => Color(0XFFFFB6B6);

  Color get deepOrange10001 => Color(0XFFFFB7B7);

  Color get deepOrange10002 => Color(0XFFFBBEBE);

  // DeepPurple
  Color get deepPurpleA200 => Color(0XFFAE48FF);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);

  Color get gray300 => Color(0XFFE6E6E6);

  Color get gray400 => Color(0XFFBDBDBD);

  Color get gray50 => Color(0XFFF9F9F9);

  Color get gray500 => Color(0XFF9E9E9E);

  Color get gray50001 => Color(0XFFA8A8A8);

  Color get gray5001 => Color(0XFFF7FCFF);

  Color get gray5002 => Color(0XFFFFF6F6);

  Color get gray5003 => Color(0XFFF6F8FB);

  Color get gray600 => Color(0XFF757575);

  Color get gray700 => Color(0XFF616161);

  Color get gray900 => Color(0XFF212121);

  // Gray

  Color get gray70001 => Color(0xFF7A5548);

// Green
  Color get green300 => Color(0XFF6ADA92);

  Color get green500 => Color(0XFF38CD6D);

  Color get green600 => Color(0XFF34A853);

// Indigo
  Color get indigo700 => Color(0XFF2E42A4);

  Color get indigo900 => Color(0XFF012169);

  Color get indigoA200 => Color(0XFF5E81FF);

  Color get indigoA400 => Color(0XFF335EF7);

// LightBlue
  Color get lightBlue600 => Color(0XFF009CDE);

// Orange
  Color get orangeA200 => Color(0XFFFFAB38);

  Color get orangeA400 => Color(0XFFF9B400);

  Color get orangeA700 => Color(0XFFFF5F00);

// Pink
  Color get pink300 => Color(0XFFFF6584);

  Color get pinkA100 => Color(0XFFFF8A9B);

// Purple
  Color get purpleA700 => Color(0XFF9610FF);

// Red
  Color get red500 => Color(0XFFEBE435);

  Color get red700 => Color(0XFFBE4040);

  Color get red70001 => Color(0XFFBE4240);

  Color get redA200 => Color(0XFFFF5555);

  Color get redA20001 => Color(0XFFFF4D67);

  Color get redA700 => Color(0XFFEB001B);

  Color get redA70001 => Color(0XFFE10606);

// Teal
  Color get teal500 => Color(0XFF009689);

// White
  Color get whiteA700 => Color(0XFFFFFFFF);

// Yellow
  Color get yellow600 => Color(0XFFFFD037);

  Color get yellow800 => Color(0XFFF79E1B);
}
class DarkCodeColors extends CodeColors {
  // Amber
  Color get amber500 => Color(0XFFFFCC15);

  Color get amber50001 => Color(0XFFFFB905);

  Color get amber100 => Color(0XFFFFE57F);

  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blueA200 => Color(0XFF4285F4);

  // BlueGray
  Color get blueGray100 => Color(0XFFCCCCCC);

  Color get blueGray10001 => Color(0XFFCBCBCB);

  Color get blueGray50 => Color(0XFFF1F1F1);

  Color get blueGray600 => Color(0XFF575A89);

  Color get blueGray800 => Color(0XFF3F3D56);

  Color get blueGray900 => Color(0XFF2F2E41);

  // DeepOrange
  Color get deepOrange100 => Color(0XFFFFB6B6);

  Color get deepOrange10001 => Color(0XFFFFB7B7);

  Color get deepOrange10002 => Color(0XFFFBBEBE);

  // DeepPurple
  Color get deepPurpleA200 => Color(0XFFAE48FF);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);

  Color get gray300 => Color(0XFFE6E6E6);

  Color get gray400 => Color(0XFFBDBDBD);

  Color get gray50 => Color(0XFFF9F9F9);

  Color get gray500 => Color(0XFF9E9E9E);

  Color get gray50001 => Color(0XFFA8A8A8);

  Color get gray5001 => Color(0XFFF7FCFF);

  Color get gray5002 => Color(0XFFFFF6F6);

  Color get gray5003 => Color(0XFFF6F8FB);

  Color get gray600 => Color(0XFF757575);

  Color get gray700 => Color(0XFF616161);

  Color get gray900 => Color(0XFF212121);

  // Gray

  Color get gray70001 => Color(0xFF7A5548);

// Green
  Color get green300 => Color(0XFF6ADA92);

  Color get green500 => Color(0XFF38CD6D);

  Color get green600 => Color(0XFF34A853);

// Indigo
  Color get indigo700 => Color(0XFF2E42A4);

  Color get indigo900 => Color(0XFF012169);

  Color get indigoA200 => Color(0XFF5E81FF);

  Color get indigoA400 => Color(0XFF335EF7);

// LightBlue
  Color get lightBlue600 => Color(0XFF009CDE);

// Orange
  Color get orangeA200 => Color(0XFFFFAB38);

  Color get orangeA400 => Color(0XFFF9B400);

  Color get orangeA700 => Color(0XFFFF5F00);

// Pink
  Color get pink300 => Color(0XFFFF6584);

  Color get pinkA100 => Color(0XFFFF8A9B);

// Purple
  Color get purpleA700 => Color(0XFF9610FF);

// Red
  Color get red500 => Color(0XFFEBE435);

  Color get red700 => Color(0XFFBE4040);

  Color get red70001 => Color(0XFFBE4240);

  Color get redA200 => Color(0XFFFF5555);

  Color get redA20001 => Color(0XFFFF4D67);

  Color get redA700 => Color(0XFFEB001B);

  Color get redA70001 => Color(0XFFE10606);

// Teal
  Color get teal500 => Color(0XFF009689);

// White
  Color get whiteA700 => Color(0XFFFFFFFF);

// Yellow
  Color get yellow600 => Color(0XFFFFD037);

  Color get yellow800 => Color(0XFFF79E1B);
}
