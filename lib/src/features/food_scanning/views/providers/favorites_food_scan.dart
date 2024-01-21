import 'package:flutter/material.dart';

import '../../../../core/error/error_exceptions_with_message.dart';
import '../../../../core/error/exceptions_without_message.dart';
import '../../data/models/food_scanning_result_model.dart';
import '../../viewmodels/favorite_food_scanning_viewmodel.dart';
import '../../viewmodels/food_scanning_viewmodel.dart';

class FavoritesFoodScan extends ChangeNotifier {
  final FoodScanningViewModel foodScanningViewModel;
  final FavoriteFoodScanningViewmodel favoriteFoodScanningViewmodel;

  FavoritesFoodScan({
    required this.foodScanningViewModel,
    required this.favoriteFoodScanningViewmodel,
  });

  final List<String> _questionsChoices = const [
    """Is this food considered Healthy? Explain The benefits of this food in detail and Why?
If there is more than one item, "Give the result in table format for each item".""",
    """Please give me the following Nutrition Facts: 
-  Calories.
-  Proteins (g).
-  Fats (g). 
-  What Vitamins are in it?
-  Carbohydrates (g).
-  Sodium (mg).
-  Potassium (mg).
-  and more...

If there is more than one item, "Give the result in table format for each item and the overall (sum) of the results of all the above".""",
    """Please answer the following:

-  Does this food contain "Pork or Alcohol"?
-  Does this food contain "Gluten"?
-  Does this food contain Lactose?
-  Is this food considered "Vegetarian"?
-  Is this food considered "Vegan"?
-  and more...

If there is more than one item, "Give the result in table format for each item and the overall (sum) of the results of all the above".
""",
    """How to prepare this food?

If there is more than one item, "Give the result for each item".""",
  ];

  List<FoodScanningResultModel> _allFavorites = [];

  Future<void> fetchAllFavorites() async {
    try {
      _allFavorites = await favoriteFoodScanningViewmodel.getAllFavorite();

      // the last added is first
      _allFavorites.sort((m1, m2) => m2.dateTime.compareTo(m1.dateTime));

      notifyListeners();
    } on LocalDataException {
      throw ErrorMessage("Not Able To read data from Local Device");
    } catch (error) {
      throw ErrorMessage("Unexpected Error Happened");
    }
  }

  List<FoodScanningResultModel> get allFavorites => [..._allFavorites];

  FoodScanningResultModel getFavoriteById(String id) =>
      _allFavorites.firstWhere((element) => element.id == id);

  Future<String> getfoodMoreDetails(
      String favoriteId, int questionIndex) async {
    final favoriteIndex = _allFavorites
        .indexWhere((favoriteModel) => favoriteModel.id == favoriteId);
    final questionsResults = _allFavorites[favoriteIndex].questionsResults;

    if (questionsResults[questionIndex] != null) {
      return questionsResults[questionIndex]!;
    }

    try {
      questionsResults[questionIndex] =
          await foodScanningViewModel.foodMoreDetails(
        _allFavorites[favoriteIndex].imagePath,
        _allFavorites[favoriteIndex].resultOverview,
        _questionsChoices[questionIndex],
      );

      notifyListeners();

      await _updateFavorite(_allFavorites[favoriteIndex]);

      return questionsResults[questionIndex]!;
    } on OfflineException {
      throw ErrorMessage(
          "You Are Currently Offline!!" //AppLocalizations.of(_context)!.youAreCurrentlyOffline,
          );
    } on ServerException {
      throw ErrorMessage(
          "Something Went Wrong Please Try Again Later!!" //AppLocalizations.of(_context)!.somethingWentWrongPleaseTryAgainLater,
          );
    } on FilterException {
      throw ErrorMessage(
          "Sorry There Is No Result For Your Scan" //AppLocalizations.of(_context)!.sorryThereIsNoResultForYourSearch,
          );
    } on ErrorMessage {
      rethrow;
    } catch (error) {
      throw ErrorMessage(
          "Unexpected Error Happened" //AppLocalizations.of(_context)!.unexpectedErrorHappened,
          );
    }
  }

  Future<void> _updateFavorite(FoodScanningResultModel favoriteModel) async {
    try {
      await favoriteFoodScanningViewmodel.updateFavoirte(favoriteModel);
    } on LocalDataException {
      throw ErrorMessage("Not Able To Save data To Local Device");
    } on LocalStorageException {
      throw ErrorMessage("Not Able To Save Files To Local Device Storage");
    } catch (error) {
      throw ErrorMessage("Unexpected Error Happened");
    }
  }

  Future<void> deleteFavorite(String favoriteId) async {
    try {
      //  await favoriteFoodScanningViewmodel.deleteFavorite(favoriteId);

      _allFavorites
          .removeWhere((favoriteModel) => favoriteModel.id == favoriteId);

      notifyListeners();
    } on LocalDataException {
      throw ErrorMessage("Not Able To Delete data To Local Device");
    } on LocalStorageException {
      throw ErrorMessage("Not Able To Delete Files To Local Device Storage");
    } catch (error) {
      throw ErrorMessage("Unexpected Error Happened");
    }
  }
}
