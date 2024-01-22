import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../injection_container.dart' as di;

import '../providers/food_scan.dart';

import '../../../../core/util/widgets/custom_back_button.dart';

import '../widgets/food_scan/loading_search_in_the_image.dart';
import '../widgets/food_scan/result_info.dart';

class FoodScanResultScreen extends StatelessWidget {
  const FoodScanResultScreen(this.imagePath, {super.key});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di.sl<FoodScan>(),
      builder: (ctx, child) => Scaffold(
        body: FutureBuilder(
          key: UniqueKey(),
          future: Provider.of<FoodScan>(ctx, listen: false)
              .getFoodOverview(imagePath),
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                appBar: AppBar(leading: const CustomBackButton()),
                body: Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingSearchInTheImage(imagePath: imagePath);
            }

            final overviewResult = snapshot.data!;

            return ResultInfo(
              imagePath: imagePath,
              overviewResult: overviewResult,
            );
          },
        ),
      ),
    );
  }
}
