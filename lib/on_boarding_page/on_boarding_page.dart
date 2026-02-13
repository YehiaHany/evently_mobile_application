import 'package:evently/extensions/device_dimensions.dart';
import 'package:evently/on_boarding_page/widget/bottom_button.dart';
import 'package:evently/on_boarding_page/widget/page_indicator_dots.dart';
import 'package:evently/on_boarding_page/widget/page_top.dart';
import 'package:evently/on_boarding_page/widget/page_view_first_half/page_view_first_half.dart';
import 'package:evently/on_boarding_page/widget/page_view_second_half/page_view_second.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController = PageController();
  PageController pageController2 = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.03,
            horizontal: context.width * 0.04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: context.height * 0.018,
            children: [
              PageTop(
                pageController: pageController,
                pageController2: pageController2,
                currentIndex: currentIndex,
              ),
              SizedBox(height: context.height * 0.004),
              PageViewFirstHalf(
                pageController: pageController,
                changeIndex: changeCurrentIndex,
              ),
              PageIndicatorDots(pageController: pageController),
              PageViewSecondHalf(pageController2: pageController2),
              BottomButton(
                pageController: pageController,
                pageController2: pageController2,
                currentIndex: currentIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
