import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../providers/language_provider.dart';

class SettingsContainer extends StatefulWidget {
  const SettingsContainer({super.key});

  @override
  State<SettingsContainer> createState() => _SettingsContainerState();
}

class _SettingsContainerState extends State<SettingsContainer> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    return GestureDetector(
      onTap: () {
        themeProvider.changeTheme(
            themeProvider.isDarkMode() ? ThemeMode.light : ThemeMode.dark);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: themeProvider.isDarkMode()
                ? AppColors.blueVeryDark
                : AppColors.white,
            border: Border.all(
              color: themeProvider.isDarkMode() ? AppColors.blueDark : AppColors
                  .offWhite,
              width: 1,
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(themeProvider.isDarkMode() ? AppLocalizations.of(context)!
                .dark_mode : AppLocalizations.of(context)!.light_mode,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,),
            FlutterSwitch(
              width: 36,
              height: 20,
              toggleSize: 16,
              padding: 2.7,
              value: langProvider.appLanguage == "ar" ? !themeProvider
                  .isDarkMode() : themeProvider.isDarkMode(),
              inactiveColor: langProvider.appLanguage == "ar" ? AppColors
                  .blueAccent : AppColors.borderGray,
              activeColor: langProvider.appLanguage == "ar" ? AppColors
                  .borderGray : AppColors.blueAccent,
              toggleColor: AppColors.white,
              onToggle: (val) {
                setState(() {
                  themeProvider.changeTheme(
                      langProvider.appLanguage == "ar" ? val == false
                          ? ThemeMode.dark
                          : ThemeMode.light : val == true
                          ? ThemeMode.dark
                          : ThemeMode.light);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
