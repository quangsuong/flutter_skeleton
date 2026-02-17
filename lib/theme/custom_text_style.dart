import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get urbanist {
    return copyWith(
      fontFamily: 'Urbanist',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.

/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text styles
  static TextStyle get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16.fSize,
      );

  static TextStyle get bodyLargeGray500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray500,
      );

  static TextStyle get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
        fontSize: 16.fSize,
      );

  static TextStyle get bodyLargeRedA70001 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.redA70001,
      );

  static TextStyle get bodyMediumGray400 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray400,
      );

  // Display text styles
  static TextStyle get displayMediumGray900 =>
      theme.textTheme.displayMedium!.copyWith(
        color: appTheme.gray900,
      );

  static TextStyle get displayMediumGray90040 =>
      theme.textTheme.displayMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 40.fSize,
      );

  static TextStyle get displayMediumGray90040_1 =>
      theme.textTheme.displayMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 40.fSize,
      );

  static TextStyle get displayMediumRedA70001 =>
      theme.textTheme.displayMedium!.copyWith(
        color: appTheme.redA70001,
      );
  // Headline text style
  static TextStyle get headlineLargeRedA70001 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.redA70001,
      );

  static TextStyle get headlineLargeWhiteA700 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.whiteA700,
      );

  static TextStyle get headlineSmallGreen500 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.green500,
      );

  static TextStyle get headlineSmallPrimary =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
      );

  static TextStyle get headlineSmallPrimary_1 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
      );

  static TextStyle get headlineSmallRedA70001 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.redA70001,
      );

  static TextStyle get headlineSmallRedA70001_1 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.redA70001,
      );

  static TextStyle get headlineSmallWhiteA700 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.whiteA700,
      );

// Label text style

  static TextStyle get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelMediumRedA70001 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.redA70001,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelMediumWhiteA700 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
      );

  static TextStyle get titleLargePrimary =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static TextStyle get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
      );

  static TextStyle get titleMediumGray100 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray100,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumGray500 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumGray600 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumGray700 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumGray700SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumMedium =>
      theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumMedium16 =>
      theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumMedium_1 =>
      theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumPrimary =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumPrimary16 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
      );

  static TextStyle get titleMediumPrimaryMedium =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumPrimaryMedium16 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumPrimarySemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumPrimarySemiBold_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumPrimary_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static TextStyle get titleMediumRedA200 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA200,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumRedA70001 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA70001,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumRedA7000116 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA70001,
        fontSize: 16.fSize,
      );

  static TextStyle get titleMediumRedA70001Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA70001,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumRedA70001SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA70001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumRedA70001SemiBold16 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA70001,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumSemiBold16 =>
      theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumWhiteA700 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumWhiteA70016 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16.fSize,
      );

  static TextStyle get titleMediumWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumWhiteA700_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );

  static get titleMedium_1 => theme.textTheme.titleMedium!;

  static TextStyle get titleSmallGray600 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
      );

  static TextStyle get titleSmallGray700 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray700,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallGray700_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray700,
      );

  static TextStyle get titleSmallPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallRedA70001 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.redA70001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallSemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallWhiteA700 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );

// Urbanist text style
  static TextStyle get urbanistGray900 => TextStyle(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      ).urbanist;
}
