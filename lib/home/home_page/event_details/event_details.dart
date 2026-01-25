import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/device_dimensions.dart';
import 'package:evently/home/home_page/widget/app_bar_button_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event_model.dart';
import 'package:evently/model/tab_bar_model.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_styles.dart';
import '../../../model/event_category_background_image.dart';
import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';

class EventDetails extends StatefulWidget {
  EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  List<EventModel> filterList = EventModel.events;
  bool isLottieLoaded = false;
  TextEditingController _eventDescriptionController = TextEditingController();
  String currentCategory = TabBarModel.tabs[1]!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eventDescriptionController.text = 'Initial text here';
  }

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
          AppLocalizations.of(context)!.event_details_title,
          style: isDark ? AppStyles.medium18White : AppStyles.medium18Black,
        ),
        leading: AppBarButtonWidget(
          flip: isArabic,
          iconPath: AppAssets.arrowIcon,
          startMargin: context.width * 0.04,
        ),
        actions: [
          InkWell(
            onTap: () {
              //todo edit function
            },
            child: AppBarButtonWidget(
              iconPath: AppAssets.editIcon,
              darkIconColor: AppColors.blueAccent,
              startMargin: 0,
              endMargin: 8,
            ),
          ),
          InkWell(
            onTap: () {
              //todo delete function
            },
            child: AppBarButtonWidget(
              iconPath: AppAssets.trashIcon,
              lightIconColor: AppColors.errorRed,
              darkIconColor: AppColors.errorRed,
              startMargin: 0,
              endMargin: context.width * 0.04,
            ),
          ),
        ],
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
                  decoration: boxDecoration(themeProvider),
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
                Text(
                  AppLocalizations.of(context)!.event_title_label,
                  style:
                      isDark
                          ? AppStyles.medium18White
                          : AppStyles.medium18Black,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: boxDecoration(themeProvider),
                  child: Row(
                    children: [
                      Container(
                        decoration: boxDecoration(
                          themeProvider,
                          AppColors.backgroundLight,
                          8,
                        ),
                        child: SvgPicture.asset(AppAssets.calendarAddIcon),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "21 Jan",
                            style:
                                isDark
                                    ? AppStyles.medium16White
                                    : AppStyles.medium16Black,
                          ),
                          Text(
                            "12:00 PM",
                            style:
                                isDark
                                    ? AppStyles.medium16GrayBorder
                                    : AppStyles.medium16GrayLight,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.event_description_label,
                  style:
                      isDark
                          ? AppStyles.medium18White
                          : AppStyles.medium18Black,
                ),
                CustomTextField(
                  isEnabled: false,
                  controller: _eventDescriptionController,
                  maxLines: 8,
                  hintText:
                      AppLocalizations.of(context)!.event_description_hint,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration boxDecoration(
    ThemeProvider themeProvider, [
    Color lightColor = AppColors.white,
    double radius = 20,
  ]) {
    return BoxDecoration(
      color: themeProvider.isDarkMode() ? AppColors.blueVeryDark : lightColor,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        width: 1,
        color:
            themeProvider.isDarkMode()
                ? AppColors.blueDark
                : AppColors.offWhite,
      ),
    );
  }
}
