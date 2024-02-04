import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';

import 'features/food_scanning/data/services/favorite_food_scanning_local_data_service.dart';
import 'features/food_scanning/data/services/favorite_food_scanning_local_storage_service.dart';
import 'features/food_scanning/data/services/food_scanning_service.dart';
import 'features/food_scanning/viewmodels/favorite_food_scanning_viewmodel.dart';
import 'features/food_scanning/viewmodels/food_scanning_viewmodel.dart';
import 'features/food_scanning/views/providers/favorites_food_scan.dart';
import 'features/food_scanning/views/providers/food_scan.dart';
import 'features/meals/data/services/food_image_service.dart';
import 'features/meals/data/services/meals_service.dart';
import 'features/meals/viewmodels/meals_viewmodel.dart';
import 'features/meals/views/providers/search_meals.dart';

final sl = GetIt.instance;

Future<void> init() async {
///////////////////////////////////////////// !!!! Features - FoodScanning !!!! //////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Provider "View"
  sl.registerFactory(() => FoodScan(
        foodScanningViewModel: sl(),
        favoriteFoodScanningViewmodel: sl(),
      ));
  sl.registerFactory(() => FavoritesFoodScan(
        foodScanningViewModel: sl(),
        favoriteFoodScanningViewmodel: sl(),
      ));

// Viewmodels
  sl.registerLazySingleton<FoodScanningViewModel>(
      () => FoodScanningViewModelImpl(
            foodScanningService: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<FavoriteFoodScanningViewmodel>(
      () => FavoriteFoodScanningViewmodelImpl(
            localDataService: sl(),
            localStorageService: sl(),
          ));

// Services "Model"
  sl.registerLazySingleton<FoodScanningService>(
      () => FoodScanningGeminiProVisionImpl());
  sl.registerLazySingleton<FavoriteFoodScanningLocalDataService>(
      () => FavoriteFoodScanningHiveImpl());
  sl.registerLazySingleton<FavoriteFoodScanningLocalStorageService>(
      () => FavoriteFoodScanningLocalStorageImpl());

////////////////////////////////////// !!!! Features - Meals !!!! ///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Provider "View"
  sl.registerFactory(() => SearchMeals(
        mealsViewModel: sl(),
      ));

// Viewmodels
  sl.registerLazySingleton<MealsViewModel>(() => MealsViewModelImpl(
        mealsSrevice: sl(),
        foodImageService: sl(),
        networkInfo: sl(),
      ));

// Services "Model"
  sl.registerLazySingleton<MealsSrevice>(() => MealsGeminiProVisionImpl());
  sl.registerLazySingleton<FoodImageService>(
      () => FoodImageWikipediaScrapingImpl());

//////////////////////////////////////////////////// !!!! core !!!! ///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<NetworkInfo>(() => MyNetworkInfoImpl());
}
