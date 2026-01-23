import 'package:evently/core/utils/device_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';

class LanguageContainerWidget extends StatelessWidget {
  const LanguageContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.007,
        horizontal: context.width * 0.02,
      ),
      decoration: BoxDecoration(
        color:
            themeProvider.isDarkMode()
                ? AppColors.blueAccent
                : AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        langProvider.appLanguage == "en" ? "EN" : "عر",
        style: AppStyles.semiBold14white,
      ),
    );
  }
}
