import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meal_mingle/l10n/l10n.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/functions/string_manipulations_and_search.dart';

import '../providers/favorites_food_scan.dart';

import '../widgets/favorite_food_scan/favorite_choice_result.dart';
import '../widgets/share_as_pdf/share_food_scanning_result.dart.dart';
import '../widgets/image_and_choices_appbar.dart';
import '../widgets/overview_result.dart';

class FavoriteFoodScanScreen extends StatelessWidget {
  const FavoriteFoodScanScreen({super.key});

  static const routeName = '/favorite-food-scan';

  @override
  Widget build(BuildContext context) {
    final favoriteId = ModalRoute.of(context)!.settings.arguments as String;
    final foodScanResult =
        Provider.of<FavoritesFoodScan>(context).getFavoriteById(favoriteId);

    return Scaffold(
      floatingActionButton: ShareFoodScanningResultButton(foodScanResult)
          .animate(delay: 500.ms)
          .slideX(begin: appCurrentDirectionalityIsRtl() ? -1.5 : 1.5),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              ImageAndChoicesAppbar(
                imagePath: foodScanResult.imagePath,
                includeHero: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              OverviewResult(result: foodScanResult.resultOverview),
              FavoriteChoiceResult(
                favoriteId: favoriteId,
                questionIndex: 0,
                title:
                    Strings.of(context).healthinessAndBenefitsOfFeaturedFoods,
                icon: Icons.health_and_safety,
              ),
              FavoriteChoiceResult(
                favoriteId: favoriteId,
                questionIndex: 1,
                title: Strings.of(context).factsAndSummaries,
                icon: Icons.dining,
              ),
              FavoriteChoiceResult(
                favoriteId: favoriteId,
                questionIndex: 2,
                title: Strings.of(context).unveilingDietaryPreferencesAndStatus,
                icon: Icons.fact_check,
              ),
              FavoriteChoiceResult(
                favoriteId: favoriteId,
                questionIndex: 3,
                title: Strings.of(context).howToPrepareItAtHome,
                icon: Icons.restaurant_menu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
