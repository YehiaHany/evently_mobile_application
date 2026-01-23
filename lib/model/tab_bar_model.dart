import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_assets.dart';
import '../l10n/app_localizations.dart';

class TabBarModel {
  static const List<String?> eventSvgList = [
    AppAssets.allIcon,
    AppAssets.bikeIcon,
    AppAssets.birthdayCakeIcon,
    null,
    null,
    null,
  ];

  static const List<IconData?> eventIconList = [
    null,
    null,
    null,
    CupertinoIcons.video_camera,
    Icons.museum_outlined,
    CupertinoIcons.book,
  ];
  static const Map<int, String> tabs = {
    0: "all",
    1: "sport",
    2: "birthday",
    3: "meeting",
    4: "exhibition",
    5: "book_club",
  };

  static List<String> getEventNameList(BuildContext context) {
    return [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.bookClub,
    ];
  }
}
