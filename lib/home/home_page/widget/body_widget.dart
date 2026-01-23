import 'package:evently/core/utils/device_dimensions.dart';
import 'package:evently/model/event_category_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../providers/theme_provider.dart';

class BodyWidget extends StatefulWidget {
  String category;
  String title;
  String date;

  BodyWidget({
    super.key,
    required this.title,
    required this.category,
    required this.date,
  });

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.009,
        horizontal: context.width * 0.019,
      ),
      margin: EdgeInsets.only(bottom: context.height * 0.018),
      width: double.infinity,
      height: context.height * 0.217,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color:
              themeProvider.isDarkMode()
                  ? AppColors.blueDark
                  : AppColors.offWhite,
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            themeProvider.isDarkMode()
                ? EventCategoryBackgroundImages.categoryImagesDark[widget
                    .category]!
                : EventCategoryBackgroundImages.categoryImagesLight[widget
                    .category]!,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: containerBoxDecoration(themeProvider),
            padding: EdgeInsets.symmetric(
              vertical: context.height * 0.009,
              horizontal: context.width * 0.019,
            ),
            child: Text(
              widget.date,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            decoration: containerBoxDecoration(themeProvider),
            padding: EdgeInsets.symmetric(
              vertical: context.height * 0.009,
              horizontal: context.width * 0.019,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                GestureDetector(
                  onTap: () {
                    isFavourite = !isFavourite;
                    setState(() {});
                  },
                  child: SvgPicture.asset(
                    isFavourite
                        ? themeProvider.isDarkMode()
                            ? "${AppAssets.heartIcon}SelectedDark.svg"
                            : "${AppAssets.heartIcon}Selected.svg"
                        : "${AppAssets.heartIcon}.svg",
                    colorFilter: ColorFilter.mode(
                      themeProvider.isDarkMode()
                          ? AppColors.blueAccent
                          : AppColors.primaryBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration containerBoxDecoration(ThemeProvider themeProvider) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color:
          themeProvider.isDarkMode()
              ? AppColors.blueVeryDark
              : AppColors.backgroundLight,
      border: Border.all(
        width: 1,
        color:
            themeProvider.isDarkMode()
                ? AppColors.blueDark
                : AppColors.offWhite,
      ),
    );
  }
}
