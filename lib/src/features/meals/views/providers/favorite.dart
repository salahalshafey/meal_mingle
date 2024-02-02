import 'package:flutter/material.dart';
import '../../data/models/meal.dart';
import '../../data/models/dummy_data.dart';

class Favorite with ChangeNotifier {
  final List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals {
    return [..._favoriteMeals];
  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      _favoriteMeals.removeAt(existingIndex);
    } else {
      _favoriteMeals.add(dummyMeal.firstWhere((meal) => meal.id == mealId));
    }
    notifyListeners();
  }

  bool isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }
}
