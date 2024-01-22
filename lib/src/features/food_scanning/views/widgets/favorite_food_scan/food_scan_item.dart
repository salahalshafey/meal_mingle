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
    required this.removeItem,
  });

  final String favoriteId;
  final String imagePath;
  final String overview;
  final DateTime dateTime;
  final void Function(int index) removeItem;

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
              PositionedDirectional(
                bottom: 0,
                start: 0,
                child: ScanOverview(overview),
              ),
              PositionedDirectional(
                bottom: 10,
                end: 5,
                child: DeleteFromFavoriteButton(favoriteId, removeItem),
              ),
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
