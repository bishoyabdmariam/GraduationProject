import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class Ocr {
  static performImageLabeling(File? image) async {
    final FirebaseVisionImage firebasevisionimage =
        FirebaseVisionImage.fromFile(image);
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText visiontext = await recognizer.processImage(firebasevisionimage);

    String result = 'Hello';

    for (TextBlock block in visiontext.blocks) {
      String txt = block.text;
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          // ignore: prefer_interpolation_to_compose_strings
          result += element.text + " ";
        }
      }
      result += "\n\n";
    }
  }
}
