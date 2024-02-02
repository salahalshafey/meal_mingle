import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/widgets/custom_back_button.dart';

import '../providers/favorite.dart';

import '../../data/models/dummy_data.dart';
import '../widgets/meal_detail/ingredient_item.dart';
import '../widgets/meal_detail/recipe_step_item.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final favMeals = Provider.of<Favorite>(context);
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeal.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          favMeals.toggleFavorite(mealId);
        },
        child: favMeals.isMealFavorite(mealId)
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
            SliverAppBar(
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.all(0),
                title: Hero(
                  tag: selectedMeal.imageUrl,
                  child: Image.network(
                    selectedMeal.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              leading: const CustomBackButton(includeBackgroundColor: true),
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
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
                  selectedMeal.title,
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
                height: 190,
                child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return IngredientItem(
                      ingredient: selectedMeal.ingredients[index],
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
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (context, index) {
                      return RecipeStepItem(
                        step: selectedMeal.steps[index],
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
    );
  }
}
