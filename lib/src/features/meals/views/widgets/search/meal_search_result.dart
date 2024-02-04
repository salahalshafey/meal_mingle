import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/util/functions/string_manipulations_and_search.dart';

import '../../providers/search_meals.dart';
import '../meal_item/meal_item.dart';

class MealSearchResult extends StatelessWidget {
  const MealSearchResult(this.mealName, {super.key});

  final String mealName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      key: UniqueKey(),
      future:
          Provider.of<SearchMeals>(context, listen: false).searchMeal(mealName),
      builder: (ctx, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final meal = snapshot.data!;

        return ListView(
          children: [
            Directionality(
              textDirection: getDirectionalityOfLangCode(meal.mealLanguageCode),
              child: MealItem(meal),
            ),
          ],
        );
      },
    );
  }
}
