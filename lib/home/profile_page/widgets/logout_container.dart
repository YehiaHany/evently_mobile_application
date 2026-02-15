import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';

class LogoutContainer extends StatelessWidget {
  const LogoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    return GestureDetector(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.loginScreen, (route) => false);
      },
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0 /*16*/),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
              themeProvider.isDarkMode()
                  ? AppColors.blueVeryDark
                  : AppColors.white,
          border: Border.all(
            color:
                themeProvider.isDarkMode()
                    ? AppColors.blueDark
                    : AppColors.offWhite,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.log_out,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Transform.flip(
                flipX: langProvider.appLanguage == "ar",
                flipY: langProvider.appLanguage == "ar",
                child: SvgPicture.asset(AppAssets.logOutIcon)),
          ],
        ),
      ),
    );
  }
}
