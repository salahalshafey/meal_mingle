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
/// import 'generated/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// the english language word
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// the arabic language word
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// the spanish language word
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// the frensh language word
  ///
  /// In en, this message translates to:
  /// **'Frensh'**
  String get frensh;

  /// the german language word
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// the turkish language word
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get turkish;

  /// the ok word
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// the back word `for backArrow icon tooltip`
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// the drawer icon tooltip`
  ///
  /// In en, this message translates to:
  /// **'Open navigation menu'**
  String get openNavigationMenu;

  /// the Error word
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// the Please Choose word
  ///
  /// In en, this message translates to:
  /// **'Please Choose'**
  String get pleaseChoose;

  /// the Camera word
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// the Gallery word
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// the Share word
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// the error if Trying To Share did not complete
  ///
  /// In en, this message translates to:
  /// **'An error happened while trying to share the image.'**
  String get errorHappenedWhileTryingToShareTheImage;

  /// the Save to gallery word
  ///
  /// In en, this message translates to:
  /// **'Save to gallery'**
  String get saveToGallery;

  /// the image saved to gallery word, basicly in imageScreen of imageContainer
  ///
  /// In en, this message translates to:
  /// **'Image saved to gallery'**
  String get imageSavedToGallery;

  /// the error if Trying To save to gallery did not complete
  ///
  /// In en, this message translates to:
  /// **'An error happened while saving the image to the gallery.'**
  String get errorHappenedWhileSavingTheImage;

  /// the Attention word
  ///
  /// In en, this message translates to:
  /// **'Attention'**
  String get attention;

  /// the response if you pressed the system navigation back button ON the scope of homeScreen
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit?'**
  String get doYouWantToExit;

  /// the Exit word
  ///
  /// In en, this message translates to:
  /// **' Exit '**
  String get exit;

  /// the Cancel word
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// the Copy code word, for code container
  ///
  /// In en, this message translates to:
  /// **'Copy code'**
  String get copyCode;

  /// the Copid! word
  ///
  /// In en, this message translates to:
  /// **'Copid!'**
  String get copid;

  /// the km word
  ///
  /// In en, this message translates to:
  /// **'km'**
  String get km;

  /// the meter word
  ///
  /// In en, this message translates to:
  /// **'meter'**
  String get meter;

  /// the response if `web link` is not valid
  ///
  /// In en, this message translates to:
  /// **'Link is Not valid'**
  String get linkIsNotvalid;

  /// the response if no internet connections
  ///
  /// In en, this message translates to:
  /// **'You are currently offline'**
  String get youAreCurrentlyOffline;

  /// the response if the linke is valid but not resolve as an image
  ///
  /// In en, this message translates to:
  /// **'Link doesn\'t point to an image'**
  String get linkDoesnotPointToImage;

  /// the response if `password formField in SignUp screen` is empty or less than 8 characters.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long, with at least 5 alphabet, 2 numbers, and 1 special character like '**
  String get passwordMustBeAtLeastWithDetails;

  /// one of possible errors in `password formField in SignUp screen`
  ///
  /// In en, this message translates to:
  /// **'5 alphabet characters'**
  String get fiveAlphabetCharacters;

  /// one of possible errors in `password formField in SignUp screen`
  ///
  /// In en, this message translates to:
  /// **'2 numbers'**
  String get twoNumbers;

  /// one of possible errors in `password formField in SignUp screen`
  ///
  /// In en, this message translates to:
  /// **'1 special charachters like '**
  String get oneSpecialCharachtersLike;

  /// one of possible errors in `password formField in SignUp screen`
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least'**
  String get passwordMustContainAtLeast;

  /// the comma seperator `,`
  ///
  /// In en, this message translates to:
  /// **', '**
  String get comma;

  /// the and word
  ///
  /// In en, this message translates to:
  /// **'And '**
  String get and;

  /// the Today word
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// the Yesterday word
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// the at word `for clocks` like **at 10:33 PM**
  ///
  /// In en, this message translates to:
  /// **'at'**
  String get at;

  /// the just now word
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get justNow;

  /// used for duration ago like: `3 years ago`
  ///
  /// In en, this message translates to:
  /// **'{durationInString} ago'**
  String durationAgo(String durationInString);

  /// used for duration from now like: `3 years from now`
  ///
  /// In en, this message translates to:
  /// **'{durationInString} from now'**
  String durationFromNow(String durationInString);

  /// the second word
  ///
  /// In en, this message translates to:
  /// **'second'**
  String get second;

  /// the 2 seconds word
  ///
  /// In en, this message translates to:
  /// **'2 seconds'**
  String get twoSeconds;

  /// number of seconds between 3 and 10 like: 3, 5 or 10 seconds
  ///
  /// In en, this message translates to:
  /// **'{numberOfSeconds} seconds'**
  String secondsBeteenThreeAndTen(int numberOfSeconds);

  /// number of seconds more than 10 like: 11 seconds
  ///
  /// In en, this message translates to:
  /// **'{numberOfSeconds} seconds'**
  String secondsMoreThanTen(int numberOfSeconds);

  /// the minute word
  ///
  /// In en, this message translates to:
  /// **'minute'**
  String get minute;

  /// the 2 minutes word
  ///
  /// In en, this message translates to:
  /// **'2 minutes'**
  String get twoMinutes;

  /// number of minutes between 3 and 10 like: 3, 5 or 10 minutes
  ///
  /// In en, this message translates to:
  /// **'{numberOfMinutes} minutes'**
  String minutesBeteenThreeAndTen(int numberOfMinutes);

  /// number of minutes more than 10 like: 11 minutes
  ///
  /// In en, this message translates to:
  /// **'{numberOfMinutes} minutes'**
  String minutesMoreThanTen(int numberOfMinutes);

  /// the hour word
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get hour;

  /// the 2 hours word
  ///
  /// In en, this message translates to:
  /// **'2 hours'**
  String get twoHours;

  /// number of hours between 3 and 10 like: 3, 5 or 10 hours
  ///
  /// In en, this message translates to:
  /// **'{numberOfHours} hours'**
  String hoursBeteenThreeAndTen(int numberOfHours);

  /// number of hours more than 10 like: 11 hours
  ///
  /// In en, this message translates to:
  /// **'{numberOfHours} hours'**
  String hoursMoreThanTen(int numberOfHours);

  /// the day word
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// the 2 days word
  ///
  /// In en, this message translates to:
  /// **'2 days'**
  String get twoDays;

  /// number of days between 3 and 10 like: 3, 5 or 10 days
  ///
  /// In en, this message translates to:
  /// **'{numberOfDays} days'**
  String daysBeteenThreeAndTen(int numberOfDays);

  /// number of days more than 10 like: 11 days
  ///
  /// In en, this message translates to:
  /// **'{numberOfDays} days'**
  String daysMoreThanTen(int numberOfDays);

  /// the week word
  ///
  /// In en, this message translates to:
  /// **'week'**
  String get week;

  /// the 2 weeks word
  ///
  /// In en, this message translates to:
  /// **'2 weeks'**
  String get twoWeeks;

  /// number of weeks between 3 and 10 like: 3, 5 or 10 weeks
  ///
  /// In en, this message translates to:
  /// **'{numberOfWeeks} weeks'**
  String weeksBeteenThreeAndTen(int numberOfWeeks);

  /// number of weeks more than 10 like: 11 weeks
  ///
  /// In en, this message translates to:
  /// **'{numberOfWeeks} weeks'**
  String weeksMoreThanTen(int numberOfWeeks);

  /// the month word
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// the 2 months word
  ///
  /// In en, this message translates to:
  /// **'2 months'**
  String get twoMonths;

  /// number of months between 3 and 10 like: 3, 5 or 10 months
  ///
  /// In en, this message translates to:
  /// **'{numberOfMonths} months'**
  String monthsBeteenThreeAndTen(int numberOfMonths);

  /// number of months more than 10 like: 11 months
  ///
  /// In en, this message translates to:
  /// **'{numberOfMonths} months'**
  String monthsMoreThanTen(int numberOfMonths);

  /// the year word
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get year;

  /// the 2 years word
  ///
  /// In en, this message translates to:
  /// **'2 years'**
  String get twoYears;

  /// number of years between 3 and 10 like: 3, 5 or 10 years
  ///
  /// In en, this message translates to:
  /// **'{numberOfYears} years'**
  String yearsBeteenThreeAndTen(int numberOfYears);

  /// number of years more than 10 like: 11 years
  ///
  /// In en, this message translates to:
  /// **'{numberOfYears} years'**
  String yearsMoreThanTen(int numberOfYears);

  /// the decade word
  ///
  /// In en, this message translates to:
  /// **'decade'**
  String get decade;

  /// the 2 decades word
  ///
  /// In en, this message translates to:
  /// **'2 decades'**
  String get twoDecades;

  /// number of decades between 3 and 10 like: 3, 5 or 10 decades
  ///
  /// In en, this message translates to:
  /// **'{numberOfDecades} decades'**
  String decadesBeteenThreeAndTen(int numberOfDecades);

  /// number of decades more than 10 like: 11 decades
  ///
  /// In en, this message translates to:
  /// **'{numberOfDecades} decades'**
  String decadesMoreThanTen(int numberOfDecades);

  /// the response if an `API` error
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again later.'**
  String get somethingWentWrongPleaseTryAgainLater;

  /// the response if an `API` error **No data**
  ///
  /// In en, this message translates to:
  /// **'Error happened, There is no data for that Account'**
  String get errorHappendThereIsNoDataForThatAccount;

  /// the response if error not associated with `API` directly
  ///
  /// In en, this message translates to:
  /// **'An unexpected error happened.'**
  String get unexpectedErrorHappened;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong!!'**
  String get somethingWentWrong;

  /// the response if error happened while trying to save file to local device storage in
  ///
  /// In en, this message translates to:
  /// **'Not able to save files to local device storage.'**
  String get notAbleToSaveFilesToLocalDeviceStorage;

  /// the response if error happened while trying to delete file to local device storage
  ///
  /// In en, this message translates to:
  /// **'Not able to delete files from local device storage.'**
  String get notAbleToDeleteFilesFromLocalDeviceStorage;

  /// the response if error happened while trying to read file from local device storage
  ///
  /// In en, this message translates to:
  /// **'Not Able To read data from Local Device'**
  String get notAbleToReadDataFromLocalDevice;

  /// the response if the result of web search filtered
  ///
  /// In en, this message translates to:
  /// **'Sorry, there is no result for your search, the result has been filtered.'**
  String get sorryThereIsNoResultForYourSearch;

  /// the response if the result of AI search filtered
  ///
  /// In en, this message translates to:
  /// **'**Sorry, there is no result for your search**\n\n* The result has been filtered.\n* Or you are searching with a **language** that is not supported yet.'**
  String get sorryThereIsNoResultForYourSearchWithDetails;

  /// the response if error happened while trying to save data to local device storage
  ///
  /// In en, this message translates to:
  /// **'Not Able To Save data To Local Device'**
  String get notAbleToSaveDataToLocalDevice;

  /// the home button of menue screen
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// the profile button of menue screen
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// title in `_SETTINGS_SCREENS`
  ///
  /// In en, this message translates to:
  /// **'Meals Settings'**
  String get mealsSettings;

  /// title in `_SETTINGS_SCREENS`
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettings;

  /// title of settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// the Share The App word
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareTheApp;

  /// share text of share the app button in menue screen
  ///
  /// In en, this message translates to:
  /// **'           AI MealMingle App\nDownload from the Play Store\n\nhttps://play.google.com/store/apps/details?id=com.salahalshafey.aimealmingle'**
  String get shareTheAppText;

  /// the about button of menue screen
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// the log out button of menue screen
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// the Sign In button of menue screen 'guest view'
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// the tilte of `meals settings screen`
  ///
  /// In en, this message translates to:
  /// **'Adjust your Meals Selection'**
  String get adjustYourMealsSelection;

  /// one setting of `meals settings screen`
  ///
  /// In en, this message translates to:
  /// **'Gluten-Free'**
  String get glutenfree;

  /// one setting of `meals settings screen`
  ///
  /// In en, this message translates to:
  /// **'Lactose-Free'**
  String get lactosefree;

  /// one setting of `meals settings screen`
  ///
  /// In en, this message translates to:
  /// **'Vegetarian'**
  String get vegetarian;

  /// one setting of `meals settings screen`
  ///
  /// In en, this message translates to:
  /// **'Vegan'**
  String get vegan;

  /// Display {mealType} meals, like: Display Vegan Meals
  ///
  /// In en, this message translates to:
  /// **'Display {mealType} Meals'**
  String displayMealTypeMeals(String mealType);

  /// subtitle of Language in `_SETTINGS_SCREENS`
  ///
  /// In en, this message translates to:
  /// **'Display Arabic Language'**
  String get displayArabicLanguage;

  /// subtitle of ThemeMode in `_SETTINGS_SCREENS`
  ///
  /// In en, this message translates to:
  /// **'Display Dark Theme'**
  String get displayDarkTheme;

  /// the color word
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// the reset to default tooltip in `_SETTINGS_SCREEN`
  ///
  /// In en, this message translates to:
  /// **'Reset to default'**
  String get resetToDefault;

  /// theme text of settings screen
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// theme mode text of settings screen
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// System default of theme
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// Light mode of theme
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// Dark mode of theme
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// the language word
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// the notifications word
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// tooltip Change to Language of sign in screen
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// tooltip Change to Light Mode of ToggleThemeButton
  ///
  /// In en, this message translates to:
  /// **'Change to Light Mode'**
  String get changeToLightMode;

  /// tooltip Change to Dark Mode of ToggleThemeButton
  ///
  /// In en, this message translates to:
  /// **'Change to Dark Mode'**
  String get changeToDarkMode;

  /// the default word
  ///
  /// In en, this message translates to:
  /// **'default'**
  String get defaultWord;

  /// the All Languages word
  ///
  /// In en, this message translates to:
  /// **'All Languages'**
  String get allLanguages;

  /// one of the questions of Food Scanning
  ///
  /// In en, this message translates to:
  /// **'Act as a nutritionist with 30 years of experience in the field. What is in this image? And how many calories are in it?\n\n'**
  String get actAsANutritionistWithYearsOfExperienceInTheField;

  /// one of the questions of Food Scanning
  ///
  /// In en, this message translates to:
  /// **'Is this food considered Healthy? Explain The benefits of this food in detail and Why?\nIf there is more than one item, \"Give the result in table format for each item\".'**
  String get isThisFoodConsideredHealthyExplainTheBenefits;

  /// one of the questions of Food Scanning
  ///
  /// In en, this message translates to:
  /// **'Please give me the following Nutrition Facts: \n-  Calories.\n-  Proteins (g).\n-  Fats (g).\n-  What Vitamins are in it?\n-  Carbohydrates (g).\n-  Sodium (mg).\n-  Potassium (mg).\n-  and more...\n\nIf there is more than one item, \"Give the result in table format for each item and the overall (sum) of the results of all the above\".'**
  String get pleaseGiveMeTheFollowingNutritionFacts;

  /// one of the questions of Food Scanning
  ///
  /// In en, this message translates to:
  /// **'Please answer the following:\n-  Does this food contain \"Pork or Alcohol\"?\n-  Does this food contain \"Gluten\"?\n-  Does this food contain Lactose?\n-  Is this food considered \"Vegetarian\"?\n-  Is this food considered \"Vegan\"?\n-  and more...\n\nIf there is more than one item, \"Give the result in table format for each item and the overall (sum) of the results of all the above\".'**
  String get pleaseAnswerTheFollowingnDoesThisFoodContain;

  /// one of the questions of Food Scanning
  ///
  /// In en, this message translates to:
  /// **'How to prepare this food?\n\nIf there is more than one item, \"Give the result for each item\".'**
  String
  get howToPrepareThisFoodnnifThereIsMoreThanOneItemGiveTheResultForEachItem;

  /// the Scan Food With AI word
  ///
  /// In en, this message translates to:
  /// **'Scan Food With AI'**
  String get scanFoodWithAi;

  /// the Scan Food word
  ///
  /// In en, this message translates to:
  /// **'Scan Food'**
  String get scanFood;

  /// the Favorites word
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// the button in `FOOD_SCAN_SCREEN`
  ///
  /// In en, this message translates to:
  /// **'Get Image to Scan'**
  String get getImageToScan;

  /// when no favorites yet
  ///
  /// In en, this message translates to:
  /// **'You Have no Favorites yet - Start Adding Some!'**
  String get youHaveNoFavoritesYetStartAddingSome;

  /// one of the titles of the food scan result
  ///
  /// In en, this message translates to:
  /// **'Unveiling Contents and Caloric Breakdown'**
  String get unveilingContentsAndCaloricBreakdown;

  /// one of the titles of the food scan result
  ///
  /// In en, this message translates to:
  /// **'Healthiness and Benefits of Featured Foods'**
  String get healthinessAndBenefitsOfFeaturedFoods;

  /// one of the titles of the food scan result
  ///
  /// In en, this message translates to:
  /// **'Facts and Summaries'**
  String get factsAndSummaries;

  /// one of the titles of the food scan result
  ///
  /// In en, this message translates to:
  /// **'Unveiling Dietary Preferences and Status'**
  String get unveilingDietaryPreferencesAndStatus;

  /// one of the titles of the food scan result
  ///
  /// In en, this message translates to:
  /// **'How to Prepare it at Home'**
  String get howToPrepareItAtHome;

  /// the Overview word, one of the taps in `FoodScanScreens`
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// one of the taps in `FoodScanScreens`
  ///
  /// In en, this message translates to:
  /// **'Nutritional Evaluation'**
  String get nutritionalEvaluation;

  /// one of the taps in `FoodScanScreens`
  ///
  /// In en, this message translates to:
  /// **'Comprehensive Nutrition Analysis'**
  String get comprehensiveNutritionAnalysis;

  /// one of the taps in `FoodScanScreens`
  ///
  /// In en, this message translates to:
  /// **'Ingredient Inquiry'**
  String get ingredientInquiry;

  /// one of the taps in `FoodScanScreens`
  ///
  /// In en, this message translates to:
  /// **'How To Prepare It'**
  String get howToPrepareIt;

  /// the Confirm Remove? word
  ///
  /// In en, this message translates to:
  /// **'Confirm Remove?'**
  String get confirmRemove;

  /// dialog when trying to delete a scan result from favorites
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this Scan result from Favorites?'**
  String get areYouSureYouWantToRemoveThisScanResultFromFavorites;

  /// the Remove word
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// tooltip of button
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromFavorites;

  /// tooltip of button
  ///
  /// In en, this message translates to:
  /// **'Save to favorites'**
  String get saveToFavorites;

  /// tooltip of button
  ///
  /// In en, this message translates to:
  /// **'Share as PDF'**
  String get shareAsPdf;

  /// one of the states when sharing the food scan result as a PDF
  ///
  /// In en, this message translates to:
  /// **'Taking screenshots of the results...'**
  String get takingScreenshotsOfTheResults;

  /// one of the states when sharing the food scan result as a PDF
  ///
  /// In en, this message translates to:
  /// **'Converting screenshots to PDF...'**
  String get convertingScreenshotsToPdf;

  /// one of the states when sharing the food scan result as a PDF
  ///
  /// In en, this message translates to:
  /// **'Preparing the PDF to be saved at Desktop...'**
  String get preparingThePdfToBeSavedAtDesktop;

  /// one of the states when sharing the food scan result as a PDF
  ///
  /// In en, this message translates to:
  /// **'Preparing the PDF to Share...'**
  String get preparingThePdfToShare;

  /// one of the states when sharing the food scan result as a PDF
  ///
  /// In en, this message translates to:
  /// **'Error happened, Couldn\'t share the PDF!!!'**
  String get errorHappenedCouldntShareThePdf;

  /// the Search word
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// the Scan Food With AI word
  ///
  /// In en, this message translates to:
  /// **'Search Meals Using AI'**
  String get searchMealsUsingAi;

  /// the Scan Food With AI word
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// the Meals word
  ///
  /// In en, this message translates to:
  /// **'Meals'**
  String get meals;

  /// the INGREDIENTS word
  ///
  /// In en, this message translates to:
  /// **'INGREDIENTS'**
  String get ingredients;

  /// the RECIPE word
  ///
  /// In en, this message translates to:
  /// **'RECIPE'**
  String get recipe;

  /// greeting like: `Hi Ahmed 👋 `
  ///
  /// In en, this message translates to:
  /// **'Hi {name} 👋 '**
  String hi(String name);

  /// question on the appbar of taps screen
  ///
  /// In en, this message translates to:
  /// **'WHAT DO YOU WANT TO EAT ?'**
  String get whatDoYouWantToEat;

  /// the CATEGORIES word
  ///
  /// In en, this message translates to:
  /// **'CATEGORIES'**
  String get categories;

  /// the in dialog of trying to remove a meal from favorites
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this Meal from Favorites?'**
  String get areYouSureYouWantToRemoveThisMealFromFavorites;

  /// title of the about screen
  ///
  /// In en, this message translates to:
  /// **'App Overview'**
  String get appOverview;

  /// the details of the abb Overview in about screen
  ///
  /// In en, this message translates to:
  /// **'**Breast Cancer Awareness app** is a comprehensive tool designed to raise awareness and promote early detection of breast cancer. It addresses four key aspects: providing `information and awareness`, facilitating `self-examination` through a symptom checker, assisting doctors with `deep learning models` for detection, and offering support `resources` and `guidance` for patients.\n* **Purpose:** The app was created with the primary goal of empowering individuals to take charge of their breast health. By amalgamating information, self-examination tools, advanced detection models, and supportive resources, we aim to contribute to the early detection and management of breast cancer.\n* **Target Audience:** Our target audience spans a wide range, including individuals of all genders interested in breast health awareness, those performing self-examinations, medical professionals seeking advanced diagnostic tools, and patients in need of support and guidance.\n\n**Key Features**\n* **Information Hub:** Accessible information on breast cancer, its symptoms, risk factors, and preventive measures.\n* **Symptom Checker:** An interactive self-examination tool guiding users through the detection of potential symptoms.\n* **Deep Learning Models:** Advanced AI models for doctors, aiding in the detection of breast cancer from mammogram and histopathology images.\n* **Patient Support:** Nutrition, diet, and exercise guidance, along with a chatbot providing answers and guidance through text-to-speech and speech-to-text capabilities.\n\n**Data and Research**\n* **The Breast Cancer Awareness app** is built on a foundation of thorough research and collaboration with medical professionals. We\'ve incorporated insights from reputable studies and partnered with experts in the field to develop the deep learning models. The app\'s content is curated based on evidence-based information to ensure accuracy and reliability.\n\n**Contact and App Privacy**'**
  String get appOverviewdetailed;

  /// contact Us through email in about screen
  ///
  /// In en, this message translates to:
  /// **'Contact us through this email:'**
  String get contactUs;

  /// the app word
  ///
  /// In en, this message translates to:
  /// **'App '**
  String get app;

  /// the privacy Policy word
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// the terms of service word
  ///
  /// In en, this message translates to:
  /// **'Terms Of Service'**
  String get termsOfService;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
