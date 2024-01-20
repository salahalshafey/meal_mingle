import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/food_scan.dart';

class SaveFoodScanningResultButton extends StatelessWidget {
  const SaveFoodScanningResultButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodScan>(context);

    return FloatingActionButton(
      heroTag: null,
      onPressed: provider.toggleFavorite,
      child: Icon(
        provider.isFavorite
            ? Icons.favorite_rounded
            : Icons.favorite_border_rounded,
        color: provider.isFavorite ? Colors.pink : null,
      ),
    );
  }
}

///////////////////////////////////////////
///////////////
/////
class ShareFoodScanningResultButton extends StatelessWidget {
  const ShareFoodScanningResultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      //backgroundColor: Colors.white,
      onPressed: () async {
        final allFav =
            await Provider.of<FoodScan>(context, listen: false).getAllForTest();

        print(allFav.length);
        await Clipboard.setData(ClipboardData(text: allFav.toString()));
      },
      child: const Icon(Icons.share),
    );
  }
}
