import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/builders/custom_snack_bar.dart';

import '../../data/models/food_scanning_result_model.dart';
import '../providers/food_scan.dart';
import 'generate_food_scan_report_pdf.dart';

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

///////////////////////////////////////////
///////////////
/////
class ShareFoodScanningResultButton extends StatelessWidget {
  const ShareFoodScanningResultButton(this.dataToShare, {super.key});

  final FoodScanningResultModel dataToShare;

  void _covertToPdfAndShare() async {
    final pdfbytes = await generateFoodScanReportPdf(
      PdfPageFormat.a4,
      fileImagePath: dataToShare.imagePath,
      resultOverview: dataToShare.resultOverview,
      questionsResults: dataToShare.questionsResults,
    );

    final file = File("C:\\Users\\salah alaa\\Desktop\\example.pdf");
    await file.writeAsBytes(pdfbytes);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      tooltip: "Share as PDF",
      onPressed: _covertToPdfAndShare,
      child: const Icon(Icons.share),
    );
  }
}

/**
 * """"## This is a photo of a glass of tea. 
            **Tea** is a beverage made from the Camellia sinensis plant. It is typically brewed with hot water and can be served with milk, sugar, or other flavorings. Tea contains caffeine, which is a stimulant. The amount of caffeine in tea varies depending on the type of tea and how it is brewed.

The calorie `content` of tea also varies depending on how it is prepared. 
* A cup of black tea without milk or sugar contains about 2 calories. 
* A cup of green tea without milk or sugar contains about 0 calories. 
* A cup of tea with milk and sugar contains about **100 calories**.

Tea is a healthy beverage that can be enjoyed as part of a balanced diet. It is a good source of antioxidants, which can help to protect the body from damage caused by free radicals. Tea can also help to improve heart health and reduce the risk of some types of cancer."""
 */


