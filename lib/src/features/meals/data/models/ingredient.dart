class Ingredients {
  final String ingredientName;
  final String ingredientImage;
  final String ingredientAmount;

  const Ingredients({
    required this.ingredientName,
    required this.ingredientImage,
    required this.ingredientAmount,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        ingredientName: json['name'] as String,
        ingredientImage: json['image'] ?? "",
        ingredientAmount: json['quantity'] as String,
      );
}
