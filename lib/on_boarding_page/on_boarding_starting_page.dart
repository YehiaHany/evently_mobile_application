import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/device_dimensions.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';

class OnBoardingStartingPage extends StatefulWidget {
  const OnBoardingStartingPage({super.key});

  @override
  State<OnBoardingStartingPage> createState() => _OnBoardingStartingPageState();
}

class _OnBoardingStartingPageState extends State<OnBoardingStartingPage> {
  @override
  Widget build(BuildContext context) {
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.03,
            horizontal: context.width * 0.04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: context.height * 0.018,
            children: [
              Center(
                child:
                    themeProvider.isDarkMode()
                        ? Image.asset(AppAssets.darkEventlyLogo)
                        : Image.asset(AppAssets.lightEventlyLogo),
              ),
              SizedBox(height: context.height * 0.004),
              Expanded(
                child: Image.asset(
                  themeProvider.isDarkMode()
                      ? AppAssets.darkBeingCreative1
                      : AppAssets.lightBeingCreative1,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.personalizeTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                AppLocalizations.of(context)!.personalizeDescription,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    spacing: context.width * 0.02,
                    children: [
                      languageContainer(
                        AppLocalizations.of(context)!.english,
                        themeProvider,
                        langProvider,
                        "en",
                      ),
                      languageContainer(
                        AppLocalizations.of(context)!.arabic,
                        themeProvider,
                        langProvider,
                        "ar",
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    spacing: context.width * 0.02,
                    children: [
                      themeContainer(
                        Icons.light_mode,
                        themeProvider,
                        ThemeMode.light,
                      ),
                      themeContainer(
                        Icons.dark_mode_outlined,
                        themeProvider,
                        ThemeMode.dark,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.02),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.onBoardingScreen);
                },
                child: Text(
                  AppLocalizations.of(context)!.letsStart,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget themeContainer(
    IconData themeIcon,
    ThemeProvider themeProvider,
    ThemeMode value,
  ) {
    return GestureDetector(
      onTap: () {
        themeProvider.changeTheme(value);
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                themeProvider.appTheme == value
                    ? AppColors.transparentColor
                    : themeProvider.isDarkMode()
                    ? AppColors.blueDark
                    : AppColors.offWhite,
          ),
          borderRadius: BorderRadius.circular(8),
          color:
              themeProvider.appTheme == value
                  ? themeProvider.isDarkMode()
                      ? AppColors.blueAccent
                      : AppColors.primaryBlue
                  : themeProvider.isDarkMode()
                  ? AppColors.blueVeryDark
                  : AppColors.white,
        ),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn,
        child: Icon(
          themeIcon,
          color:
              themeProvider.appTheme == value
                  ? AppColors.white
                  : themeProvider.isDarkMode()
                  ? AppColors.white
                  : AppColors.blueDark,
        ),
      ),
    );
  }

  Widget languageContainer(
    String label,
    ThemeProvider themeProvider,
    LanguageProvider langProvider,
    String value,
  ) {
    return GestureDetector(
      onTap: () {
        langProvider.changeLanguage(value);
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                langProvider.appLanguage == value
                    ? AppColors.transparentColor
                    : themeProvider.isDarkMode()
                    ? AppColors.blueDark
                    : AppColors.offWhite,
          ),
          borderRadius: BorderRadius.circular(8),
          color:
              langProvider.appLanguage == value
                  ? themeProvider.isDarkMode()
                      ? AppColors.blueAccent
                      : AppColors.primaryBlue
                  : themeProvider.isDarkMode()
                  ? AppColors.blueVeryDark
                  : AppColors.white,
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: Text(
          label,
          style:
              langProvider.appLanguage == value
                  ? Theme.of(context).textTheme.labelMedium
                  : Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
