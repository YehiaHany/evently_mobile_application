import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/extensions/device_dimensions.dart';
import 'package:evently/home/home_page/widget/body_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../providers/event_list_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widget/custom_text_field.dart';

class FavouritePage extends StatefulWidget {
  FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  bool isLottieLoaded = false;
  late EventProvider eventProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      eventProvider.getFavouriteList();
    });
  }
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    eventProvider = Provider.of<EventProvider>(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04,
          vertical: context.height * 0.02,
        ),
        child: Column(
          spacing: context.height * 0.027,
          children: [
            CustomTextField(
              hintText: AppLocalizations.of(context)!.search_for_event,
              suffixIcon: AppAssets.searchIcon,
            ),
            Expanded(
              child: eventProvider.favouriteList.isEmpty ?
              Column(
                children: [

                  Opacity(
                    opacity: isLottieLoaded ? 1 : 0,
                    child: Lottie.asset(AppAssets.emptyListAnimation,
                        onLoaded: (composition) {
                          Future.delayed(Duration(milliseconds: 200), () {
                            if (mounted) {
                              setState(() {
                                isLottieLoaded = true;
                              });
                            }
                          });
                        }),
                  ),
                  isLottieLoaded ? SizedBox() : Center(
                    child: CircularProgressIndicator(
                      color: themeProvider.isDarkMode()
                          ? AppColors.blueAccent
                          : AppColors.primaryBlue,
                    ),
                  ),
                  Text(isLottieLoaded ? AppLocalizations.of(context)!
                      .no_events_found : "", style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,),

                ],
              ) : ListView.builder(
                itemCount: eventProvider.favouriteList.length,
                itemBuilder: (context, index) {
                  return BodyWidget(
                    event: eventProvider.favouriteList[index],);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(
      {required ThemeProvider themeProvider, required Color lightBorderColor, required Color darkBorderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 1,
        color: themeProvider.isDarkMode()
            ? darkBorderColor
            : lightBorderColor,
      ),
    );
  }
}
