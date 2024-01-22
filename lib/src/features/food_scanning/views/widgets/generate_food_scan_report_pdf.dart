import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../core/util/functions/string_manipulations_and_search.dart';

Future<Uint8List> generateFoodScanReportPdf(
  PdfPageFormat format, {
  required String fileImagePath,
  required String resultOverview,
  required List<String?> questionsResults,
}) async {
  final doc = pw.Document(title: 'Food Scan Report');

  final image = pw.MemoryImage(File(fileImagePath).readAsBytesSync());

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.Page(
      pageTheme: pageTheme,
      build: (pw.Context context) {
        return pw.Column(
          children: [
            _titleForRefrencingTheApp(),
            pw.SizedBox(height: 30),
            pw.Center(
              child: pw.Image(image, height: 300),
            ),
            pw.SizedBox(height: 40),
            _description(
              "Unveiling Contents and Caloric Breakdown",
              resultOverview,
            ),
          ],
        );
      },
    ),
  );

  if (questionsResults[0] != null) {
    doc.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (pw.Context context) {
          return _description(
            "Healthiness and Benefits of Featured Foods",
            questionsResults[0]!,
          );
        },
      ),
    );
  }

  if (questionsResults[1] != null) {
    doc.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (pw.Context context) {
          return _description(
            "Facts and Summaries",
            questionsResults[1]!,
          );
        },
      ),
    );
  }

  if (questionsResults[2] != null) {
    doc.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (pw.Context context) {
          return _description(
            "Unveiling Dietary Preferences and Status",
            questionsResults[2]!,
          );
        },
      ),
    );
  }

  if (questionsResults[3] != null) {
    doc.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (pw.Context context) {
          return _description(
            "How to Prepare it at Home",
            questionsResults[3]!,
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
    /* theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),*/
    /* buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                  angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },*/
  );
}

pw.Widget _titleForRefrencingTheApp() {
  return pw.Column(
    children: [
      pw.RichText(
        text: pw.TextSpan(
          children: [
            const pw.TextSpan(text: "This Food Report is From "),
            pw.TextSpan(
              text: "MealMingle",
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
            "https://play.google.com/store/apps/details?id=com.salahalshafey.mealmingle",
      ),
      pw.Divider(),
    ],
  );
}

pw.Widget _description(String title, String description) {
  return pw.Column(
    children: [
      pw.Text(
        title,
        textDirection:
            firstCharIsRtl(title) ? pw.TextDirection.rtl : pw.TextDirection.ltr,
        style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
      ),
      pw.Divider(),
      pw.SizedBox(height: 20),
      pw.Text(
        description,
        textDirection: firstCharIsRtl(description)
            ? pw.TextDirection.rtl
            : pw.TextDirection.ltr,
      ),
    ],
  );
}
