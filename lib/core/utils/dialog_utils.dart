import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String loadingMessage,
    Color? color,
    required TextStyle textStyle,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
        bool isDark = themeProvider.isDarkMode();
        return AlertDialog(
          content: Row(
            spacing: 25,
            children: [
              CircularProgressIndicator(),
              Text(loadingMessage, style: textStyle),
            ],
          ),
          backgroundColor: isDark ? AppColors.blueVeryDark : AppColors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 2,
              color: isDark ? AppColors.blueDark : AppColors.offWhite,
            ),
          ),
        );
      },
    );
  }

  static void hideDialog({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    Color? errorColor,
    String title = "",
    String? posActionName,
    String? negActionName,
    VoidCallback? posAction,
    VoidCallback? negAction,
    bool dismissible = true,
  }) {
    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (context) {
        ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
        bool isDark = themeProvider.isDarkMode();
        TextStyle mainStyle =
            isDark
                ? AppStyles.semiBold14BlueAccent
                : AppStyles.semiBold14PrimeBlue;
        List<Widget> actions = [];
        if (posActionName != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                posAction?.call();
              },
              child: Text(posActionName, style: mainStyle),
            ),
          );
        }
        if (negActionName != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                negAction?.call();
              },
              child: Text(negActionName, style: mainStyle),
            ),
          );
        }
        return AlertDialog(
          content: Text(message, style: Theme.of(context).textTheme.bodySmall),
          title: Text(title, style: mainStyle.copyWith(color: errorColor)),
          actions: actions,
          backgroundColor: isDark ? AppColors.blueVeryDark : AppColors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 2,
              color: isDark ? AppColors.blueDark : AppColors.offWhite,
            ),
          ),
        );
      },
    );
  }
}
