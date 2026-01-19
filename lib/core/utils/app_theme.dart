import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: TextTheme(
      headlineLarge: AppStyles.semiBold20Black,
      headlineMedium: AppStyles.medium16Black,
      headlineSmall: AppStyles.regular14GrayDark,
      titleLarge: AppStyles.medium18Blue,
      titleMedium: AppStyles.regular16GrayDark,
      titleSmall: AppStyles.regular14Blue,
      labelLarge: AppStyles.medium20White,
      labelMedium: AppStyles.semiBold14white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primaryBlue,
        padding: EdgeInsets.symmetric(vertical: 9),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: TextTheme(
      headlineLarge: AppStyles.semiBold20white,
      headlineMedium: AppStyles.medium16white,
      headlineSmall: AppStyles.regular14GrayLight,
      titleLarge: AppStyles.medium18White,
      titleMedium: AppStyles.regular16GrayLight,
      titleSmall: AppStyles.regular14White,
      labelLarge: AppStyles.medium20White,
      labelMedium: AppStyles.semiBold14white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.blueAccent,
        padding: EdgeInsets.symmetric(vertical: 9),
      ),
    ),
  );
}
