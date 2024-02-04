import '../../../core/error/exceptions_without_message.dart';
import '../../../core/network/network_info.dart';

import '../data/models/meal.dart';
import '../data/services/food_image_service.dart';
import '../data/services/meals_service.dart';

abstract class MealsViewModel {
  Future<Meal> mealInfo(String mealName);
}

class MealsViewModelImpl implements MealsViewModel {
  final MealsSrevice mealsSrevice;
  final FoodImageService foodImageService;
  final NetworkInfo networkInfo;

  MealsViewModelImpl({
    required this.mealsSrevice,
    required this.foodImageService,
    required this.networkInfo,
  });

  @override
  Future<Meal> mealInfo(String mealName) async {
    if (await networkInfo.isNotConnected) {
      throw OfflineException();
    }

    try {
      final mealWithoutImages = await mealsSrevice.getMealInfo(mealName);
      final imagesNameInEnglish = mealWithoutImages.ingredients
          .map((ingredient) => ingredient.ingredientImage)
          .toList();

      final imageLinks = await Future.wait([
        foodImageService.getImageLink(mealWithoutImages.imageUrl, 1024),
        ...imagesNameInEnglish
            .map((imageName) => foodImageService.getImageLink(imageName, 120)),
      ]);

      final mealImageUrl = imageLinks.first;

      int imagesIndex = 1;
      final ingredientsWithImages = mealWithoutImages.ingredients
          .map((ingredient) =>
              ingredient.copyWith(ingredientImage: imageLinks[imagesIndex++]))
          .toList();

      return mealWithoutImages.copyWith(
        imageUrl: mealImageUrl,
        ingredients: ingredientsWithImages,
      );
    } catch (error) {
      rethrow;
    }
  }
}
