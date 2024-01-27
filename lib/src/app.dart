import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

import 'features/food_scanning/views/screens/favorite_food_scan_screen.dart';
import 'features/food_scanning/views/screens/food_scan_screen.dart';
import 'features/home_and_drawer_screens/providers/general_settings_provider.dart';
import 'features/meals/models/dummy_data.dart';
import 'features/meals/models/meal.dart';
import 'features/meals/screens/category_meals_screen.dart';
import 'features/meals/screens/meal_detail_screen.dart';
import 'features/home_and_drawer_screens/screens/meals_settings_screen.dart';

late GlobalKey<NavigatorState> navigatorKey;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = dummyMeal;

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      _availableMeals = dummyMeal.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    navigatorKey = _navigatorKey;

    final provider = Provider.of<GeneralSettings>(context);

    return MaterialApp(
      title: 'Flutter Food Scanner',
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      themeMode: provider.themeMode,
      darkTheme: myDarkTheme(provider.currentColor),
      theme: myLightTheme(provider.currentColor),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: provider.currentLocal,
      home: const FoodScanScreen(), //   HomePage()

      routes: {
        // '/': (ctx) => const TabsScreen(),
        FavoriteFoodScanScreen.routeName: (ctx) =>
            const FavoriteFoodScanScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        MealsSettingsScreen.routeName: (ctx) =>
            MealsSettingsScreen(_filters, _setFilters)
      },
    );
  }
}
