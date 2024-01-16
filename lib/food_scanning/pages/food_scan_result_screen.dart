import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/food_scan.dart';

import '../widgets/result_info.dart';

class FoodScanResultScreen extends StatelessWidget {
  const FoodScanResultScreen(this.imagePath, {super.key});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FoodScan(),
      builder: (ctx, child) => Scaffold(
        body: FutureBuilder(
          key: UniqueKey(),
          future: Provider.of<FoodScan>(ctx, listen: false)
              .getFoodOverview(imagePath),
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
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
