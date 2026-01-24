import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../providers/theme_provider.dart';

class DateOrTimeWidget extends StatelessWidget {
  String label;
  String iconPath;
  String textButtonTitle;
  VoidCallback function;

  DateOrTimeWidget({
    super.key,
    required this.label,
    required this.iconPath,
    required this.textButtonTitle,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            isDark ? AppColors.blueAccent : AppColors.primaryBlue,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: isDark ? AppStyles.medium16White : AppStyles.medium16Black,
        ),
        Spacer(),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: function,
          child: Text(
            textButtonTitle,
            style:
                isDark
                    ? AppStyles.semiBold14BlueAccent.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blueAccent,
                    )
                    : AppStyles.semiBold14PrimeBlue.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor:
                          AppColors.primaryBlue, // Set the underline color
                    ),
          ),
        ),
      ],
    );
  }
}
