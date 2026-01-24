import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryBlue,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: StadiumBorder(),
      foregroundColor: AppColors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        unselectedItemColor: AppColors.grayLight,
        selectedItemColor: AppColors.primaryBlue,
        selectedLabelStyle: AppStyles.regular12PrimaryBlue,
        unselectedLabelStyle: AppStyles.regular12LightGray
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.semiBold20Black,
      headlineMedium: AppStyles.medium16Black,
      headlineSmall: AppStyles.regular14GrayDark,
      titleLarge: AppStyles.medium18Blue,
      titleMedium: AppStyles.regular17GrayDark,
      titleSmall: AppStyles.regular14Blue,
      labelLarge: AppStyles.medium20White,
      labelMedium: AppStyles.semiBold14white,
      labelSmall: AppStyles.medium20Black,
      bodyMedium: AppStyles.semiBold16PrimaryBlue,
      bodySmall: AppStyles.medium14Black,
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
    colorScheme: ColorScheme.dark(
      primary: AppColors.blueAccent,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: StadiumBorder(),
      foregroundColor: AppColors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundDark,
        unselectedItemColor: AppColors.grayLight,
        selectedItemColor: AppColors.blueAccent,
        selectedLabelStyle: AppStyles.regular12PrimaryBlue,
        unselectedLabelStyle: AppStyles.regular12LightGray
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.semiBold20white,
      headlineMedium: AppStyles.medium16White,
      headlineSmall: AppStyles.regular14GrayLight,
      titleLarge: AppStyles.medium18White,
      titleMedium: AppStyles.regular17GrayLight,
      titleSmall: AppStyles.regular14White,
      labelLarge: AppStyles.medium20White,
      labelMedium: AppStyles.semiBold14white,
      labelSmall: AppStyles.medium20White,
      bodyMedium: AppStyles.semiBold16BlueAccent,
      bodySmall: AppStyles.medium14White,

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
