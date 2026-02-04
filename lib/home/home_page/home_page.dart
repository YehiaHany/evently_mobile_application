import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/device_dimensions.dart';
import 'package:evently/home/home_page/widget/body_widget.dart';
import 'package:evently/home/home_page/widget/language_container_widget.dart';
import 'package:evently/home/home_page/widget/tab_bar/event_tab_bar.dart';
import 'package:evently/home/home_page/widget/theme_icon.dart';
import 'package:evently/home/home_page/widget/welcome_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../providers/event_list_provider.dart';
import '../../providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLottieLoaded = false;
  late EventProvider getEventProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getEventProvider.getAllEventsFromFireStore();
    });
  }
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    getEventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.addEventScreen);
      }, child: Icon(CupertinoIcons.add),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
            vertical: context.height * 0.02,
          ),
          child: Column(
            spacing: context.height * 0.027,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WelcomeWidget(),
                  Row(
                    spacing: context.width * 0.025,
                    children: [ThemeIcon(), LanguageContainerWidget()],
                  ),
                ],
              ),
              EventTabBar(setIndex: getEventProvider.changeIndex),
              Expanded(
                child:
                getEventProvider.filterList.isEmpty
                    ? Column(
                  children: [
                    Opacity(
                      opacity: isLottieLoaded ? 1 : 0,
                      child: Lottie.asset(
                        AppAssets.emptyListAnimation,
                        onLoaded: (composition) {
                          Future.delayed(Duration(milliseconds: 500), () {
                            setState(() {
                              isLottieLoaded = true;
                            });
                          });
                        },
                      ),
                    ),
                    isLottieLoaded
                        ? SizedBox()
                        : Center(
                      child: CircularProgressIndicator(
                        color:
                        themeProvider.isDarkMode()
                            ? AppColors.blueAccent
                            : AppColors.primaryBlue,
                      ),
                    ),
                    Text(
                      isLottieLoaded
                          ? AppLocalizations.of(context)!.no_events_found
                          : "",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                  ],
                )
                    : ListView.builder(
                  itemCount: getEventProvider.filterList.length,
                  itemBuilder: (context, index) {
                    return BodyWidget(
                      event: getEventProvider.filterList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
