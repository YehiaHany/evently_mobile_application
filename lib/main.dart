import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/app_theme.dart';
import 'package:evently/home/favourite_page/favourite_page.dart';
import 'package:evently/home/home_page/home_page.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/on_boarding_page/on_boarding_page.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/profile_page/profile_page.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(langProvider.appLanguage),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      routes: {
        AppRoutes.profileScreen: (context) => ProfilePage(),
        AppRoutes.homeScreen: (context) => HomePage(),
        AppRoutes.favouriteScreen: (context) => FavouritePage(),
        AppRoutes.onBoardingScreen: (context) => OnBoardingPage(),


      },
      initialRoute: AppRoutes.profileScreen,
    );
  }
}
