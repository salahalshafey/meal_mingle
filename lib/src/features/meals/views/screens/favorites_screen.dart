import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_meals.dart';
import '../widgets/meal_item/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favMeals = Provider.of<FavoriteMeals>(context).favoriteMeals;

    if (favMeals.isEmpty) {
      return Center(
        child: Text(
          Strings.of(context).youHaveNoFavoritesYetStartAddingSome,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
        itemCount: favMeals.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 800,
          crossAxisSpacing: 15,
          mainAxisExtent: 350,
        ),
        itemBuilder: (ctx, index) {
          return MealItem(favMeals[index]);
        },
      ),
    );
  }
}
