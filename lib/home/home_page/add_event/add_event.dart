import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/device_dimensions.dart';
import 'package:evently/home/home_page/add_event/widget/category_widget.dart';
import 'package:evently/home/home_page/add_event/widget/date_or_time_widget.dart';
import 'package:evently/home/home_page/widget/app_bar_button_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event_model.dart';
import 'package:evently/model/tab_bar_model.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_routes.dart';
import '../../../core/utils/app_styles.dart';
import '../../../model/event_category_background_image.dart';
import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  List<EventModel> filterList = EventModel.events;
  bool isLottieLoaded = false;
  TextEditingController _eventTitleController = TextEditingController();
  TextEditingController _eventDescriptionController = TextEditingController();
  String currentCategory = TabBarModel.tabs[1]!;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    bool isArabic = langProvider.appLanguage == "ar";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.add_event_title,
          style: isDark ? AppStyles.medium18White : AppStyles.medium18Black,
        ),
        leading: AppBarButtonWidget(
          iconPath: AppAssets.arrowIcon,
          startMargin: context.width * 0.04,
          flip: isArabic,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
            vertical: context.height * 0.02,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: context.height * 0.015,
              children: [
                Container(
                  width: double.infinity,
                  height: context.height * 0.23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color:
                          themeProvider.isDarkMode()
                              ? AppColors.blueDark
                              : AppColors.offWhite,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      fit: BoxFit.fill,
                      themeProvider.isDarkMode()
                          ? EventCategoryBackgroundImages
                              .categoryImagesDark[currentCategory]!
                          : EventCategoryBackgroundImages
                              .categoryImagesLight[currentCategory]!,
                    ),
                  ),
                ),
                CategoryWidget(setIndex: _setFilterList),
                Text(
                  AppLocalizations.of(context)!.event_title_label,
                  style:
                      isDark
                          ? AppStyles.medium18White
                          : AppStyles.medium18Black,
                ),
                CustomTextField(
                  controller: _eventTitleController,
                  hintText: AppLocalizations.of(context)!.event_title_hint,
                ),
                Text(
                  AppLocalizations.of(context)!.event_description_label,
                  style:
                      isDark
                          ? AppStyles.medium18White
                          : AppStyles.medium18Black,
                ),
                CustomTextField(
                  controller: _eventDescriptionController,
                  maxLines: 8,
                  hintText:
                      AppLocalizations.of(context)!.event_description_hint,
                ),
                DateOrTimeWidget(
                  label: AppLocalizations.of(context)!.event_date,
                  iconPath: AppAssets.calendarAddIcon,
                  textButtonTitle: AppLocalizations.of(context)!.choose_date,
                  function: () {},
                ),
                DateOrTimeWidget(
                  label: AppLocalizations.of(context)!.event_time,
                  iconPath: AppAssets.clockIcon,
                  textButtonTitle: AppLocalizations.of(context)!.choose_time,
                  function: () {},
                ),

                ElevatedButton(
                  onPressed: () {
                    // todo:add event function
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.mainScreen);
                    EventModel.events.add(
                      EventModel(
                        title: _eventTitleController.text,
                        category: currentCategory,
                        date: "21",
                        time: '12:00',
                        description: _eventDescriptionController.text,
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.add_event_title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setFilterList(int index) {
    currentCategory = TabBarModel.tabs[index + 1]!;
    setState(() {});
  }
}
