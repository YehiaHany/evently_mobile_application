import 'package:evently/home/home_page/widget/tab_bar/widget/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/tab_bar_model.dart';
import '../../../../providers/language_provider.dart';

typedef setTabIndex = void Function(int);

class CategoryWidget extends StatefulWidget {
  setTabIndex setIndex;

  CategoryWidget({super.key, required this.setIndex});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<String> eventNameList = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    eventNameList = TabBarModel.getEventNameList(context).sublist(1);
    return SizedBox(
      height: 40, //context.height*0.045
      child: ListView.separated(
        itemCount: eventNameList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.setIndex(index);
              });
            },
            child: TabWidget(
              isSelected: index == selectedIndex,
              label: eventNameList[index],
              svgPictureUrl: TabBarModel.eventSvgList[index + 1],
              icon: TabBarModel.eventIconList[index + 1],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 8);
        },
      ),
    );
  }
}
