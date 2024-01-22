import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/functions/string_manipulations_and_search.dart';

import '../providers/favorites_food_scan.dart';

import '../widgets/favorite_food_scan/favorite_choice_result.dart';
import '../widgets/floating_action_buttons.dart';
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
                title: "Healthiness and Benefits of Featured Foods",
                icon: Icons.health_and_safety,
              ),
              FavoriteChoiceResult(
                favoriteId: favoriteId,
                questionIndex: 1,
                title: "Facts and Summaries",
                icon: Icons.dining,
              ),
              FavoriteChoiceResult(
                favoriteId: favoriteId,
                questionIndex: 2,
                title: "Unveiling Dietary Preferences and Status",
                icon: Icons.fact_check,
              ),
              FavoriteChoiceResult(
                favoriteId: favoriteId,
                questionIndex: 3,
                title: "How to Prepare it at Home",
                icon: Icons.restaurant_menu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
