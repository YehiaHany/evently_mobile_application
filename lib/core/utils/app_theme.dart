import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundLight,
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
    ),
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundDark,
        unselectedItemColor: AppColors.grayLight,
        selectedItemColor: AppColors.blueAccent,
        selectedLabelStyle: AppStyles.regular12PrimaryBlue,
        unselectedLabelStyle: AppStyles.regular12LightGray
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.semiBold20white,
      headlineMedium: AppStyles.medium16white,
      headlineSmall: AppStyles.regular14GrayLight,
    ),
  );
}