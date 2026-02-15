import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'DarkMode'**
  String get dark_mode;

  /// No description provided for @light_mode.
  ///
  /// In en, this message translates to:
  /// **'LightMode'**
  String get light_mode;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @personalizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Personalize Your Experience'**
  String get personalizeTitle;

  /// No description provided for @personalizeDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.'**
  String get personalizeDescription;

  /// No description provided for @findEventsTitle.
  ///
  /// In en, this message translates to:
  /// **'Find Events That Inspire You'**
  String get findEventsTitle;

  /// No description provided for @findEventsDescription.
  ///
  /// In en, this message translates to:
  /// **'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'**
  String get findEventsDescription;

  /// No description provided for @effortlessPlanningTitle.
  ///
  /// In en, this message translates to:
  /// **'Effortless Event Planning'**
  String get effortlessPlanningTitle;

  /// No description provided for @effortlessPlanningDescription.
  ///
  /// In en, this message translates to:
  /// **'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'**
  String get effortlessPlanningDescription;

  /// No description provided for @connectWithFriendsTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect with Friends & Share Moments'**
  String get connectWithFriendsTitle;

  /// No description provided for @connectWithFriendsDescription.
  ///
  /// In en, this message translates to:
  /// **'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'**
  String get connectWithFriendsDescription;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let’s start'**
  String get letsStart;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @john_safwat.
  ///
  /// In en, this message translates to:
  /// **'John Safwat'**
  String get john_safwat;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @favourite.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get favourite;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'profile'**
  String get profile;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back ✨'**
  String get welcome_back;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get sport;

  /// No description provided for @exhibition.
  ///
  /// In en, this message translates to:
  /// **'Exhibition'**
  String get exhibition;

  /// No description provided for @bookClub.
  ///
  /// In en, this message translates to:
  /// **'Book Club'**
  String get bookClub;

  /// No description provided for @meeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get meeting;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @no_events_found.
  ///
  /// In en, this message translates to:
  /// **'No Events Found'**
  String get no_events_found;

  /// No description provided for @search_for_event.
  ///
  /// In en, this message translates to:
  /// **'Search for event'**
  String get search_for_event;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get log_out;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get login_title;

  /// No description provided for @create_account_title.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get create_account_title;

  /// No description provided for @forget_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forget_password_title;

  /// No description provided for @add_event_title.
  ///
  /// In en, this message translates to:
  /// **'Add event'**
  String get add_event_title;

  /// No description provided for @name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get name_hint;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get email_hint;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get password_hint;

  /// No description provided for @confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get confirm_password_hint;

  /// No description provided for @event_title_label.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get event_title_label;

  /// No description provided for @event_title_hint.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get event_title_hint;

  /// No description provided for @event_description_label.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get event_description_label;

  /// No description provided for @event_description_hint.
  ///
  /// In en, this message translates to:
  /// **'Event Description...'**
  String get event_description_hint;

  /// No description provided for @event_date.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get event_date;

  /// No description provided for @event_time.
  ///
  /// In en, this message translates to:
  /// **'Event Time'**
  String get event_time;

  /// No description provided for @choose_date.
  ///
  /// In en, this message translates to:
  /// **'Choose date'**
  String get choose_date;

  /// No description provided for @choose_time.
  ///
  /// In en, this message translates to:
  /// **'Choose time'**
  String get choose_time;

  /// No description provided for @forget_password_link.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forget_password_link;

  /// No description provided for @login_button.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_button;

  /// No description provided for @signup_button.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup_button;

  /// No description provided for @reset_password_button.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get reset_password_button;

  /// No description provided for @add_event_button.
  ///
  /// In en, this message translates to:
  /// **'Add event'**
  String get add_event_button;

  /// No description provided for @donot_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account ?'**
  String get donot_have_account;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @signup_link.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signup_link;

  /// No description provided for @login_link.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_link;

  /// No description provided for @or_divider.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or_divider;

  /// No description provided for @event_title_validation.
  ///
  /// In en, this message translates to:
  /// **'Please enter event title'**
  String get event_title_validation;

  /// No description provided for @event_description_validation.
  ///
  /// In en, this message translates to:
  /// **'Please enter event description'**
  String get event_description_validation;

  /// No description provided for @event_date_validation.
  ///
  /// In en, this message translates to:
  /// **'Please select event date'**
  String get event_date_validation;

  /// No description provided for @event_time_validation.
  ///
  /// In en, this message translates to:
  /// **'Please select event time'**
  String get event_time_validation;

  /// No description provided for @login_with_google.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get login_with_google;

  /// No description provided for @signup_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get signup_with_google;

  /// No description provided for @email_empty.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get email_empty;

  /// No description provided for @email_invalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email format'**
  String get email_invalid;

  /// No description provided for @email_exists.
  ///
  /// In en, this message translates to:
  /// **'This email is already registered. Please use another one.'**
  String get email_exists;

  /// No description provided for @password_empty.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get password_empty;

  /// No description provided for @password_invalid.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get password_invalid;

  /// No description provided for @username_empty.
  ///
  /// In en, this message translates to:
  /// **'Username cannot be empty'**
  String get username_empty;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @login_success.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get login_success;

  /// No description provided for @register_success.
  ///
  /// In en, this message translates to:
  /// **'Registered successfully'**
  String get register_success;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @user_not_found.
  ///
  /// In en, this message translates to:
  /// **'No user found for that email.'**
  String get user_not_found;

  /// No description provided for @wrong_password.
  ///
  /// In en, this message translates to:
  /// **'Wrong password Entered'**
  String get wrong_password;

  /// No description provided for @weak_password.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak.'**
  String get weak_password;

  /// No description provided for @email_already_in_use.
  ///
  /// In en, this message translates to:
  /// **'This email is already in use by another account.'**
  String get email_already_in_use;

  /// No description provided for @authentication_error.
  ///
  /// In en, this message translates to:
  /// **'Authentication error'**
  String get authentication_error;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again.'**
  String get something_went_wrong;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @event_details_title.
  ///
  /// In en, this message translates to:
  /// **'Event details'**
  String get event_details_title;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
