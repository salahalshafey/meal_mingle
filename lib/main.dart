import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'src/features/food_scanning/views/providers/favorites_food_scan.dart';
import 'src/features/meals/providers/favorite.dart';
import 'src/injection_container.dart' as di;
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    di.init(),
    _initHiveBoxes(),
  ]);

  // _initAppSettings();
  //_initMealsSettings();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => di.sl<FavoritesFoodScan>()),
        ChangeNotifierProvider(create: (ctx) => Favorite()),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _initHiveBoxes() async {
  await Hive.initFlutter();

  await Future.wait([
    Hive.openBox<Map>("favorite_food_scanning_results"),
    Hive.openBox<Map>("favorite_meals"),
    Hive.openBox<Map>("user_data"),
    Hive.openBox<Map>("meals_settings"),
    Hive.openBox<Map>("app_settings"),
  ]);
}
