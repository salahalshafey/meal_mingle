import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/error/exceptions_without_message.dart';
import '../models/food_scanning_result_model.dart';

abstract class FavoriteFoodScanningLocalDataService {
  Future<List<FoodScanningResultModel>> getAllFavorite();

  Future<void> saveToFavoirte(FoodScanningResultModel foodScanningResultModel);

  Future<FoodScanningResultModel> deleteFavorite(String id);

  Future<void> deleteAllFavorite();
}

final _favoritesBox = Hive.box<Map>('favorite_food_scanning_results');

class FavoriteFoodScanningHiveImpl
    implements FavoriteFoodScanningLocalDataService {
  @override
  Future<List<FoodScanningResultModel>> getAllFavorite() async {
    try {
      if (_favoritesBox.isEmpty) {
        return [];
      }

      return _favoritesBox.keys
          .map((key) =>
              FoodScanningResultModel.fromJson(_favoritesBox.get(key)!))
          .toList();
    } catch (error) {
      throw LocalDataException();
    }
  }

  @override
  Future<void> saveToFavoirte(
      FoodScanningResultModel foodScanningResultModel) async {
    try {
      await _favoritesBox.put(
          foodScanningResultModel.id, foodScanningResultModel.toJson());
    } catch (error) {
      throw LocalDataException();
    }
  }

  @override
  Future<FoodScanningResultModel> deleteFavorite(String id) async {
    try {
      final deletedFavorite =
          FoodScanningResultModel.fromJson(_favoritesBox.get(id)!);

      await _favoritesBox.delete(id);

      return deletedFavorite;
    } catch (error) {
      throw LocalDataException();
    }
  }

  @override
  Future<void> deleteAllFavorite() async {
    try {
      await _favoritesBox.clear();
    } catch (error) {
      throw LocalDataException();
    }
  }
}
