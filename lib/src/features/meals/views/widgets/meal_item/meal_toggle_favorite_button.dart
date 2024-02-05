import 'package:flutter/material.dart';
import 'package:meal_mingle/src/features/meals/views/providers/favorite_meals.dart';
import 'package:provider/provider.dart';

import '../../../../../core/util/builders/custom_alret_dialog.dart';
import '../../../data/models/meal.dart';

class MealToggleFavoriteButton extends StatelessWidget {
  const MealToggleFavoriteButton(this.meal, {super.key});

  final Meal meal;

  Future<bool?> _confirmRemoveDialog(BuildContext context) {
    return showCustomAlretDialog<bool>(
      context: context,
      constraints: const BoxConstraints(maxWidth: 500),
      title: "Confirm Remove?",
      titleColor: Colors.red,
      contentPadding: const EdgeInsets.all(20),
      content:
          "Are you sure you want to remove this Scan result from Favorites?",
      actionsBuilder: (builderContext) => [
        TextButton(
          onPressed: () {
            Navigator.of(builderContext).pop(true);
          },
          child: const Text(
            "Remove",
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(builderContext).pop(false);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final favMeals = Provider.of<FavoriteMeals>(context);
    final isMealFavorite = favMeals.isMealFavorite(meal.id);

    return FloatingActionButton(
      heroTag: null,
      tooltip: isMealFavorite ? "Remove from favorites" : "Save to favorites",
      onPressed: () async {
        if (isMealFavorite) {
          final delete = await _confirmRemoveDialog(context);

          if (delete == null || delete == false) {
            return;
          }
        }

        favMeals.toggleFavorite(meal);
      },
      child: isMealFavorite
          ? const Icon(
              Icons.favorite_rounded,
              color: Colors.pink,
            )
          : const Icon(Icons.favorite_border_rounded),
    );
  }
}
