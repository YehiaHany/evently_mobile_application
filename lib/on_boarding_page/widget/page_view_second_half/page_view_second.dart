import 'package:evently/on_boarding_page/widget/page_view_second_half/widget/page_view_item_second_half.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class PageViewSecondHalf extends StatelessWidget {
  PageController pageController2;

  PageViewSecondHalf({super.key, required this.pageController2});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController2,
        children: [
          PageViewItemSecondHalf(
            title: AppLocalizations.of(context)!.findEventsTitle,
            body: AppLocalizations.of(context)!.findEventsDescription,
          ),
          PageViewItemSecondHalf(
            title: AppLocalizations.of(context)!.effortlessPlanningTitle,
            body: AppLocalizations.of(context)!.effortlessPlanningDescription,
          ),
          PageViewItemSecondHalf(
            title: AppLocalizations.of(context)!.connectWithFriendsTitle,
            body: AppLocalizations.of(context)!.connectWithFriendsDescription,
          ),
        ],
      ),
    );
  }
}
