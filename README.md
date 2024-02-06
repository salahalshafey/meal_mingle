# AI MealMingle



## A Flutter project is mainly used for 
* Scan The Food to analyze what is in it Using `AI` by doing the following:
    * Unveiling Contents and Caloric Breakdown.
    * Healthiness and Benefits of Featured Foods.
    * Facts and Summaries.
    * Unveiling Dietary Preferences and Status.
    * How to Prepare it at Home.
* Ability to save this scan result in a `local database`.
* Ability to share this scan result as a `PDF`.
* Searching Meals and Get Recipes Using `AI`.



## Download the app from the Play Store
<a href="https://play.google.com/store/apps/details?id=com.salahalshafey.aimealmingle"><img src="https://playerzon.com/asset/download.png" width="300"></img></a>



# The main Technologies & Packages/Plugins used in the App
  * Using [hive](https://pub.dev/packages/hive) as a local Database:
    * `hive_generator` to generate `Adapters` to work with custom data types.
  * Using [json_serializable](https://pub.dev/packages/json_serializable) To generate to/from JSON code for a class.
  * Using `Large Language Model` API from Google [Gemini Pro Vision](https://makersuite.google.com/app/prompts/new_freeform) for `Freeform Prompt` and `Image Recognizing`.
  * Using `Large Language Model` API from Google [Gemini Pro](https://makersuite.google.com/app/prompts/new_chat) for `Chat Prompt`.
  * Using [screenshot](https://pub.dev/packages/screenshot) to capture widgets as Images `Food Scan results`.
  * Using [pdf](https://pub.dev/packages/pdf) to create a full multi-pages document with this `screenshots images`.
  * Using [share_plus](https://pub.dev/packages/share_plus) to `share the PDF`.
  * The app supports `Localizations` in `Arabic` and `English`:
  * The app supports `Theming` for `Light` and `Dark`.
  * The app supports `12 different colors` scheme, the user can change it in `settings`.
  * Using `Web Scraping` using [html](https://pub.dev/packages/html) the dom package. 
    * To scrape Wikipedia images to get `food and ingredients` images.
    * Ability to `scale` the images.
  * Using [path_provider](https://pub.dev/packages/path_provider) plugin to save The files `images` in `ApplicationDocumentsDirectory`.
  * Using [url_launcher](https://pub.dev/packages/url_launcher) plugin.
  * Using [flutter_markdown](https://pub.dev/packages/flutter_markdown) to renders Markdown `for AI responses`.
  * The `Animation` in the App is done Using [flutter_animate](https://pub.dev/packages/flutter_animate) Package.



# The App Architecture, Directory structure, And State Management
  * Using `Provider` State Management.
  * Using `get_it` for Dependency injection.
  * Using Model–view–viewmodel `MVVM` architectural pattern.

    ![FLUTTER-MVVM-ARCHITECTURE](https://github.com/salahalshafey/meal_mingle/assets/64344500/d80d32e7-9ab1-4046-a35a-c2f56c1c59f6)
 
## Directory Structure
```
lib
│
│───main.dart
│───l10n
│  
└───src
    │
    │───core
    |    |
    |    |──error
    |    │──network
    |    │──theme
    |    |   │──colors
    |    |   │──dark_theme
    |    |   └──light_theme   
    |    |
    |    └──util
    |        |──builders
    |        │──classes
    |        │──extensions
    |        │──functions
    |        └──widgets   
    |    
    │───features
    |    |
    |    |──food_scanning
    |    │──meals
    |    └──home_and_drawers_screens
    |
    │───app.dart      
    └───injection_container.dart
```
### Example of One feature: `food_scanning`
```
│───features
         |
         │──food_scanning
         |   |
         |   |──data
         |   |   |
         |   |   |──models
         |   |   |   └──food_scanning_result_model.dart
         |   |   |
         |   |   └──services
         |   |       |
         |   |       |──favorite_food_scanning_local_data_service.dart
         |   |       |──favorite_food_scanning_local_storage_service.dart
         |   |       └──food_scanning_service.dart
         |   |   
         |   │──viemodels
         |   |   |
         |   |   |──favorite_food_scanning_viewmodel.dart
         |   |   └──food_scanning_viewmodel.dart 
         |   |   
         |   └──views
         |       |
         |       |──screens
         |       |   |──all_favorite_food_scan_screen.dart
         |       |   |──favorite_food_scan_screen.dart
         |       |   |──food_scan_result_screen.dart
         |       |   └──food_scan_screen.dart
         |       |
         |       |──providers
         |       |   |──convert_image_to_png.dart
         |       |   |──favorites_food_scan.dart
         |       |   └──food_scan.dart
         |       | 
         |       └──widgets
         |           |──favorite_food_scan
         |           |──food_scan
         |           |──share_as_pdf
         |           |──custom_tap.dart
         |           |──customized_markdown.dart
         |           |──image_and_choices_appbar.dart
         |           └──overview_result.dart
         |       
         |      
         |
         │──meals
         └──home_and_drawers_screens
``` 
