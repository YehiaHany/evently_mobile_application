import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/device_dimensions.dart';
import 'package:evently/home/profile_page/widgets/language_container.dart';
import 'package:evently/home/profile_page/widgets/logout_container.dart';
import 'package:evently/home/profile_page/widgets/theme_mode_container.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.036,
            horizontal: context.width * 0.04,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: context.height * 0.018,
              children: [
                Image.asset(AppAssets.profilePic),
                Text(
                  "John Safwat",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "johnsafwat.route@gmail.com",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: context.height * 0.018),
                ThemeModeContainer(),
                LanguageContainer(),
                LogoutContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
