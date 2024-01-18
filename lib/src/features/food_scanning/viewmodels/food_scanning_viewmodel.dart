import '../../../core/error/exceptions_without_message.dart';
import '../../../core/network/network_info.dart';
import '../data/services/food_scanning_service.dart';

abstract class FoodScanningViewModel {
  Future<String> foodOverview(String imagePath);
  Future<String> foodMoreDetails(
      String imagePath, String foodOverview, String question);
}

class FoodScanningViewModelImpl implements FoodScanningViewModel {
  final FoodScanningService foodScanningService;
  final NetworkInfo networkInfo;

  FoodScanningViewModelImpl({
    required this.foodScanningService,
    required this.networkInfo,
  });

  @override
  Future<String> foodOverview(String imagePath) async {
    if (await networkInfo.isNotConnected) {
      throw OfflineException();
    }

    return foodScanningService.getResult(imagePath);
  }

  @override
  Future<String> foodMoreDetails(
      String imagePath, String foodOverview, String question) async {
    if (await networkInfo.isNotConnected) {
      throw OfflineException();
    }

    return foodScanningService.getResult(imagePath, foodOverview, question);
  }
}
