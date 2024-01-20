import 'package:path_provider/path_provider.dart';

import '../data/models/food_scanning_result_model.dart';
import '../data/services/favorite_food_scanning_local_data_service.dart';
import '../data/services/favorite_food_scanning_local_storage_service.dart';

abstract class FavoriteFoodScanningViewmodel {
  Future<List<FoodScanningResultModel>> getAllFavorite();

  Future<void> saveToFavoirte(FoodScanningResultModel foodScanningResultModel);

  Future<void> updateFavoirte(FoodScanningResultModel foodScanningResultModel);

  Future<void> deleteFavorite(String id);

  Future<void> deleteAllFavorite();
}

class FavoriteFoodScanningViewmodelImpl
    implements FavoriteFoodScanningViewmodel {
  final FavoriteFoodScanningLocalDataService localDataService;
  final FavoriteFoodScanningLocalStorageService localStorageService;

  FavoriteFoodScanningViewmodelImpl({
    required this.localDataService,
    required this.localStorageService,
  });

  @override
  Future<List<FoodScanningResultModel>> getAllFavorite() {
    return localDataService.getAllFavorite();
  }

  @override
  Future<void> saveToFavoirte(
      FoodScanningResultModel foodScanningResultModel) async {
    try {
      final newImagePath = await localStorageService.save(
        foodScanningResultModel.imagePath,
        _getFileNewPath(foodScanningResultModel),
      );

      foodScanningResultModel =
          foodScanningResultModel.copyWith(imagePath: newImagePath);

      await localDataService.saveToFavoirte(foodScanningResultModel);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> updateFavoirte(FoodScanningResultModel foodScanningResultModel) {
    return localDataService.saveToFavoirte(foodScanningResultModel);
  }

  @override
  Future<void> deleteFavorite(String id) async {
    try {
      final deletedFavorite = await localDataService.deleteFavorite(id);

      await localStorageService.delete(deletedFavorite.imagePath);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAllFavorite() async {
    try {
      await localDataService.deleteAllFavorite();

      final appDocumentsDir = await getApplicationDocumentsDirectory();
      final dirPath = "${appDocumentsDir.path}/favorite_food_scanning_images";

      await localStorageService.deleteAllDir(dirPath);
    } catch (error) {
      rethrow;
    }
  }

  String _getFileNewPath(FoodScanningResultModel foodScanningResultModel) {
    const folderName = "favorite_food_scanning_images";

    final fileName = foodScanningResultModel.id;

    final fileExtension = foodScanningResultModel.imagePath.split(".").last;

    return "$folderName/$fileName.$fileExtension";
  }
}
