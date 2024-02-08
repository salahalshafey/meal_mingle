import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';

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

  final List<String> _questionsChoices = [
    Strings.get.isThisFoodConsideredHealthyExplainTheBenefits,
    Strings.get.pleaseGiveMeTheFollowingNutritionFacts,
    Strings.get.pleaseAnswerTheFollowingnDoesThisFoodContain,
    Strings.get
        .howToPrepareThisFoodnnifThereIsMoreThanOneItemGiveTheResultForEachItem,
  ];

  List<FoodScanningResultModel> _allFavorites = [];

  Future<void> fetchAllFavorites() async {
    try {
      _allFavorites = await favoriteFoodScanningViewmodel.getAllFavorite();

      // the last added is first
      _allFavorites.sort((m1, m2) => m2.dateTime.compareTo(m1.dateTime));

      notifyListeners();
    } on LocalDataException {
      throw ErrorMessage(Strings.get.notAbleToReadDataFromLocalDevice);
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
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
      throw ErrorMessage(Strings.get.youAreCurrentlyOffline);
    } on ServerException {
      throw ErrorMessage(Strings.get.somethingWentWrongPleaseTryAgainLater);
    } on FilterException {
      throw ErrorMessage(Strings.get.sorryThereIsNoResultForYourSearch);
    } on ErrorMessage {
      rethrow;
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
    }
  }

  Future<void> _updateFavorite(FoodScanningResultModel favoriteModel) async {
    try {
      await favoriteFoodScanningViewmodel.updateFavoirte(favoriteModel);
    } on LocalDataException {
      throw ErrorMessage(Strings.get.notAbleToSaveDataToLocalDevice);
    } on LocalStorageException {
      throw ErrorMessage(Strings.get.notAbleToSaveFilesToLocalDeviceStorage);
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
    }
  }

  Future<int> deleteFavorite(String favoriteId) async {
    try {
      await favoriteFoodScanningViewmodel.deleteFavorite(favoriteId);

      final removedIndex =
          _allFavorites.indexWhere((element) => element.id == favoriteId);
      _allFavorites
          .removeWhere((favoriteModel) => favoriteModel.id == favoriteId);

      notifyListeners();

      return removedIndex;
    } on LocalDataException {
      throw ErrorMessage(
          Strings.get.notAbleToDeleteFilesFromLocalDeviceStorage);
    } on LocalStorageException {
      throw ErrorMessage(
          Strings.get.notAbleToDeleteFilesFromLocalDeviceStorage);
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
    }
  }
}
