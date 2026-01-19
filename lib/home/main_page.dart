import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/home/favourite_page/favourite_page.dart';
import 'package:evently/home/home_page/home_page.dart';
import 'package:evently/home/profile_page/profile_page.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> tabs = [HomePage(), FavouritePage(), ProfilePage()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          bottomNavigationBarItem(
            iconPath: AppAssets.homeIcon,
            label: AppLocalizations.of(context)!.home,
            index: 0,
            themeProvider: themeProvider,
          ),
          bottomNavigationBarItem(
            iconPath: AppAssets.heartIcon,
            label: AppLocalizations.of(context)!.favourite,
            index: 1,
            themeProvider: themeProvider,
          ),
          bottomNavigationBarItem(
            iconPath: AppAssets.userIcon,
            label: AppLocalizations.of(context)!.profile,
            index: 2,
            themeProvider: themeProvider,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required String iconPath,
    required String label,
    required int index,
    required ThemeProvider themeProvider,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        index == selectedIndex
            ? themeProvider.isDarkMode()
                ? "${iconPath}SelectedDark.svg"
                : "${iconPath}Selected.svg"
            : "$iconPath.svg",
      ),
      label: label,
    );
  }
}
