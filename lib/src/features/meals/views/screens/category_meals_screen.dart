import 'package:flutter/material.dart';

import '../../../../core/util/widgets/custom_back_button.dart';

import '../widgets/meal_item/meal_item.dart';
import '../../data/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen(this.availableMeals, {Key? key}) : super(key: key);

  final List<Meal> availableMeals;
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal> displayMeals = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 3,
          leading: const CustomBackButton(),
          title: Text(
            'These Are Some $categoryTitle Recepies',
            style: Theme.of(context).textTheme.titleSmall,
            textScaler: const TextScaler.linear(0.8),
          )),
      body: GridView.builder(
        itemCount: displayMeals.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 800,
          crossAxisSpacing: 15,
          mainAxisExtent: 350,
        ),
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            imageUrl: displayMeals[index].imageUrl,
            affordability: displayMeals[index].affordability,
            title: displayMeals[index].title,
            complexity: displayMeals[index].complexity,
            duration: displayMeals[index].duration,
          );
        },
      ),
    );
  }
}
