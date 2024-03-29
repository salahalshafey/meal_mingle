import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:meal_mingle/l10n/l10n.dart';

import '../../../../../core/util/functions/string_manipulations_and_search.dart';

import '../../../data/models/food_scanning_result_model.dart';

import '../../providers/food_scan.dart';
import '../share_as_pdf/share_food_scanning_result.dart.dart';
import '../image_and_choices_appbar.dart';

import '../overview_result.dart';
import 'choice_result.dart';
import 'save_food_scanning_result_button.dart';

class ResultInfo extends StatelessWidget {
  const ResultInfo({
    super.key,
    required this.imagePath,
    required this.overviewResult,
  });

  final String imagePath;
  final String overviewResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<FoodScan>(
            builder: (context, provider, child) {
              return ShareFoodScanningResultButton(
                FoodScanningResultModel(
                  id: DateTime.now().hashCode.toString(),
                  dateTime: DateTime.now(),
                  imagePath: imagePath,
                  resultOverview: overviewResult,
                  questionsResults: provider.questionsResults,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          const SaveFoodScanningResultButton(),
        ]
            .animate(delay: 500.ms, interval: 50.ms)
            .slideX(begin: appCurrentDirectionalityIsRtl() ? -1.5 : 1.5),
      ),
      //  floatingActionButtonLocation:
      // FloatingActionButtonLocation.startFloat, ///// remove this
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              ImageAndChoicesAppbar(imagePath: imagePath),
            ];
          },
          body: TabBarView(
            children: [
              OverviewResult(result: overviewResult),
              ChoiceResult(
                questionIndex: 0,
                title:
                    Strings.of(context).healthinessAndBenefitsOfFeaturedFoods,
                icon: Icons.health_and_safety,
              ),
              ChoiceResult(
                questionIndex: 1,
                title: Strings.of(context).factsAndSummaries,
                icon: Icons.dining,
              ),
              ChoiceResult(
                questionIndex: 2,
                title: Strings.of(context).unveilingDietaryPreferencesAndStatus,
                icon: Icons.fact_check,
              ),
              ChoiceResult(
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
