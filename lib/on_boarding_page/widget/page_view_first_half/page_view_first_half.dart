import 'package:evently/extensions/device_dimensions.dart';
import 'package:evently/on_boarding_page/widget/page_view_first_half/widget/page_view_item_first_half.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';

typedef changeCurrentIndexValue = void Function(int);

class PageViewFirstHalf extends StatelessWidget {
  PageController pageController;
  changeCurrentIndexValue changeIndex;

  PageViewFirstHalf({
    super.key,
    required this.pageController,
    required this.changeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.385,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          changeIndex(index);
        },
        children: [
          PageViewItemFirstHalf(
            imagePathLight: AppAssets.lightHotTrending,
            imagePathDark: AppAssets.darkHotTrending,
          ),
          PageViewItemFirstHalf(
            imagePathLight: AppAssets.lightBeingCreative2,
            imagePathDark: AppAssets.darkBeingCreative2,
          ),
          PageViewItemFirstHalf(
            imagePathLight: AppAssets.lightBeingCreative3,
            imagePathDark: AppAssets.darkBeingCreative3,
          ),
        ],
      ),
    );
  }
}
