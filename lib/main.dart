import 'package:evently/Authentication/forget_password.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/app_theme.dart';
import 'package:evently/home/favourite_page/favourite_page.dart';
import 'package:evently/home/home_page/home_page.dart';
import 'package:evently/home/main_page.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/on_boarding_page/on_boarding_starting_page.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Authentication/login.dart';
import 'Authentication/register.dart';
import 'home/profile_page/profile_page.dart';
import 'on_boarding_page/on_boarding_page.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isFirstTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeIsFirstTime();
  }

  Future<void> initializeIsFirstTime() async {
    isFirstTime = await getIsFirstTime();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return isFirstTime == null ? CircularProgressIndicator(
      color: themeProvider.isDarkMode() ? AppColors.blueAccent : AppColors
          .primaryBlue,) : MaterialApp(
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
        AppRoutes.onBoardingStartScreen: (context) => OnBoardingStartingPage(),
        AppRoutes.onBoardingScreen: (context) => OnBoardingPage(),
        AppRoutes.mainScreen: (context) => MainPage(),
        AppRoutes.loginScreen: (context) => Login(),
        AppRoutes.registerScreen: (context) => Register(),
        AppRoutes.forgetPasswordScreen: (context) => ForgetPassword(),

      },
      initialRoute: isFirstTime! ? AppRoutes
          .loginScreen : AppRoutes.onBoardingStartScreen,
    );
  }
}
