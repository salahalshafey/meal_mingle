import 'package:flutter/material.dart';

import 'floating_action_buttons.dart';
import 'image_and_choices_appbar.dart';

import 'overview_result.dart';
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
      floatingActionButton: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShareFoodScanningResultButton(),
          SizedBox(height: 20),
          SaveFoodScanningResultButton(),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.startFloat, ///// remove this
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
              const ChoiceResult(0),
              const ChoiceResult(1),
              const ChoiceResult(2),
              const ChoiceResult(3),
            ],
          ),
        ),
      ),
    );
  }
}
