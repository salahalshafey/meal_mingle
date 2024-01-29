import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/widgets/custom_card.dart';

import '../../providers/favorite.dart';
import '../../models/meal.dart';

import '../../screens/meal_detail_screen.dart';
import 'meal_image.dart';
import 'meal_title.dart';
import 'meal_toggle_favorite_button.dart';
import 'meal_info.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.affordability,
    required this.title,
    required this.complexity,
    required this.duration,
  }) : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final favMeals = Provider.of<Favorite>(context);

    return CustomCard(
      borderRadius: BorderRadius.circular(20),
      elevation: 10,
      margin: const EdgeInsets.all(15),
      onTap: () => selectMeal(context),
      child: Column(
        children: [
          Stack(
            children: [
              MealImage(imageUrl),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                child: MealTitle(title),
              ),
              PositionedDirectional(
                bottom: 10,
                end: 5,
                child: MealToggleFavoriteButton(favMeals: favMeals, id: id),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MealInfo(
              duration: duration,
              affordability: affordability,
              complexity: complexity,
            ),
          ),
        ],
      ),
    );
  }
}
