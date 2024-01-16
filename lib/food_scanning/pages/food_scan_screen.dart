// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../core/builders/go_to_screen_with_slide_transition.dart';
import '../../core/builders/image_picker.dart';
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
    print(await image.length());

    final convertedPath = convertImageToPng(image.path);

    if (convertedPath == null) {
      return;
    }

    // print(convertedPath);

    goToScreenWithSlideTransition(
      context,
      FoodScanResultScreen(convertedPath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Food With AI"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/food_scan.jpg"),
              /* Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  """This is a photo of a glass of tea. Tea is a beverage made from the Camellia sinensis plant. It is typically brewed with hot water and can be served with milk, sugar, or other flavorings. Tea contains caffeine, which is a stimulant. The amount of caffeine in tea varies depending on the type of tea and how it is brewed.
              مرحباً، كيف أحوالكم؟
              """,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  """
              The calorie content of tea also varies depending on how it is prepared. A cup of black tea without milk or sugar contains about 2 calories. A cup of green tea without milk or sugar contains about 0 calories. A cup of tea with milk and sugar contains about 100 calories.
              مرحباً، كيف أحوالكم؟
              """,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  """This is a photo of a glass of tea. Tea is a beverage made from the Camellia sinensis plant. It is typically brewed with hot water and can be served with milk, sugar, or other flavorings. Tea contains caffeine, which is a stimulant. The amount of caffeine in tea varies depending on the type of tea and how it is brewed.
              مرحباً، كيف أحوالكم؟
              """,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  """
              The calorie content of tea also varies depending on how it is prepared. A cup of black tea without milk or sugar contains about 2 calories. A cup of green tea without milk or sugar contains about 0 calories. A cup of tea with milk and sugar contains about 100 calories.
              مرحباً، كيف أحوالكم؟
              """,
                  style: TextStyle(fontSize: 18),
                ),
              ),*/
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getImageAndGoToResultScreen(context),
        child: const Icon(
          Icons.photo_camera,
          size: 30,
        ),
      ),
    );
  }
}
