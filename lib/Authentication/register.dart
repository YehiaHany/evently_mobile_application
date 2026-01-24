import 'package:evently/Authentication/widget/custom_google_button.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:evently/core/utils/device_dimensions.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_assets.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';

class Register extends StatelessWidget {
  bool obscure = true;

  Register({super.key});

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
              spacing: context.height * 0.02,
              children: [
                Center(
                  child:
                      themeProvider.isDarkMode()
                          ? Image.asset(AppAssets.darkEventlyLogo)
                          : Image.asset(AppAssets.lightEventlyLogo),
                ),
                SizedBox(height: context.height * 0.01),
                Text(
                  AppLocalizations.of(context)!.create_account_title,
                  style:
                      isDark
                          ? AppStyles.semiBold24white
                          : AppStyles.semiBold24PrimeBlue,
                ),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.name_hint,
                  prefixIcon: "${AppAssets.userIcon}.svg",
                  prefixColorLight: AppColors.grayLight,
                  prefixColorDark: AppColors.grayLight,
                  prefixPadding: EdgeInsets.only(
                    right: isEnglish ? 4 : 16,
                    left: isEnglish ? 16 : 4,
                  ),
                ),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.email_hint,
                  prefixIcon: AppAssets.smsIcon,
                  prefixColorLight: AppColors.grayLight,
                  prefixColorDark: AppColors.grayLight,
                  prefixPadding: EdgeInsets.only(
                    right: isEnglish ? 4 : 16,
                    left: isEnglish ? 16 : 4,
                  ),
                ),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.password_hint,
                  obscure: true,
                  prefixIcon: AppAssets.lockIcon,
                  prefixColorLight: AppColors.grayLight,
                  suffixIcon: AppAssets.eyeIcon,
                  suffixColorLight: AppColors.grayLight,
                  suffixColorDark: AppColors.grayLight,
                  isPassword: true,
                  prefixPadding: EdgeInsets.only(
                    right: isEnglish ? 4 : 16,
                    left: isEnglish ? 16 : 4,
                  ),
                ),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.confirm_password_hint,
                  obscure: true,
                  prefixIcon: AppAssets.lockIcon,
                  prefixColorLight: AppColors.grayLight,
                  suffixIcon: AppAssets.eyeIcon,
                  suffixColorLight: AppColors.grayLight,
                  suffixColorDark: AppColors.grayLight,
                  isPassword: true,
                  prefixPadding: EdgeInsets.only(
                    right: isEnglish ? 4 : 16,
                    left: isEnglish ? 16 : 4,
                  ),
                ),
                SizedBox(height: context.height * 0.02),
                ElevatedButton(
                  onPressed: () {
                    // todo:register function
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.mainScreen);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.signup_link,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(height: context.height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.already_have_account,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(AppRoutes.loginScreen);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.login_link,
                        style:
                            isDark
                                ? AppStyles.semiBold14BlueAccent.copyWith(
                                  decoration: TextDecoration.underline,
                                )
                                : AppStyles.semiBold14PrimeBlue.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.005),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: isDark ? AppColors.blueDark : AppColors.offWhite,
                        indent: context.width * 0.02,
                        endIndent: context.width * 0.02,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.or_divider,
                      style:
                          isDark
                              ? AppStyles.semiBold16BlueAccent.copyWith(
                                decoration: TextDecoration.underline,
                              )
                              : AppStyles.semiBold16PrimaryBlue.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: isDark ? AppColors.blueDark : AppColors.offWhite,
                        indent: context.width * 0.02,
                        endIndent: context.width * 0.02,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.005),
                CustomGoogleButton(
                  child: Row(
                    spacing: 16,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.googleIcon),
                      Text(
                        AppLocalizations.of(context)!.signup_with_google,
                        style:
                            isDark
                                ? AppStyles.medium18BlueAccent
                                : AppStyles.medium18Blue,
                      ),
                    ],
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
