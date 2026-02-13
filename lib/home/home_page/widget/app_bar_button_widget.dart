import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../providers/theme_provider.dart';

class AppBarButtonWidget extends StatelessWidget {
  final String iconPath;
  final Color lightIconColor;
  final Color darkIconColor;
  final double startMargin;
  final double endMargin;
  final bool flip;
  final VoidCallback? function;

  AppBarButtonWidget({
    super.key,
    this.startMargin = 16,
    this.endMargin = 0,
    required this.iconPath,
    this.lightIconColor = AppColors.primaryBlue,
    this.darkIconColor = AppColors.white,
    this.function,
    this.flip = false
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: function ?? () {
        Navigator.of(context).pop();
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(
          start: startMargin,
          top: 8,
          bottom: 8,
          end: endMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
        child: Transform.flip(
          flipX: flip,
          child: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              themeProvider.isDarkMode() ? darkIconColor : lightIconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
