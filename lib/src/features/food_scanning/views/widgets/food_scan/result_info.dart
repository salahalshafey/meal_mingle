import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
          const ShareFoodScanningResultButton(),
          const SizedBox(height: 20),
          const SaveFoodScanningResultButton(),
        ].animate(delay: 500.ms, interval: 50.ms).slideX(begin: 1.5),
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
