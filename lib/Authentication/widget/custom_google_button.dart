import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_colors.dart';
import '../../providers/theme_provider.dart';

class CustomGoogleButton extends StatelessWidget {
  Widget child;
  VoidCallback? function;

  CustomGoogleButton({super.key, required this.child, this.function});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    return ElevatedButton(
      onPressed: () {
        //todo:google authentication
        function?.call();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isDark ? AppColors.blueDark : AppColors.offWhite,
            width: 1,
          ),
        ),
        foregroundColor: isDark ? AppColors.blueAccent : AppColors.primaryBlue,
        backgroundColor: isDark ? AppColors.blueVeryDark : AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 9),
      ),
      child: child,
    );
  }
}
