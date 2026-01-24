import 'package:evently/core/utils/device_dimensions.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_styles.dart';
import '../../providers/theme_provider.dart';
import '../../utils.dart';

class PageTop extends StatelessWidget {
  int currentIndex;
  PageController pageController;
  PageController pageController2;

  PageTop({
    super.key,
    required this.pageController,
    required this.pageController2,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (currentIndex != 0) {
              pageController.previousPage(
                duration: Duration(milliseconds: 390),
                curve: Curves.easeIn,
              );
              pageController2.previousPage(
                duration: Duration(milliseconds: 390),
                curve: Curves.easeIn,
              );
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02, vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  currentIndex == 0
                      ? AppColors.transparentColor
                      : themeProvider.isDarkMode()
                      ? AppColors.blueVeryDark
                      : AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color:
                    currentIndex == 0
                        ? AppColors.transparentColor
                        : themeProvider.isDarkMode()
                        ? AppColors.blueDark
                        : AppColors.offWhite,
                width: 1,
              ),
            ),
            child: SvgPicture.asset(
              AppAssets.arrowIcon,
              colorFilter: ColorFilter.mode(
                currentIndex == 0
                    ? AppColors.transparentColor
                    : themeProvider.isDarkMode()
                    ? AppColors.white
                    : AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        themeProvider.isDarkMode()
            ? Image.asset(AppAssets.darkEventlyLogo)
            : Image.asset(AppAssets.lightEventlyLogo),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
            setIsFirstTime();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  currentIndex == 2
                      ? AppColors.transparentColor
                      : themeProvider.isDarkMode()
                      ? AppColors.blueVeryDark
                      : AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color:
                    currentIndex == 2
                        ? AppColors.transparentColor
                        : themeProvider.isDarkMode()
                        ? AppColors.blueDark
                        : AppColors.offWhite,
                width: 1,
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.skip,
              style: AppStyles.semiBold14white.copyWith(
                color:
                    currentIndex == 2
                        ? AppColors.transparentColor
                        : themeProvider.isDarkMode()
                        ? AppColors.white
                        : AppColors.primaryBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
