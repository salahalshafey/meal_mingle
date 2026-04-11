// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get spanish => 'Spanish';

  @override
  String get frensh => 'Frensh';

  @override
  String get german => 'German';

  @override
  String get turkish => 'Turkish';

  @override
  String get ok => 'Ok';

  @override
  String get back => 'Back';

  @override
  String get openNavigationMenu => 'Open navigation menu';

  @override
  String get error => 'Error';

  @override
  String get pleaseChoose => 'Please Choose';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get share => 'Share';

  @override
  String get errorHappenedWhileTryingToShareTheImage =>
      'An error happened while trying to share the image.';

  @override
  String get saveToGallery => 'Save to gallery';

  @override
  String get imageSavedToGallery => 'Image saved to gallery';

  @override
  String get errorHappenedWhileSavingTheImage =>
      'An error happened while saving the image to the gallery.';

  @override
  String get attention => 'Attention';

  @override
  String get doYouWantToExit => 'Do you want to exit?';

  @override
  String get exit => ' Exit ';

  @override
  String get cancel => 'Cancel';

  @override
  String get copyCode => 'Copy code';

  @override
  String get copid => 'Copid!';

  @override
  String get km => 'km';

  @override
  String get meter => 'meter';

  @override
  String get linkIsNotvalid => 'Link is Not valid';

  @override
  String get youAreCurrentlyOffline => 'You are currently offline';

  @override
  String get linkDoesnotPointToImage => 'Link doesn\'t point to an image';

  @override
  String get passwordMustBeAtLeastWithDetails =>
      'Password must be at least 8 characters long, with at least 5 alphabet, 2 numbers, and 1 special character like ';

  @override
  String get fiveAlphabetCharacters => '5 alphabet characters';

  @override
  String get twoNumbers => '2 numbers';

  @override
  String get oneSpecialCharachtersLike => '1 special charachters like ';

  @override
  String get passwordMustContainAtLeast => 'Password must contain at least';

  @override
  String get comma => ', ';

  @override
  String get and => 'And ';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get at => 'at';

  @override
  String get justNow => 'just now';

  @override
  String durationAgo(String durationInString) {
    return '$durationInString ago';
  }

  @override
  String durationFromNow(String durationInString) {
    return '$durationInString from now';
  }

  @override
  String get second => 'second';

  @override
  String get twoSeconds => '2 seconds';

  @override
  String secondsBeteenThreeAndTen(int numberOfSeconds) {
    return '$numberOfSeconds seconds';
  }

  @override
  String secondsMoreThanTen(int numberOfSeconds) {
    return '$numberOfSeconds seconds';
  }

  @override
  String get minute => 'minute';

  @override
  String get twoMinutes => '2 minutes';

  @override
  String minutesBeteenThreeAndTen(int numberOfMinutes) {
    return '$numberOfMinutes minutes';
  }

  @override
  String minutesMoreThanTen(int numberOfMinutes) {
    return '$numberOfMinutes minutes';
  }

  @override
  String get hour => 'hour';

  @override
  String get twoHours => '2 hours';

  @override
  String hoursBeteenThreeAndTen(int numberOfHours) {
    return '$numberOfHours hours';
  }

  @override
  String hoursMoreThanTen(int numberOfHours) {
    return '$numberOfHours hours';
  }

  @override
  String get day => 'day';

  @override
  String get twoDays => '2 days';

  @override
  String daysBeteenThreeAndTen(int numberOfDays) {
    return '$numberOfDays days';
  }

  @override
  String daysMoreThanTen(int numberOfDays) {
    return '$numberOfDays days';
  }

  @override
  String get week => 'week';

  @override
  String get twoWeeks => '2 weeks';

  @override
  String weeksBeteenThreeAndTen(int numberOfWeeks) {
    return '$numberOfWeeks weeks';
  }

  @override
  String weeksMoreThanTen(int numberOfWeeks) {
    return '$numberOfWeeks weeks';
  }

  @override
  String get month => 'month';

  @override
  String get twoMonths => '2 months';

  @override
  String monthsBeteenThreeAndTen(int numberOfMonths) {
    return '$numberOfMonths months';
  }

  @override
  String monthsMoreThanTen(int numberOfMonths) {
    return '$numberOfMonths months';
  }

  @override
  String get year => 'year';

  @override
  String get twoYears => '2 years';

  @override
  String yearsBeteenThreeAndTen(int numberOfYears) {
    return '$numberOfYears years';
  }

  @override
  String yearsMoreThanTen(int numberOfYears) {
    return '$numberOfYears years';
  }

  @override
  String get decade => 'decade';

  @override
  String get twoDecades => '2 decades';

  @override
  String decadesBeteenThreeAndTen(int numberOfDecades) {
    return '$numberOfDecades decades';
  }

  @override
  String decadesMoreThanTen(int numberOfDecades) {
    return '$numberOfDecades decades';
  }

  @override
  String get somethingWentWrongPleaseTryAgainLater =>
      'Something went wrong, please try again later.';

  @override
  String get errorHappendThereIsNoDataForThatAccount =>
      'Error happened, There is no data for that Account';

  @override
  String get unexpectedErrorHappened => 'An unexpected error happened.';

  @override
  String get somethingWentWrong => 'Something went wrong!!';

  @override
  String get notAbleToSaveFilesToLocalDeviceStorage =>
      'Not able to save files to local device storage.';

  @override
  String get notAbleToDeleteFilesFromLocalDeviceStorage =>
      'Not able to delete files from local device storage.';

  @override
  String get notAbleToReadDataFromLocalDevice =>
      'Not Able To read data from Local Device';

  @override
  String get sorryThereIsNoResultForYourSearch =>
      'Sorry, there is no result for your search, the result has been filtered.';

  @override
  String get sorryThereIsNoResultForYourSearchWithDetails =>
      '**Sorry, there is no result for your search**\n\n* The result has been filtered.\n* Or you are searching with a **language** that is not supported yet.';

  @override
  String get notAbleToSaveDataToLocalDevice =>
      'Not Able To Save data To Local Device';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get mealsSettings => 'Meals Settings';

  @override
  String get generalSettings => 'General Settings';

  @override
  String get settings => 'Settings';

  @override
  String get shareTheApp => 'Share';

  @override
  String get shareTheAppText =>
      '           AI MealMingle App\nDownload from the Play Store\n\nhttps://play.google.com/store/apps/details?id=com.salahalshafey.aimealmingle';

  @override
  String get about => 'About';

  @override
  String get logout => 'Log out';

  @override
  String get signIn => 'Sign In';

  @override
  String get adjustYourMealsSelection => 'Adjust your Meals Selection';

  @override
  String get glutenfree => 'Gluten-Free';

  @override
  String get lactosefree => 'Lactose-Free';

  @override
  String get vegetarian => 'Vegetarian';

  @override
  String get vegan => 'Vegan';

  @override
  String displayMealTypeMeals(String mealType) {
    return 'Display $mealType Meals';
  }

  @override
  String get displayArabicLanguage => 'Display Arabic Language';

  @override
  String get displayDarkTheme => 'Display Dark Theme';

  @override
  String get color => 'Color';

  @override
  String get resetToDefault => 'Reset to default';

  @override
  String get theme => 'Theme';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get systemDefault => 'System default';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get notifications => 'Notifications';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get changeToLightMode => 'Change to Light Mode';

  @override
  String get changeToDarkMode => 'Change to Dark Mode';

  @override
  String get defaultWord => 'default';

  @override
  String get allLanguages => 'All Languages';

  @override
  String get actAsANutritionistWithYearsOfExperienceInTheField =>
      'Act as a nutritionist with 30 years of experience in the field. What is in this image? And how many calories are in it?\n\n';

  @override
  String get isThisFoodConsideredHealthyExplainTheBenefits =>
      'Is this food considered Healthy? Explain The benefits of this food in detail and Why?\nIf there is more than one item, \"Give the result in table format for each item\".';

  @override
  String get pleaseGiveMeTheFollowingNutritionFacts =>
      'Please give me the following Nutrition Facts: \n-  Calories.\n-  Proteins (g).\n-  Fats (g).\n-  What Vitamins are in it?\n-  Carbohydrates (g).\n-  Sodium (mg).\n-  Potassium (mg).\n-  and more...\n\nIf there is more than one item, \"Give the result in table format for each item and the overall (sum) of the results of all the above\".';

  @override
  String get pleaseAnswerTheFollowingnDoesThisFoodContain =>
      'Please answer the following:\n-  Does this food contain \"Pork or Alcohol\"?\n-  Does this food contain \"Gluten\"?\n-  Does this food contain Lactose?\n-  Is this food considered \"Vegetarian\"?\n-  Is this food considered \"Vegan\"?\n-  and more...\n\nIf there is more than one item, \"Give the result in table format for each item and the overall (sum) of the results of all the above\".';

  @override
  String
  get howToPrepareThisFoodnnifThereIsMoreThanOneItemGiveTheResultForEachItem =>
      'How to prepare this food?\n\nIf there is more than one item, \"Give the result for each item\".';

  @override
  String get scanFoodWithAi => 'Scan Food With AI';

  @override
  String get scanFood => 'Scan Food';

  @override
  String get favorites => 'Favorites';

  @override
  String get getImageToScan => 'Get Image to Scan';

  @override
  String get youHaveNoFavoritesYetStartAddingSome =>
      'You Have no Favorites yet - Start Adding Some!';

  @override
  String get unveilingContentsAndCaloricBreakdown =>
      'Unveiling Contents and Caloric Breakdown';

  @override
  String get healthinessAndBenefitsOfFeaturedFoods =>
      'Healthiness and Benefits of Featured Foods';

  @override
  String get factsAndSummaries => 'Facts and Summaries';

  @override
  String get unveilingDietaryPreferencesAndStatus =>
      'Unveiling Dietary Preferences and Status';

  @override
  String get howToPrepareItAtHome => 'How to Prepare it at Home';

  @override
  String get overview => 'Overview';

  @override
  String get nutritionalEvaluation => 'Nutritional Evaluation';

  @override
  String get comprehensiveNutritionAnalysis =>
      'Comprehensive Nutrition Analysis';

  @override
  String get ingredientInquiry => 'Ingredient Inquiry';

  @override
  String get howToPrepareIt => 'How To Prepare It';

  @override
  String get confirmRemove => 'Confirm Remove?';

  @override
  String get areYouSureYouWantToRemoveThisScanResultFromFavorites =>
      'Are you sure you want to remove this Scan result from Favorites?';

  @override
  String get remove => 'Remove';

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String get saveToFavorites => 'Save to favorites';

  @override
  String get shareAsPdf => 'Share as PDF';

  @override
  String get takingScreenshotsOfTheResults =>
      'Taking screenshots of the results...';

  @override
  String get convertingScreenshotsToPdf => 'Converting screenshots to PDF...';

  @override
  String get preparingThePdfToBeSavedAtDesktop =>
      'Preparing the PDF to be saved at Desktop...';

  @override
  String get preparingThePdfToShare => 'Preparing the PDF to Share...';

  @override
  String get errorHappenedCouldntShareThePdf =>
      'Error happened, Couldn\'t share the PDF!!!';

  @override
  String get search => 'Search';

  @override
  String get searchMealsUsingAi => 'Search Meals Using AI';

  @override
  String get clear => 'Clear';

  @override
  String get meals => 'Meals';

  @override
  String get ingredients => 'INGREDIENTS';

  @override
  String get recipe => 'RECIPE';

  @override
  String hi(String name) {
    return 'Hi $name 👋 ';
  }

  @override
  String get whatDoYouWantToEat => 'WHAT DO YOU WANT TO EAT ?';

  @override
  String get categories => 'CATEGORIES';

  @override
  String get areYouSureYouWantToRemoveThisMealFromFavorites =>
      'Are you sure you want to remove this Meal from Favorites?';

  @override
  String get appOverview => 'App Overview';

  @override
  String get appOverviewdetailed =>
      '**Breast Cancer Awareness app** is a comprehensive tool designed to raise awareness and promote early detection of breast cancer. It addresses four key aspects: providing `information and awareness`, facilitating `self-examination` through a symptom checker, assisting doctors with `deep learning models` for detection, and offering support `resources` and `guidance` for patients.\n* **Purpose:** The app was created with the primary goal of empowering individuals to take charge of their breast health. By amalgamating information, self-examination tools, advanced detection models, and supportive resources, we aim to contribute to the early detection and management of breast cancer.\n* **Target Audience:** Our target audience spans a wide range, including individuals of all genders interested in breast health awareness, those performing self-examinations, medical professionals seeking advanced diagnostic tools, and patients in need of support and guidance.\n\n**Key Features**\n* **Information Hub:** Accessible information on breast cancer, its symptoms, risk factors, and preventive measures.\n* **Symptom Checker:** An interactive self-examination tool guiding users through the detection of potential symptoms.\n* **Deep Learning Models:** Advanced AI models for doctors, aiding in the detection of breast cancer from mammogram and histopathology images.\n* **Patient Support:** Nutrition, diet, and exercise guidance, along with a chatbot providing answers and guidance through text-to-speech and speech-to-text capabilities.\n\n**Data and Research**\n* **The Breast Cancer Awareness app** is built on a foundation of thorough research and collaboration with medical professionals. We\'ve incorporated insights from reputable studies and partnered with experts in the field to develop the deep learning models. The app\'s content is curated based on evidence-based information to ensure accuracy and reliability.\n\n**Contact and App Privacy**';

  @override
  String get contactUs => 'Contact us through this email:';

  @override
  String get app => 'App ';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms Of Service';
}
