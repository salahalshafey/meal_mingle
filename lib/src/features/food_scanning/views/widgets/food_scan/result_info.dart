import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../../../core/util/functions/string_manipulations_and_search.dart';

import '../../../data/models/food_scanning_result_model.dart';

import '../../providers/food_scan.dart';
import '../floating_action_buttons.dart';
import '../image_and_choices_appbar.dart';

import '../overview_result.dart';
import 'choice_result.dart';

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
                  id: "id",
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
              const ChoiceResult(
                questionIndex: 0,
                title: "Healthiness and Benefits of Featured Foods",
                icon: Icons.health_and_safety,
              ),
              const ChoiceResult(
                questionIndex: 1,
                title: "Facts and Summaries",
                icon: Icons.dining,
              ),
              const ChoiceResult(
                questionIndex: 2,
                title: "Unveiling Dietary Preferences and Status",
                icon: Icons.fact_check,
              ),
              const ChoiceResult(
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
