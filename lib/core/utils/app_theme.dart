import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: TextTheme(
      headlineLarge: AppStyles.semiBold20Black,
      headlineMedium: AppStyles.medium16Black,
      headlineSmall: AppStyles.regular14GrayDark,

    ),
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: TextTheme(
      headlineLarge: AppStyles.semiBold20white,
      headlineMedium: AppStyles.medium16white,
      headlineSmall: AppStyles.regular14GrayLight,
    ),
  );
}