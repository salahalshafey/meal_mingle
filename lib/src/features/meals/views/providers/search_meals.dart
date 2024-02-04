import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';

import '../../../../core/error/error_exceptions_with_message.dart';
import '../../../../core/error/exceptions_without_message.dart';

import '../../data/models/meal.dart';
import '../../viewmodels/meals_viewmodel.dart';

class SearchMeals extends ChangeNotifier {
  MealsViewModel mealsViewModel;

  SearchMeals({required this.mealsViewModel});

  Future<Meal> searchMeal(String mealName) async {
    try {
      return await mealsViewModel.mealInfo(mealName);
    } on OfflineException {
      throw ErrorMessage(Strings.get.youAreCurrentlyOffline);
    } on ServerException {
      throw ErrorMessage(Strings.get.somethingWentWrongPleaseTryAgainLater);
    } on FilterException {
      throw ErrorMessage(Strings.get.sorryThereIsNoResultForYourSearch);
    } catch (error) {
      throw ErrorMessage(Strings.get.unexpectedErrorHappened);
    }
  }
}
