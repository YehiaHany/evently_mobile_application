import 'package:flutter/material.dart';

import '../../core/utils/app_routes.dart';
import '../../l10n/app_localizations.dart';

class BottomButton extends StatelessWidget {
  int currentIndex;
  PageController pageController;
  PageController pageController2;

  BottomButton({
    super.key,
    required this.pageController,
    required this.pageController2,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (currentIndex == 2) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
        } else {
          pageController.nextPage(
            duration: Duration(milliseconds: 390),
            curve: Curves.easeIn,
          );
          pageController2.nextPage(
            duration: Duration(milliseconds: 390),
            curve: Curves.easeIn,
          );
        }
      },
      child: Text(
        currentIndex == 2
            ? AppLocalizations.of(context)!.getStarted
            : AppLocalizations.of(context)!.next,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
