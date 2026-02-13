import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/extensions/device_dimensions.dart';
import 'package:evently/firebase_utils.dart';
import 'package:evently/home/home_page/add_event/widget/category_widget.dart';
import 'package:evently/home/home_page/add_event/widget/date_or_time_widget.dart';
import 'package:evently/home/home_page/widget/app_bar_button_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event_model.dart';
import 'package:evently/model/tab_bar_model.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_styles.dart';
import '../../../model/event_category_background_image.dart';
import '../../../providers/event_list_provider.dart';
import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  bool isLottieLoaded = false;
  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _eventDescriptionController = TextEditingController();
  String currentCategory = TabBarModel.tabs[1]!;
  String title = "";
  String description = "";
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String formatDate = "";
  TimeOfDay? _selectedTime;
  String formateTime = "";
  late EventProvider getEventProvider;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider langProvider = Provider.of<LanguageProvider>(context);
    getEventProvider = Provider.of<EventProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    bool isArabic = langProvider.appLanguage == "ar";
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.add_event_title,
            style: isDark ? AppStyles.medium18White : AppStyles.medium18Black,
          ),
          leading: AppBarButtonWidget(
            function: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.of(context).pushReplacementNamed(
                    AppRoutes.mainScreen);
              });
            },
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
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                    .manual,
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
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return AppLocalizations.of(context)!
                              .event_title_validation;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          title = value;
                        });
                      },
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
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return AppLocalizations.of(context)!
                              .event_description_validation;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          description = value;
                        });
                      },
                      controller: _eventDescriptionController,
                      maxLines: 8,
                      hintText:
                      AppLocalizations.of(context)!.event_description_hint,
                    ),
                    DateOrTimeWidget(
                      label: AppLocalizations.of(context)!.event_date,
                      iconPath: AppAssets.calendarAddIcon,
                      textButtonTitle: _selectedDate == null ? AppLocalizations
                          .of(context)!.choose_date : formatDate,
                      function: () {
                        chooseData();
                      },
                    ),
                    DateOrTimeWidget(
                      label: AppLocalizations.of(context)!.event_time,
                      iconPath: AppAssets.clockIcon,
                      textButtonTitle: _selectedTime == null ? AppLocalizations
                          .of(context)!.choose_time : formateTime,
                      function: () {
                        chooseTime();
                      },
                    ),

                    ElevatedButton(
                      onPressed: () {
                        // todo:add event function
                        addEvent();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.add_event_title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _eventTitleController.dispose();
    _eventDescriptionController.dispose();
  }
  void _setFilterList(int index) {
    currentCategory = TabBarModel.tabs[index + 1]!;
    setState(() {});
  }

  void addEvent() {
    if (_formKey.currentState?.validate() == true) {
      EventModel event = EventModel(title: title,
          category: currentCategory,
          date: _selectedDate,
          time: formateTime,
          description: description);
      FirebaseUtils.addEventToFireStore(event).timeout(
          Duration(seconds: 1), onTimeout: () {
        print("Event Added");
        getEventProvider.getAllEventsFromFireStore();
        Navigator.of(context).pop();
      });
    }
  }

  Future<void> chooseData() async {
    var chooseDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    _selectedDate = chooseDate;
    if (_selectedDate != null) {
      formatDate = DateFormat("MMM d, y").format(_selectedDate!);
    }
    setState(() {});
  }

  Future<void> chooseTime() async {
    var chooseTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.now());
    _selectedTime = chooseTime;
    if (_selectedTime != null) {
      formateTime = _selectedTime!.format(context);
    }
    setState(() {

    });
  }

}
