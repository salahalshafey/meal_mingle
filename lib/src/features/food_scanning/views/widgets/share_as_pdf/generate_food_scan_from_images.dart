import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:screenshot/screenshot.dart';

import '../../../../../app.dart';
import '../../../../../core/util/functions/string_manipulations_and_search.dart';

Future<Uint8List> generateFoodScanReportPdfAfterConvertingResultsToImages(
  PdfPageFormat format, {
  required String fileImagePath,
  required String resultOverview,
  required List<String?> questionsResults,
}) async {
  final doc = pw.Document(title: 'Food Scan Report');
  final pageTheme = await _myPageTheme(format);

  final foodImage = pw.MemoryImage(File(fileImagePath).readAsBytesSync());

  final resultImages = await _convertquestionsResultsToImages(
    [
      resultOverview,
      ...questionsResults,
    ],
    [
      "Unveiling Contents and Caloric Breakdown",
      "Healthiness and Benefits of Featured Foods",
      "Facts and Summaries",
      "Unveiling Dietary Preferences and Status",
      "How to Prepare it at Home",
    ],
    [
      Icons.description,
      Icons.health_and_safety,
      Icons.dining,
      Icons.fact_check,
      Icons.restaurant_menu,
    ],
  );

  doc.addPage(
    pw.Page(
      pageTheme: pageTheme,
      build: (pw.Context context) {
        return pw.Column(
          children: [
            _titleForRefrencingTheApp(),
            pw.SizedBox(height: 30),
            pw.Center(
              child: pw.Image(foodImage, height: 500),
            ),
          ],
        );
      },
    ),
  );

  for (final image in resultImages) {
    doc.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(
              pw.MemoryImage(image),
              height: PdfPageFormat.a4.availableHeight,
            ),
          );
        },
      ),
    );
  }

  return doc.save();
}

///////////////////////////////////////////////////////////////////
///////////////////////
///////

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  // final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
    left: 1.0 * PdfPageFormat.cm,
    top: 1.0 * PdfPageFormat.cm,
    right: 1.0 * PdfPageFormat.cm,
    bottom: 1.0 * PdfPageFormat.cm,
  );

  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      fontFallback: [
        pw.Font.ttf(
          await rootBundle
              .load('assets/fonts/NotoSansArabic_Condensed-Regular.ttf'),
        )
      ],
    ),
  );
}

Future<List<Uint8List>> _convertquestionsResultsToImages(
  List<String?> questionsResults,
  List<String> titles,
  List<IconData> icons,
) {
  final List<Future<Uint8List>> result = [];

  for (int i = 0; i < questionsResults.length; i++) {
    if (questionsResults[i] != null) {
      result.add(_getImageFromWidget(
        titles[i],
        questionsResults[i]!,
        icons[i],
      ));
    }
  }

  return Future.wait(result);
}

pw.Widget _titleForRefrencingTheApp() {
  return pw.Column(
    children: [
      pw.RichText(
        text: pw.TextSpan(
          children: [
            const pw.TextSpan(text: "This Food Report is From "),
            pw.TextSpan(
              text: "AI MealMingle",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            const pw.TextSpan(text: " App."),
          ],
        ),
      ),
      pw.UrlLink(
        child: pw.Text(
          "Download the app from the Play Store",
          style: const pw.TextStyle(
            color: PdfColors.blue,
            decoration: pw.TextDecoration.underline,
            decorationColor: PdfColors.blue,
          ),
        ),
        destination:
            "https://play.google.com/store/apps/details?id=com.salahalshafey.aimealmingle",
      ),
      pw.Divider(),
    ],
  );
}

Future<Uint8List> _getImageFromWidget(
  String title,
  String description,
  IconData icon,
) {
  final context = navigatorKey.currentContext!;
  final screenshotController = ScreenshotController();

  return screenshotController.captureFromWidget(
    _DescriptionWidget(title, description, icon),
    // context: context,
    //  delay: const Duration(milliseconds: 100),
    pixelRatio: MediaQuery.of(context).devicePixelRatio,
    targetSize: Size(
      PdfPageFormat.a4.availableWidth,
      PdfPageFormat.a4.availableHeight,
    ),
  );

  /* return screenshotController.captureFromLongWidget(
    _descriptionWidget(title, description, icon),
    constraints: BoxConstraints(
      maxHeight: PdfPageFormat.a4.availableHeight,
      maxWidth: PdfPageFormat.a4.availableWidth,
    ),
  );*/
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget(
    this.title,
    this.description,
    this.icon,
  );

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    //  style: Theme.of(context).textTheme.bodyLarge,
    return Column(
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Directionality(
          textDirection: getDirectionalityOf(description),
          child: MarkdownBody(data: description),
        ),
      ],
    );
  }
}
