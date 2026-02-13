import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:evently/extensions/device_dimensions.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_assets.dart';
import '../home/home_page/widget/app_bar_button_widget.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';

class ForgetPassword extends StatelessWidget {
  bool obscure = true;

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    bool isArabic = langProvider.appLanguage == "ar";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.forget_password_title,
          style: isDark ? AppStyles.medium18White : AppStyles.medium18Black,
        ),
        leading: AppBarButtonWidget(
          iconPath: AppAssets.arrowIcon,
          startMargin: context.width * 0.04,
          flip: isArabic,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.03,
            horizontal: context.width * 0.04,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: context.height * 0.04,
              children: [
                Image.asset(
                  AppAssets.changeSettingImage,
                  height: context.height * 0.385,
                ),
                SizedBox(height: context.height * 0.005),
                ElevatedButton(
                  onPressed: () {
                    //todo:forgetPasswordFunction
                  },
                  child: Text(
                    AppLocalizations.of(context)!.reset_password_button,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
