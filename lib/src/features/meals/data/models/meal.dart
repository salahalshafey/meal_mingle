import 'ingredient.dart';
import 'package:hive/hive.dart';

part 'meal.g.dart';

@HiveType(typeId: 2)
class Meal {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final List<String> categories;

  @HiveField(2)
  final String mealLanguageCode;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String imageUrl;

  @HiveField(5)
  final List<Ingredient> ingredients;

  @HiveField(6)
  final List<String> steps;

  @HiveField(7)
  final int duration;

  @HiveField(8)
  final String complexity;

  @HiveField(9)
  final String affordability;

  @HiveField(10)
  final bool isGlutenFree;

  @HiveField(11)
  final bool isLactoseFree;

  @HiveField(12)
  final bool isVegan;

  @HiveField(13)
  final bool isVegetarian;

  @HiveField(14)
  final DateTime? timeOfSavingToFavorites;

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
    this.timeOfSavingToFavorites,
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
        timeOfSavingToFavorites: DateTime.now(),
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
    DateTime? timeOfSavingToFavorites,
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
      timeOfSavingToFavorites:
          timeOfSavingToFavorites ?? this.timeOfSavingToFavorites,
    );
  }
}

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
