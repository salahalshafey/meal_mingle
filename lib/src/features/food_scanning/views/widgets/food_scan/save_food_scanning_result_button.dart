import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/util/builders/custom_snack_bar.dart';

import '../../providers/food_scan.dart';

class SaveFoodScanningResultButton extends StatelessWidget {
  const SaveFoodScanningResultButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodScan>(context);

    return FloatingActionButton(
      heroTag: null,
      tooltip:
          provider.isFavorite ? "Remove from favorites" : "Save to favorites",
      onPressed: () {
        provider.toggleFavorite().onError((error, stackTrace) =>
            showCustomSnackBar(context: context, content: error.toString()));
      },
      child: Icon(
        provider.isFavorite
            ? Icons.favorite_rounded
            : Icons.favorite_border_rounded,
        color: provider.isFavorite ? Colors.pink : null,
      ),
    );
  }
}
