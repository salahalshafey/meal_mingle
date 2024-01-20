import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/injection_container.dart' as di;
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await _initHiveBoxes();

  // await _initAppSettings();
  // await _initMealsSettings();

  runApp(const MyApp());
}

Future<void> _initHiveBoxes() async {
  await Hive.initFlutter();

  await Hive.openBox<Map<String, dynamic>>("favorite_food_scanning_results");
  await Hive.openBox<Map<String, dynamic>>("favorite_meals");
  await Hive.openBox<Map<String, dynamic>>("user_data");
  await Hive.openBox<Map<String, dynamic>>("meals_settings");
  await Hive.openBox<Map<String, dynamic>>("app_settings");
}
