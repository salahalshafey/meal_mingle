import 'package:flutter/material.dart';

import '../../data/models/meal.dart';

import 'package:hive_flutter/hive_flutter.dart';

final _mealsBox = Hive.box<Meal>("favorite_meals");

class FavoriteMeals with ChangeNotifier {
  List<Meal> get favoriteMeals {
    return _mealsBox.values.toList()
      ..sort((m1, m2) {
        final m11 = m1.timeOfSavingToFavorites ?? DateTime(2024);
        final m22 = m2.timeOfSavingToFavorites ?? DateTime(2024);

        return m22.compareTo(m11);
      });
  }

  void toggleFavorite(Meal meal) async {
    if (isMealFavorite(meal.id)) {
      await _mealsBox.delete(meal.id);
    } else {
      await _mealsBox.put(
        meal.id,
        meal.copyWith(timeOfSavingToFavorites: DateTime.now()),
      );
    }

    notifyListeners();
  }

  bool isMealFavorite(String mealId) {
    return _mealsBox.containsKey(mealId);
  }
}
