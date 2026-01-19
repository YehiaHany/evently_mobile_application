import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme_provider.dart';

class PageViewItemFirstHalf extends StatelessWidget {
  String imagePathLight;
  String imagePathDark;

  PageViewItemFirstHalf({
    super.key,
    required this.imagePathLight,
    required this.imagePathDark,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Image.asset(
      themeProvider.isDarkMode() ? imagePathDark : imagePathLight,
      fit: BoxFit.fill,
      // width: double.infinity,
      // height: context.height*0.385,
    );
  }
}
