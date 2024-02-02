import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite.dart';
import '../widgets/meal_item/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favMeals = Provider.of<Favorite>(context).favoriteMeals;

    if (favMeals.isEmpty) {
      return const Center(
        child: Text(
          'You Have no Favorites yet - Start Adding Some!',
          style: TextStyle(fontWeight: FontWeight.bold),
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
          return MealItem(
            id: favMeals[index].id,
            imageUrl: favMeals[index].imageUrl,
            affordability: favMeals[index].affordability,
            title: favMeals[index].title,
            complexity: favMeals[index].complexity,
            duration: favMeals[index].duration,
          );
        },
      ),
    );
  }
}
