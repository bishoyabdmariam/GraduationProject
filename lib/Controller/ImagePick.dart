import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagetotext/Controller/ocr.dart';

class ImagePick {
  static Future uploadimage1(ImagePicker imagepicker, File? image) async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.camera);

    if (pickedimage != null) {
      image = File(pickedimage.path);
      performImageLabeling(image);
    } else {}
  }

  static uploadimagefromgallary(ImagePicker imagepicker, File? image1) async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.gallery);

    if (pickedimage != null) {
      image1 = File(pickedimage.path);
      String res = "";
    } else {}
  }

  static performImageLabeling(File? image) async {
    final FirebaseVisionImage firebasevisionimage =
        FirebaseVisionImage.fromFile(image);
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText visiontext = await recognizer.processImage(firebasevisionimage);

    String result = 'Hello guys';

    for (TextBlock block in visiontext.blocks) {
      final String txt = block.text;
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
