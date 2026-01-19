import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/utils/app_colors.dart';
import '../../providers/theme_provider.dart';

class PageIndicatorDots extends StatelessWidget {
  PageController pageController;

  PageIndicatorDots({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Center(
      child: SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: ExpandingDotsEffect(
          expansionFactor: 2.5,
          dotHeight: 7,
          dotWidth: 7,
          spacing: 11.0,
          dotColor:
              themeProvider.isDarkMode()
                  ? AppColors.white
                  : AppColors.grayLight,
          activeDotColor:
              themeProvider.isDarkMode()
                  ? AppColors.blueAccent
                  : AppColors.primaryBlue,
        ),
      ),
    );
  }
}
