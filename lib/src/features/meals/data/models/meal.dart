import 'ingredient.dart';

enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String mealLanguageCode;
  final String title;
  final String imageUrl;
  final List<Ingredients> ingredients;
  final List<String> steps;
  final int duration;
  final String complexity;
  final String affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    this.mealLanguageCode = "en",
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: DateTime.now().hashCode.toString(),
        categories: [],
        mealLanguageCode: json["language"],
        title: json['name'] as String,
        imageUrl: json['imageUrl'] ?? "",
        ingredients: (json['ingredients'] as List<dynamic>)
            .map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
            .toList(),
        steps: (json['instructions'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        duration: json['duration_in_minutes'] as int,
        complexity: json['complexity'] as String,
        affordability: json['affordability'] as String,
        isGlutenFree: json['isGlutenFree'] ?? false,
        isLactoseFree: json['isLactoseFree'] ?? false,
        isVegan: json['isVegan'] ?? false,
        isVegetarian: json['isVegetarian'] ?? false,
      );
}
