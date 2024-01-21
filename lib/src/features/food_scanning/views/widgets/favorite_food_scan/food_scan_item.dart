import 'package:flutter/material.dart';

import '../../../../../core/util/widgets/custom_card.dart';

import '../../screens/favorite_food_scan_screen.dart';
import 'food_scan_item_widgets.dart';

class FoodScanItem extends StatelessWidget {
  const FoodScanItem({
    super.key,
    required this.favoriteId,
    required this.imagePath,
    required this.overview,
    required this.dateTime,
  });

  final String favoriteId;
  final String imagePath;
  final String overview;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: BorderRadius.circular(20),
      elevation: 10,
      margin: const EdgeInsets.all(15),
      onTap: () {
        Navigator.of(context).pushNamed(
          FavoriteFoodScanScreen.routeName,
          arguments: favoriteId,
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              ScanImage(imagePath),
              Positioned(
                bottom: 0,
                left: 0,
                child: ScanOverview(overview),
              ),
              Positioned(
                bottom: 10,
                right: 5,
                child: DeleteFromFavoriteButton(favoriteId),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ScanDate(dateTime),
                NumberOfQuestionResultsChecked(favoriteId),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
