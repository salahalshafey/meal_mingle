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
  final List<Ingredient> ingredients;
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
        imageUrl: json['name_in_english'] ?? "",
        ingredients: (json['ingredients'] as List<dynamic>)
            .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
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

  Meal copyWith({
    String? id,
    List<String>? categories,
    String? mealLanguageCode,
    String? title,
    String? imageUrl,
    List<Ingredient>? ingredients,
    List<String>? steps,
    int? duration,
    String? complexity,
    String? affordability,
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVegan,
    bool? isVegetarian,
  }) {
    return Meal(
      id: id ?? this.id,
      categories: categories ?? this.categories,
      mealLanguageCode: mealLanguageCode ?? this.mealLanguageCode,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      duration: duration ?? this.duration,
      complexity: complexity ?? this.complexity,
      affordability: affordability ?? this.affordability,
      isGlutenFree: isGlutenFree ?? this.isGlutenFree,
      isLactoseFree: isLactoseFree ?? this.isLactoseFree,
      isVegan: isVegan ?? this.isVegan,
      isVegetarian: isVegetarian ?? this.isVegetarian,
    );
  }
}
