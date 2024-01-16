import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart';

String? convertImageToPng(String inputImagePath) {
  final imageMime = inputImagePath.split(".").last;

  if (imageMime == "png" ||
      imageMime == "jpeg" ||
      imageMime == "webp" ||
      imageMime == "heic") {
    return inputImagePath;
  }

  // Read the input image
  File inputFile = File(inputImagePath);
  List<int> inputImageBytes = inputFile.readAsBytesSync();
  final inputImage = decodeImage(Uint8List.fromList(inputImageBytes));
  if (inputImage == null) {
    //throw ErrorDescription("can't convert the Image to png");

    return null;
  }

  // Save the image in PNG format
  // File outputImageFile = File(outputImagePath);
  inputFile.writeAsBytesSync(encodePng(inputImage));
  final dotSeperators = inputFile.path.split(".");
  final newPath =
      "${dotSeperators.sublist(0, dotSeperators.length - 1).join(".")}.png";

  inputFile = inputFile.renameSync(newPath);

  return inputFile.path;
}
