class Ingredient {
  final String ingredientName;
  final String ingredientImage;
  final String ingredientAmount;

  const Ingredient({
    required this.ingredientName,
    required this.ingredientImage,
    required this.ingredientAmount,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        ingredientName: json['name'] as String,
        ingredientImage: json['name_in_english'] ?? "",
        ingredientAmount: json['quantity'] as String,
      );

  Ingredient copyWith({
    String? ingredientName,
    String? ingredientImage,
    String? ingredientAmount,
  }) {
    return Ingredient(
      ingredientName: ingredientName ?? this.ingredientName,
      ingredientImage: ingredientImage ?? this.ingredientImage,
      ingredientAmount: ingredientAmount ?? this.ingredientAmount,
    );
  }
}
