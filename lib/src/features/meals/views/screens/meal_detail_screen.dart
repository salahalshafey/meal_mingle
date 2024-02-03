import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/functions/string_manipulations_and_search.dart';
import '../../../../core/util/widgets/custom_back_button.dart';

import '../../../../app.dart';

import '../../data/models/meal.dart';
import '../providers/favorite_meals.dart';

import '../widgets/meal_detail/ingredient_item.dart';
import '../widgets/meal_detail/recipe_step_item.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final favMeals = Provider.of<FavoriteMeals>(context);
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Directionality(
      textDirection: getDirectionalityOfLangCode(meal.mealLanguageCode),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            favMeals.toggleFavorite(meal.id);
          },
          child: favMeals.isMealFavorite(meal.id)
              ? const Icon(
                  Icons.favorite_rounded,
                  color: Colors.pink,
                )
              : const Icon(Icons.favorite_border_rounded),
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              Directionality(
                textDirection: Directionality.of(navigatorKey.currentContext!),
                child: SliverAppBar(
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.all(0),
                    title: Hero(
                      tag: meal.imageUrl,
                      child: Image.network(meal.imageUrl,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover, errorBuilder: (ctx, error, stk) {
                        return const SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Icon(
                            Icons.restaurant_rounded,
                            size: 80,
                            textDirection: TextDirection.ltr,
                          ),
                        );
                      }),
                    ),
                  ),
                  leading: const CustomBackButton(includeBackgroundColor: true),
                  floating: true,
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  margin: const EdgeInsetsDirectional.only(top: 20, start: 10),
                  child: Text(
                    meal.title,
                    style: Theme.of(context).textTheme.displayMedium,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    'INGREDIENTS',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    itemCount: meal.ingredients.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return IngredientItem(
                        ingredient: meal.ingredients[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 10, bottom: 10),
                  child: Text(
                    'RECIPE',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: meal.steps.length,
                      itemBuilder: (context, index) {
                        return RecipeStepItem(
                          step: meal.steps[index],
                          stepNumber: index + 1,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
