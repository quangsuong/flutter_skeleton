import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecorations {
  // Fill decorations

  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );

  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA70001,
      );

  // Gradients decorations

  static BoxDecoration get gradientsGradientOrange => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 1),
          end: Alignment(0, 0),
          colors: [appTheme.orangeA400, appTheme.orangeA200],
        ),
      );

  static BoxDecoration get gradientsGradientBlue => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 1),
          end: Alignment(0, 0),
          colors: [appTheme.indigoA400, appTheme.indigoA200],
        ),
      );

  static BoxDecoration get gradientsGradientGreen => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 1),
          end: Alignment(0, 0),
          colors: [appTheme.red700, appTheme.redA70001],
        ),
      );

  static BoxDecoration get gradientsGradientPurple => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 1),
          end: Alignment(0, 0),
          colors: [appTheme.purpleA700, appTheme.deepPurpleA200],
        ),
      );

  static BoxDecoration get gradientsGradientRed => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 1),
          end: Alignment(0, 0),
          colors: [appTheme.redA20001, appTheme.pinkA100],
        ),
      );

  static BoxDecoration get gradientsGradientYellow => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 1),
          end: Alignment(0, 0),
          colors: [appTheme.amber500, appTheme.amber100],
        ),
      );

// Greyscale decorations
  static BoxDecoration get greyscale100 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray100,
          width: 1.h,
        ),
      );

  static BoxDecoration get greyscale100OthersWhite => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray100,
          width: 1.h,
        ),
      );

  static BoxDecoration get greyscale100TransparentRed => BoxDecoration(
        color: appTheme.redA200.withOpacity(0.08),
        border: Border.all(
          color: appTheme.gray100,
          width: 1.h,
        ),
      );

  static BoxDecoration get greyscale200 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.blueGray10001,
          width: 1.h,
        ),
      );

// Others decorations
  static BoxDecoration get othersBrown => BoxDecoration(
        color: appTheme.gray70001,
      );

  static BoxDecoration get othersTeal => BoxDecoration(
        color: appTheme.teal500,
      );

  static BoxDecoration get othersWhite => BoxDecoration(
        color: appTheme.whiteA700,
      );

  static BoxDecoration get othersWhiteCardShadow2 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(0, 1),
          )
        ],
      );

// Primary decorations
  static BoxDecoration get primary500 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.redA70001,
          width: 3.h,
        ),
      );

// Transparent decorations
  static BoxDecoration get transparentGreen => BoxDecoration(
        color: appTheme.gray5002,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );

  static BorderRadius get circleBorder70 => BorderRadius.circular(
        70.h,
      );

  static BorderRadius get circleBorder80 => BorderRadius.circular(
        80.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL32 => BorderRadius.vertical(
        top: Radius.circular(32.h),
      );

  static BorderRadius get customBorderTL40 => BorderRadius.vertical(
        top: Radius.circular(40.h),
      );

  static BorderRadius get customBorderTL60 => BorderRadius.vertical(
        top: Radius.circular(60.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );

  static BorderRadius get roundedBorder124 => BorderRadius.circular(
        124.h,
      );

  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );

  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );

  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );

  static BorderRadius get roundedBorder28 => BorderRadius.circular(
        28.h,
      );

  static BorderRadius get roundedBorder32 => BorderRadius.circular(
        32.h,
      );

  static BorderRadius get roundedBorder48 => BorderRadius.circular(
        48.h,
      );

  static BorderRadius get roundedBorder92 => BorderRadius.circular(
        92.h,
      );
}
