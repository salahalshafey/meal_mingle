import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

import 'features/home_and_drawer/home_page.dart';
import 'features/meals/models/dummy_data.dart';
import 'features/meals/models/meal.dart';
import 'features/meals/providers/favorite.dart';
import 'features/meals/screens/category_meals_screen.dart';
import 'features/meals/screens/meal_detail_screen.dart';
import 'features/meals/screens/settings_screen.dart';

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

    return ChangeNotifierProvider(
      create: (context) => Favorite(),
      child: MaterialApp(
        title: 'Flutter Food Scanner',
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        //themeMode: ThemeMode.dark,
        darkTheme: myDarkTheme(),
        theme: myLightTheme(),
        home: const HomePage(), //  FoodScanScreen()

        routes: {
          // '/': (ctx) => const TabsScreen(),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
          SettingsScreen.routeName: (ctx) =>
              SettingsScreen(_filters, _setFilters)
        },
      ),
    );
  }
}
