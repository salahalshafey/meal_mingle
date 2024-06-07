// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/models/food_scanning_result_model.dart';
import 'generate_food_scan_from_images.dart';

class ShareWithState extends StatefulWidget {
  const ShareWithState(this.dataToShare, {super.key});

  final FoodScanningResultModel dataToShare;

  @override
  State<ShareWithState> createState() => _ShareWithStateState();
}

class _ShareWithStateState extends State<ShareWithState> {
  String _stringState = Strings.get.takingScreenshotsOfTheResults;
  IconData _iconState = Icons.screenshot;
  double _passedState = 0.1;
  bool _errorHappened = false;

  String get desktopPath =>
      'C:\\Users\\${Platform.environment['USERPROFILE']!.split('\\').last}\\Desktop';

  Future<void> _shareThePdf(String pdfFilePath) async {
    await Share.shareXFiles([XFile(pdfFilePath)]);
  }

  void _convertTheDataToPdfAndShare() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _stringState = Strings.of(context).convertingScreenshotsToPdf;
        _iconState = Icons.picture_as_pdf_rounded;
        _passedState = 0.5;
      });

      final pdfbytes =
          await generateFoodScanReportPdfAfterConvertingResultsToImages(
        PdfPageFormat.a4,
        fileImagePath: widget.dataToShare.imagePath,
        resultOverview: widget.dataToShare.resultOverview,
        questionsResults: widget.dataToShare.questionsResults,
      );

      if (Platform.isWindows) {
        setState(() {
          _stringState = Strings.of(context).preparingThePdfToBeSavedAtDesktop;
          _iconState = Icons.desktop_windows;
          _passedState = 0.9;
        });
        await Future.delayed(const Duration(seconds: 2));

        final pdfName = "food_report_${widget.dataToShare.id}.pdf";
        final desktopFilePath = File("$desktopPath\\$pdfName");
        await desktopFilePath.writeAsBytes(pdfbytes);

        Navigator.of(context).pop();
        await _shareThePdf(desktopFilePath.path);

        return;
      }

      setState(() {
        _stringState = Strings.of(context).preparingThePdfToShare;
        _iconState = Icons.share;
        _passedState = 0.9;
      });
      await Future.delayed(const Duration(seconds: 2));

      const pdfName = "food_report.pdf";
      final tempDir = await getApplicationCacheDirectory();

      final pdfFile = File("${tempDir.path}/$pdfName");
      await pdfFile.writeAsBytes(pdfbytes);

      Navigator.of(context).pop();
      await _shareThePdf(pdfFile.path);
    } catch (error) {
      setState(() {
        _stringState = Strings.of(context).errorHappenedCouldntShareThePdf;
        _iconState = Icons.error;
        _passedState = 0.9;
        _errorHappened = true;
      });
    }
  }

  /* void _simulateSharing() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _stringState = "Converting screenshots to PDF...";
        _iconState = Icons.picture_as_pdf_rounded;
        _passedState = 0.5;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _stringState = "Preparing the PDF to Share...";
        _iconState = Icons.share;
        _passedState = 0.9;
      });

      await Future.delayed(const Duration(seconds: 2), () {
        throw Error();
      });

      //  Navigator.of(context).pop();
    } catch (error) {
      setState(() {
        _stringState = "Error happened, Couldn't share the PDF!!!";
        _iconState = Icons.error;
        _passedState = 0.9;
        _errorHappened = true;
      });
    }
  }*/

  @override
  void initState() {
    // _imetateSharing();

    _convertTheDataToPdfAndShare();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          _iconState,
          color: _errorHappened ? Colors.red : null,
        ),
        const SizedBox(height: 20),
        Text(_stringState, textAlign: TextAlign.center),
        const SizedBox(height: 40),
        LinearProgressIndicator(
          value: _passedState,
          borderRadius: BorderRadius.circular(5),
        ),
        _errorHappened
            ? Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(Strings.of(context).ok),
                  ),
                ),
              )
            : const SizedBox(height: 50),
      ],
    );
  }
}
