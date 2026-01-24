import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:evently/core/utils/device_dimensions.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_assets.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';

class ForgetPassword extends StatelessWidget {
  bool obscure = true;

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    bool isEnglish = languageProvider.appLanguage == "en";
    return Scaffold(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              themeProvider.isDarkMode()
                                  ? AppColors.blueVeryDark
                                  : AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color:
                                themeProvider.isDarkMode()
                                    ? AppColors.blueDark
                                    : AppColors.offWhite,
                            width: 1,
                          ),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.arrowIcon,
                          colorFilter: ColorFilter.mode(
                            themeProvider.isDarkMode()
                                ? AppColors.white
                                : AppColors.primaryBlue,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.forget_password_title,
                      style:
                          isDark
                              ? AppStyles.medium18White
                              : AppStyles.medium18Black,
                    ),
                    Icon(Icons.add, color: AppColors.transparentColor),
                  ],
                ),
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
