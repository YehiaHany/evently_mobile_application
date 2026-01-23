import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../providers/theme_provider.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return SvgPicture.asset(
      width: 30,
      height: 30,
      themeProvider.isDarkMode()
          ? AppAssets.moonIcon
          : AppAssets.primaryBlueSunIcon,
      colorFilter: ColorFilter.mode(
        themeProvider.isDarkMode()
            ? AppColors.blueAccent
            : AppColors.primaryBlue,
        BlendMode.srcIn,
      ),
    );
  }
}
