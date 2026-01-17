import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';

class LanguageContainer extends StatefulWidget {
  const LanguageContainer({super.key});

  @override
  State<LanguageContainer> createState() => _LanguageContainerState();
}

class _LanguageContainerState extends State<LanguageContainer> {
  final GlobalKey<PopupMenuButtonState<String>> languageMenuKey =
      GlobalKey<PopupMenuButtonState<String>>();
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        languageMenuKey.currentState?.showButtonMenu();
        isOpened = true;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: langProvider.appLanguage == "en" ? 16 : 4,
          right: langProvider.appLanguage == "en" ? 4 : 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
          themeProvider.isDarkMode()
              ? AppColors.blueVeryDark
              : AppColors.white,
          border: Border.all(
            color:
            themeProvider.isDarkMode()
                ? AppColors.blueDark
                : AppColors.offWhite,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              langProvider.language == null
                  ? AppLocalizations.of(context)!.language
                  : langProvider.language == "en"
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            PopupMenuButton<String>(
              onOpened: () {
                isOpened = true;
                setState(() {});
              },
              onCanceled: () {
                Future.delayed(Duration(milliseconds: 200), () {
                  isOpened = false;
                  setState(() {});
                });
              },
              key: languageMenuKey,
              color: themeProvider.isDarkMode()
                  ? AppColors.blueVeryDark
                  : AppColors.white,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: themeProvider.isDarkMode()
                    ? AppColors.blueDark
                    : AppColors.offWhite, width: 2),
              ),
              onSelected: (value) {
                Future.delayed(Duration(milliseconds: 200), () {
                  langProvider.changeLanguage(value);
                  isOpened = false;
                  setState(() {});
                });
              },
              icon: Transform.rotate(
                angle:
                    isOpened
                        ? langProvider.appLanguage == "ar"
                            ? -1.57
                            : 1.57
                        : 0,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: themeProvider.isDarkMode()
                      ? AppColors.blueAccent
                      : AppColors.primaryBlue,
                ),
              ),
              position: PopupMenuPosition.under,
              itemBuilder:
                  (context) => [
                    PopupMenuItem(
                      value: "en",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.english,
                            style: Theme.of(
                              context,
                            ).textTheme.headlineMedium?.copyWith(fontSize: 14),
                          ),
                          Visibility(
                            visible: langProvider.appLanguage == "en",
                            child: Icon(
                              Icons.check,
                              color: themeProvider.isDarkMode() ? AppColors
                                  .blueAccent : AppColors.primaryBlue,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: "ar",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.arabic,
                            style: Theme.of(
                              context,
                            ).textTheme.headlineMedium?.copyWith(fontSize: 14),
                          ),
                          Visibility(
                            visible: langProvider.appLanguage == "ar",
                            child: Icon(
                              Icons.check,
                              color: themeProvider.isDarkMode() ? AppColors
                                  .blueAccent : AppColors.primaryBlue,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
            ),
            // Icon(Icons.arrow_forward_ios,color: AppColors.primaryBlue,),
          ],
        ),
      ),
    );
  }
}
