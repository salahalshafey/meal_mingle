// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meal_mingle/l10n/l10n.dart';

import '../../../../core/util/builders/go_to_screen_with_slide_transition.dart';
import '../../../../core/util/builders/image_picker.dart';

import '../providers/convert_image_to_png.dart';
import '../../../home_and_drawer_screens/main_drawer.dart';
import 'all_favorite_food_scan_screen.dart';
import 'food_scan_result_screen.dart';

class FoodScanScreen extends StatelessWidget {
  const FoodScanScreen({super.key});

  void _getImageAndGoToResultScreen(BuildContext context) async {
    final image = await myImagePicker(context);

    if (image == null) {
      return;
    }

    //print(image.path);
    // print(await image.length());

    final convertedPath = convertImageToPng(image.path);

    if (convertedPath == null) {
      return;
    }

    // print(convertedPath);

    goToScreenWithSlideTransition(
      context,
      FoodScanResultScreen(convertedPath),
      //  beginOffset: const Offset(0, 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 1000;

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.of(context).scanFoodWithAi),
        centerTitle: true,
      ),
      drawer: isWideScreen ? null : const MainDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/food_scan.jpg"),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: null,
            tooltip: "Favorites",
            onPressed: () async {
              goToScreenWithSlideTransition(
                context,
                const AllFavoriteFoodScanScreen(),
              );
            }, // => _getImageAndGoToResultScreen(context),
            child: const Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: null,
            tooltip: "Get Image to Scan",
            onPressed: () => _getImageAndGoToResultScreen(context),
            child: const Icon(
              Icons.photo_camera,
              size: 30,
            ),
          ),
        ].animate(interval: 25.ms).slideY(begin: 3),
      ),
    );
  }
}
