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
<a href="https://play.google.com/store/apps/details?id=com.salahalshafey.aimealmingle"><img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" width="300"></img></a>


## Download the app For Windows
<a href="https://github.com/salahalshafey/apps_for_download/raw/main/windows%20apps/AI_MealMingle.exe"><img src="https://get.todoist.help/hc/article_attachments/4403191721234/WindowsButton.svg" width="300"></img></a>




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



# App pages

## Food Scan Screens

  Food Scan Screen              |     Getting Image      |  Scan Result Screen
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/salahalshafey/meal_mingle/assets/64344500/1353ba22-1218-4e35-a455-5dbce946ba30)|![](https://github.com/salahalshafey/meal_mingle/assets/64344500/772737c2-0406-49f5-8dc5-0abdef05f895)|![](https://github.com/salahalshafey/meal_mingle/assets/64344500/dbfff3aa-00f4-4768-9ba8-5c06028d26db)

  Waiting for results              |     The results in `Markdown`      |  The result can be saved in `Favorites`
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/salahalshafey/meal_mingle/assets/64344500/9af15813-8351-434f-bd08-be941464e5c1)|![](https://github.com/salahalshafey/meal_mingle/assets/64344500/5208b6fc-5136-4bc5-8cbc-afa94ea1c227)|![](https://github.com/salahalshafey/meal_mingle/assets/64344500/59a5f418-06ee-4da3-b721-7bf8e65f9270)

  The result can be shared as PDF              |     The PDF can be shared to external apps   
:-------------------------:|:-------------------------:
![](https://github.com/salahalshafey/meal_mingle/assets/64344500/20d01b46-5b47-4983-9895-8d02a6f3c1a6)|![](https://github.com/salahalshafey/meal_mingle/assets/64344500/86889153-0819-4414-8904-0683f88f35a3)








