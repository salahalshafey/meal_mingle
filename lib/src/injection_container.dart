import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';

import 'features/food_scanning/data/services/favorite_food_scanning_local_data_service.dart';
import 'features/food_scanning/data/services/favorite_food_scanning_local_storage_service.dart';
import 'features/food_scanning/data/services/food_scanning_service.dart';
import 'features/food_scanning/viewmodels/favorite_food_scanning_viewmodel.dart';
import 'features/food_scanning/viewmodels/food_scanning_viewmodel.dart';
import 'features/food_scanning/views/providers/food_scan.dart';

final sl = GetIt.instance;

Future<void> init() async {
///////////////////////////////////////////// !!!! Features - FoodScanning !!!! //////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Provider "View"

  sl.registerFactory(() => FoodScan(
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

  sl.registerLazySingleton<FoodScanningService>(() => GeminiProVisionImpl());
  sl.registerLazySingleton<FavoriteFoodScanningLocalDataService>(
      () => FavoriteFoodScanningHiveImpl());
  sl.registerLazySingleton<FavoriteFoodScanningLocalStorageService>(
      () => FavoriteFoodScanningLocalStorageImpl());

////////////////////////////////////// !!!! Features - Save Food Scanning Result !!!! ////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////// !!!! core !!!! ///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<NetworkInfo>(() => MyNetworkInfoImpl());
}
