import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/home/profile_page/widgets/language_container.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              spacing: 16,
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
                SizedBox(height: 16),
                LanguageContainer(),
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}
