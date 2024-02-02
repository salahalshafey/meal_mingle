import 'package:flutter/material.dart';
import 'package:meal_mingle/src/features/meals/views/providers/favorite.dart';

class MealToggleFavoriteButton extends StatelessWidget {
  const MealToggleFavoriteButton({
    super.key,
    required this.favMeals,
    required this.id,
  });

  final Favorite favMeals;
  final String id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: FittedBox(
        child: FloatingActionButton(
            heroTag: null,
            // backgroundColor: Colors.white,
            onPressed: () {
              favMeals.toggleFavorite(id);
            },
            child: favMeals.isMealFavorite(id)
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.pink,
                  )
                : const Icon(Icons.favorite_border_rounded)),
      ),
    );
  }
}
