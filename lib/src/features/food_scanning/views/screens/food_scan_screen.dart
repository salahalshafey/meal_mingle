// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/util/builders/go_to_screen_with_slide_transition.dart';
import '../../../../core/util/builders/image_picker.dart';
import '../../../home_and_drawer/main_drawer.dart';
import '../../data/services/favorite_food_scanning_local_data_service.dart';
import '../../data/services/favorite_food_scanning_local_storage_service.dart';
import '../../viewmodels/favorite_food_scanning_viewmodel.dart';
import '../providers/convert_image_to_png.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Food With AI"),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
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
            onPressed: () async {
              final test = FavoriteFoodScanningViewmodelImpl(
                localDataService: FavoriteFoodScanningHiveImpl(),
                localStorageService: FavoriteFoodScanningLocalStorageImpl(),
              );

              final allFavorite = await test.getAllFavorite();

              print(allFavorite.length);
              await Clipboard.setData(
                  ClipboardData(text: allFavorite.toString()));
            }, // => _getImageAndGoToResultScreen(context),
            child: const Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: null,
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
