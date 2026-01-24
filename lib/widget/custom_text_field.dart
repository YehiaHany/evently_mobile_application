import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../core/utils/app_assets.dart';

class CustomTextField extends StatefulWidget {
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

  // New Color Attributes for Icons
  final Color? prefixColorLight;
  final Color? prefixColorDark;
  final Color? suffixColorLight;
  final Color? suffixColorDark;

  final double borderRadius;
  final EdgeInsetsGeometry suffixPadding;
  final EdgeInsetsGeometry prefixPadding;
  final double minHeight;
  final dynamic suffixIcon;
  final dynamic prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  bool obscure;
  bool isPassword;

  CustomTextField({
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
    this.prefixColorLight,
    this.prefixColorDark,
    this.suffixColorLight,
    this.suffixColorDark,
    this.borderRadius = 16.0,
    this.suffixPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.prefixPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.minHeight = 24.0,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.obscure = false,
    this.isPassword = false
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode();

    return TextFormField(
      obscureText: widget.obscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      validator: widget.validator,
      style: widget.textStyle ?? Theme
          .of(context)
          .textTheme
          .bodySmall,
      cursorColor: isDark
          ? (widget.cursorDark ?? AppColors.blueAccent)
          : (widget.cursorLight ?? AppColors.primaryBlue),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark
            ? (widget.fillDark ?? AppColors.blueVeryDark)
            : (widget.fillLight ?? AppColors.white),

        enabledBorder: _buildBorder(
          isDark,
          widget.borderLight ?? AppColors.offWhite,
          widget.borderDark ?? AppColors.blueDark,
        ),
        focusedBorder: _buildBorder(
          isDark,
          widget.borderLight ?? AppColors.offWhite,
          widget.borderDark ?? AppColors.blueDark,
        ),
        errorBorder: _buildBorder(
            isDark, AppColors.errorRed, AppColors.errorRed),
        focusedErrorBorder: _buildBorder(
            isDark, AppColors.errorRed, AppColors.errorRed),

        hintText: widget.hintText ?? "",
        hintStyle: isDark
            ? (widget.hintStyleDark ?? AppStyles.regular14GrayBorder)
            : (widget.hintStyleLight ?? AppStyles.regular14GrayDark),

        prefixIcon: _getIcon(widget.prefixIcon, isDark, false),
        suffixIcon: _getIcon(widget.suffixIcon, isDark, true),

        prefixIconConstraints: BoxConstraints(minHeight: widget.minHeight),
        suffixIconConstraints: BoxConstraints(minHeight: widget.minHeight),
      ),
    );
  }

  Widget? _getIcon(dynamic iconSource, bool isDark, bool isSuffix) {
    if (iconSource == null) return null;

    Color iconColor;
    if (isSuffix) {
      iconColor = isDark
          ? (widget.suffixColorDark ?? AppColors.blueAccent)
          : (widget.suffixColorLight ?? AppColors.primaryBlue);
    } else {
      iconColor = isDark
          ? (widget.prefixColorDark ?? AppColors.blueAccent)
          : (widget.prefixColorLight ?? AppColors.primaryBlue);
    }

    Widget child;
    if (iconSource is String) {
      child = SvgPicture.asset(
        iconSource,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      );
    } else if (iconSource is Widget) {
      child = IconTheme(
        data: IconThemeData(color: iconColor),
        child: iconSource,
      );
    } else {
      return null;
    }
    if (widget.isPassword && isSuffix) {
      return GestureDetector(
        onTap: () {
          widget.obscure = !widget.obscure;
          setState(() {

          });
        },
        child: Padding(
            padding: isSuffix ? widget.suffixPadding : widget.prefixPadding,
            child: SvgPicture.asset(
              widget.obscure ? AppAssets.eyeSlashIcon : AppAssets.eyeIcon,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            )
        ),
      );
    }
    else {
      return Padding(
        padding: isSuffix ? widget.suffixPadding : widget.prefixPadding,
      child: child,
    );
    }
  }

  OutlineInputBorder _buildBorder(bool isDark, Color lightColor,
      Color darkColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(width: 1, color: isDark ? darkColor : lightColor),
    );
  }


}