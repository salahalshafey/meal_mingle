import 'package:flutter/material.dart';

import '../../../data/models/food_scanning_result_model.dart';
import 'share_with_state.dart';

class ShareFoodScanningResultButton extends StatelessWidget {
  const ShareFoodScanningResultButton(this.dataToShare, {super.key});

  final FoodScanningResultModel dataToShare;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      tooltip: "Share as PDF",
      onPressed: () => _showSharingWithStateDialog(context, dataToShare),
      child: const Icon(Icons.share),
    );
  }
}

void _showSharingWithStateDialog(
  BuildContext context,
  FoodScanningResultModel dataToShare,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return PopScope(
        canPop: false,
        child: Dialog(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ShareWithState(dataToShare),
            ),
          ),
        ),
      );
    },
  );
}
