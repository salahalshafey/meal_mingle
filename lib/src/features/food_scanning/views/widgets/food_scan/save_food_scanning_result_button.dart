import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';
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
      tooltip: provider.isFavorite
          ? Strings.of(context).removeFromFavorites
          : Strings.of(context).saveToFavorites,
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
