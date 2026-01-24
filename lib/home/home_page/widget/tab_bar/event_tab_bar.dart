import 'package:evently/home/home_page/widget/tab_bar/widget/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../model/tab_bar_model.dart';
import '../../../../providers/language_provider.dart';

typedef setTabIndex = void Function(int);

class EventTabBar extends StatefulWidget {
  setTabIndex setIndex;

  EventTabBar({super.key, required this.setIndex});

  @override
  State<EventTabBar> createState() => _EventTabBarState();
}

class _EventTabBarState extends State<EventTabBar> {
  List<String> eventNameList = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    eventNameList = TabBarModel.getEventNameList(context);
    return DefaultTabController(
      length: eventNameList.length,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.only(
          right: langProvider.appLanguage == "en" ? 8 : 0,
          left: langProvider.appLanguage == "en" ? 0 : 8,
        ),
        dividerColor: AppColors.transparentColor,
        isScrollable: true,
        indicatorColor: AppColors.transparentColor,
        onTap: (index) {
          selectedIndex = index;
          widget.setIndex(index);
          setState(() {});
        },
        tabs:
            eventNameList.map((event) {
              int index = eventNameList.indexOf(event);
              return TabWidget(
                isSelected: index == selectedIndex,
                label: event,
                svgPictureUrl: TabBarModel.eventSvgList[index],
                icon: TabBarModel.eventIconList[index],
              );
            }).toList(),
      ),
    );
  }
}
