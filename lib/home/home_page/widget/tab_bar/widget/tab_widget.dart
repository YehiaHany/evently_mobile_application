import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:evently/core/utils/device_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/theme_provider.dart';

class TabWidget extends StatelessWidget {
  bool isSelected;
  String label;
  String? svgPictureUrl;
  IconData? icon;

  TabWidget({
    super.key,
    required this.isSelected,
    required this.label,
    this.icon,
    this.svgPictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8 /*context.height*0.009*/,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color:
            isSelected
                ? AppColors.primaryBlue
                : themeProvider.isDarkMode()
                ? AppColors.blueVeryDark
                : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color:
              isSelected
                  ? AppColors.transparentColor
                  : themeProvider.isDarkMode()
                  ? AppColors.blueDark
                  : AppColors.offWhite,
        ),
      ),
      child: Row(
        spacing: context.width * 0.02,
        children: [
          svgPictureUrl == null
              ? Icon(
                icon,
                color:
                    isSelected
                        ? AppColors.white
                        : themeProvider.isDarkMode()
                        ? AppColors.blueAccent
                        : AppColors.primaryBlue,
              )
              : SvgPicture.asset(
                svgPictureUrl!,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? AppColors.white
                      : themeProvider.isDarkMode()
                      ? AppColors.blueAccent
                      : AppColors.primaryBlue,
                  BlendMode.srcIn,
                ),
              ),
          Text(
            label,
            style:
                isSelected || themeProvider.isDarkMode()
                    ? AppStyles.medium16White
                    : AppStyles.medium16Black,
          ),
        ],
      ),
    );
  }
}
