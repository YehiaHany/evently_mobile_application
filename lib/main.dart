import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/app_theme.dart';
import 'package:evently/home/favourite_page/favourite_page.dart';
import 'package:evently/home/home_page/home_page.dart';
import 'package:flutter/material.dart';

import 'home/profile_page/profile_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        AppRoutes.profileScreen: (context) => ProfilePage(),
        AppRoutes.homeScreen: (context) => HomePage(),
        AppRoutes.favouriteScreen: (context) => FavouritePage(),


      },
      initialRoute: AppRoutes.profileScreen,
    );
  }
}
