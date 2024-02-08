import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';

import '../../../../core/error/error_exceptions_with_message.dart';
import '../../../../core/error/exceptions_without_message.dart';

import '../../data/models/food_scanning_result_model.dart';

import '../../viewmodels/favorite_food_scanning_viewmodel.dart';
import '../../viewmodels/food_scanning_viewmodel.dart';

class FoodScan with ChangeNotifier {
  final FoodScanningViewModel foodScanningViewModel;
  final FavoriteFoodScanningViewmodel favoriteFoodScanningViewmodel;

  FoodScan({
    required this.foodScanningViewModel,
    required this.favoriteFoodScanningViewmodel,
  });

  String? _savedWithId;
  DateTime? _savedWithDate;

  bool get isFavorite => _savedWithId != null;

  late String _imagePath;
  late String _resultOverview;

  final List<String> _questionsChoices = [
    Strings.get.isThisFoodConsideredHealthyExplainTheBenefits,
    Strings.get.pleaseGiveMeTheFollowingNutritionFacts,
    Strings.get.pleaseAnswerTheFollowingnDoesThisFoodContain,
    Strings.get
        .howToPrepareThisFoodnnifThereIsMoreThanOneItemGiveTheResultForEachItem,
  ];

  final List<String?> _questionsResults = [
    null,
    null,
    null,
    null,
  ];

  List<String?> get questionsResults => [..._questionsResults];

  Future<String> getFoodOverview(String imagePath) async {
    try {
      _imagePath = imagePath;
      _resultOverview = await foodScanningViewModel.foodOverview(imagePath);
      notifyListeners();

      return _resultOverview;
    } on OfflineException {
      throw ErrorMessage(Strings.get.youAreCurrentlyOffline);
    } on ServerException {
      throw ErrorMessage(Strings.get.somethingWentWrongPleaseTryAgainLater);
    } on FilterException {
      throw ErrorMessage(Strings.get.sorryThereIsNoResultForYourSearch);
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
    }
  }

  Future<String> getfoodMoreDetails(int questionIndex) async {
    if (_questionsResults[questionIndex] != null) {
      return _questionsResults[questionIndex]!;
    }

    try {
      _questionsResults[questionIndex] =
          await foodScanningViewModel.foodMoreDetails(
        _imagePath,
        _resultOverview,
        _questionsChoices[questionIndex],
      );

      notifyListeners();

      if (isFavorite) {
        _updateFavorite();
      }

      return _questionsResults[questionIndex]!;
    } on OfflineException {
      throw ErrorMessage(Strings.get.youAreCurrentlyOffline);
    } on ServerException {
      throw ErrorMessage(Strings.get.somethingWentWrongPleaseTryAgainLater);
    } on FilterException {
      throw ErrorMessage(Strings.get.sorryThereIsNoResultForYourSearch);
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
    }
  }

  Future<void> _saveToFavorite() async {
    try {
      _savedWithId = DateTime.now().hashCode.toString();
      _savedWithDate = DateTime.now();

      final modelToSave = FoodScanningResultModel(
        id: _savedWithId!,
        dateTime: _savedWithDate!,
        imagePath: _imagePath,
        resultOverview: _resultOverview,
        questionsResults: _questionsResults,
      );

      await favoriteFoodScanningViewmodel.saveToFavoirte(modelToSave);

      notifyListeners();
    } on LocalDataException {
      throw ErrorMessage(Strings.get.notAbleToSaveDataToLocalDevice);
    } on LocalStorageException {
      throw ErrorMessage(Strings.get.notAbleToSaveFilesToLocalDeviceStorage);
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
    }
  }

  Future<void> _updateFavorite() async {
    try {
      final modelToSave = FoodScanningResultModel(
        id: _savedWithId!,
        dateTime: _savedWithDate!,
        imagePath: _imagePath,
        resultOverview: _resultOverview,
        questionsResults: _questionsResults,
      );

      await favoriteFoodScanningViewmodel.saveToFavoirte(modelToSave);
    } on LocalDataException {
      throw ErrorMessage(Strings.get.notAbleToSaveDataToLocalDevice);
    } on LocalStorageException {
      throw ErrorMessage(Strings.get.notAbleToSaveFilesToLocalDeviceStorage);
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
    }
  }

  Future<void> _deleteFavorite() async {
    try {
      await favoriteFoodScanningViewmodel.deleteFavorite(_savedWithId!);

      _savedWithId = null;
      _savedWithDate = null;

      notifyListeners();
    } on LocalDataException {
      throw ErrorMessage(Strings.get.notAbleToSaveDataToLocalDevice);
    } on LocalStorageException {
      throw ErrorMessage(
          Strings.get.notAbleToDeleteFilesFromLocalDeviceStorage);
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
    }
  }

  Future<void> toggleFavorite() async {
    try {
      if (isFavorite) {
        await _deleteFavorite();
      } else {
        await _saveToFavorite();
      }
    } catch (error) {
      rethrow;
    }
  }
}
