import 'package:flutter/material.dart';

import '../../../../../core/util/widgets/custom_card.dart';

import '../../../data/models/meal.dart';

import '../../screens/meal_detail_screen.dart';
import 'meal_image.dart';
import 'meal_title.dart';
import 'meal_toggle_favorite_button.dart';
import 'meal_info.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(
    this.meal, {
    Key? key,
  }) : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: meal,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: BorderRadius.circular(20),
      elevation: 10,
      margin: const EdgeInsets.all(15),
      onTap: () => selectMeal(context),
      child: Column(
        children: [
          Stack(
            children: [
              MealImage(meal.imageUrl),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                child: MealTitle(meal.title),
              ),
              PositionedDirectional(
                bottom: 10,
                end: 5,
                child: MealToggleFavoriteButton(meal),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MealInfo(
              duration: meal.duration,
              affordability: meal.affordability,
              complexity: meal.complexity,
            ),
          ),
        ],
      ),
    );
  }
}
