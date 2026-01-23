import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyleLight;
  final TextStyle? hintStyleDark;
  final TextStyle? textStyle;
  final Color? fillLight;
  final Color? fillDark;
  final Color? cursorLight;
  final Color? cursorDark;
  final Color? borderLight;
  final Color? borderDark;
  final double borderRadius;
  final EdgeInsetsGeometry suffixPadding;
  final EdgeInsetsGeometry prefixPadding;
  final double minHeight;
  final dynamic suffixIcon;
  final dynamic prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.hintText,
    this.hintStyleLight,
    this.hintStyleDark,
    this.textStyle,
    this.fillLight,
    this.fillDark,
    this.cursorLight,
    this.cursorDark,
    this.borderLight,
    this.borderDark,
    this.borderRadius = 16.0,
    this.suffixPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.prefixPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.minHeight = 24.0,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode();

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //If you want the error to disappear the moment the user starts typing correctly
      controller: controller,
      validator: validator,
      style: textStyle ?? Theme.of(context).textTheme.bodySmall,
      cursorColor:
          isDark
              ? (cursorDark ?? AppColors.blueAccent)
              : (cursorLight ?? AppColors.primaryBlue),
      decoration: InputDecoration(
        filled: true,
        fillColor:
            isDark
                ? (fillDark ?? AppColors.blueVeryDark)
                : (fillLight ?? AppColors.white),

        enabledBorder: _buildBorder(
          isDark,
          borderLight ?? AppColors.offWhite,
          borderDark ?? AppColors.blueDark,
        ),
        focusedBorder: _buildBorder(
          isDark,
          borderLight ?? AppColors.offWhite,
          borderDark ?? AppColors.blueDark,
        ),
        errorBorder: _buildBorder(
          isDark,
          AppColors.errorRed,
          AppColors.errorRed,
        ),
        focusedErrorBorder: _buildBorder(
          isDark,
          AppColors.errorRed,
          AppColors.errorRed,
        ),

        hintText: hintText ?? "",
        hintStyle:
            isDark
                ? (hintStyleDark ?? AppStyles.regular14GrayBorder)
                : (hintStyleLight ?? AppStyles.regular14GrayDark),

        prefixIcon: _getIcon(prefixIcon, isDark, false),
        suffixIcon: _getIcon(suffixIcon, isDark, true),

        prefixIconConstraints: BoxConstraints(minHeight: minHeight),
        suffixIconConstraints: BoxConstraints(minHeight: minHeight),
      ),
    );
  }

  Widget? _getIcon(dynamic iconSource, bool isDark, bool isSuffix) {
    if (iconSource == null) return null;

    Widget child;
    if (iconSource is String) {
      child = SvgPicture.asset(
        iconSource,
        colorFilter: ColorFilter.mode(
          isDark ? AppColors.blueAccent : AppColors.primaryBlue,
          BlendMode.srcIn,
        ),
      );
    } else if (iconSource is Widget) {
      child = iconSource;
    } else {
      return null;
    }

    return Padding(
      padding: isSuffix ? suffixPadding : prefixPadding,
      child: child,
    );
  }

  OutlineInputBorder _buildBorder(
    bool isDark,
    Color lightColor,
    Color darkColor,
  ) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(width: 1, color: isDark ? darkColor : lightColor),
    );
  }
}
