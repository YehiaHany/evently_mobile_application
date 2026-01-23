import 'package:evently/core/utils/app_assets.dart';

class EventCategoryBackgroundImages {
  static const Map<String, String> categoryImagesLight = {
    "exhibition": AppAssets.exhibitionImage,
    "birthday": AppAssets.birthdayImage,
    "meeting": AppAssets.meetingImage,
    "sport": AppAssets.sportImage,
    "book_club": AppAssets.bookClubImage,
  };

  static const Map<String, String> categoryImagesDark = {
    "exhibition": AppAssets.exhibitionDarkImage,
    "birthday": AppAssets.birthdayDarkImage,
    "meeting": AppAssets.meetingDarkImage,
    "sport": AppAssets.sportDarkImage,
    "book_club": AppAssets.bookClubDarkImage,
  };
}
