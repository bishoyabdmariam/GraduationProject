// ignore_for_file: prefer_const_constructors, sort_child_properties_last, import_of_legacy_library_into_null_safe, implementation_imports, unused_import, unnecessary_import, unnecessary_new, duplicate_ignore, camel_case_types, unnecessary_null_comparison

import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// ignore: unused_import
import 'package:imagetotext/Controller/ImagePick.dart';
import 'package:imagetotext/Veiw/patient/alarm.dart';
import 'package:imagetotext/Veiw/patient/precesions-1.dart';

import '../../Controller/Ocr.dart';

class prescription extends StatefulWidget {
  const prescription({super.key});

  @override
  State<prescription> createState() => _prescriptionState();
}

// ignore: camel_case_types
class _prescriptionState extends State<prescription> {
  String result = '';
  File? image;
  File? image1;
  var imagepicker = new ImagePicker();

  uploadimage() async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.camera);
    image = File(pickedimage!.path);
    image = await _cropimage(imagefile: image!);

    setState(() {
      if (pickedimage != null) {
        performImageLabeling();
      } else {}
    });
  }

  uploadfromgallary() async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.gallery);
    image = File(pickedimage!.path);
    image = await _cropimage(imagefile: image!);
    setState(() {
      if (pickedimage != null) {
        performImageLabeling();
      } else {}
    });
  }

  Future<File?> _cropimage({required File imagefile}) async {
    CroppedFile? croppedimage =
        await ImageCropper().cropImage(sourcePath: imagefile.path);
    if (croppedimage == null) return null;
    return File(croppedimage.path);
  }

  performImageLabeling() async {
    final FirebaseVisionImage firebasevisionimage =
        FirebaseVisionImage.fromFile(image);
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText visiontext = await recognizer.processImage(firebasevisionimage);

    result = 'Hello';
    setState(() {
      for (TextBlock block in visiontext.blocks) {
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            // ignore: prefer_interpolation_to_compose_strings
            result += element.text + " ";
          }
        }
        result += "\n\n";
        print(result);
      }

      String timeRegex = r'\b(?:0?[1-9]|1[0-2]):[0-5]\d\s*[ap]\.?m\.?';
      RegExp regExp = RegExp(timeRegex, caseSensitive: false);

      String timeText = '';
      for (TextBlock block in visiontext.blocks) {
        for (TextLine line in block.lines) {
          for (TextElement word in line.elements) {
            String wordText = word.text;
            if (regExp.hasMatch(wordText)) {
              timeText += wordText + ' ';
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            image: const DecorationImage(
          image: AssetImage('asset/back.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            SizedBox(
              width: 100,
            ),
            Container(
              height: 280,
              width: 250,
              margin: EdgeInsets.only(top: 70),
              padding: EdgeInsets.only(left: 28, bottom: 5, right: 18),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/note.jpg'), fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 140),
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'asset/pin.png',
                          height: 240,
                          width: 240,
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: TextButton(
                        onPressed: uploadimage,
                        onLongPress: uploadfromgallary,
                        child: Container(
                            margin: EdgeInsets.only(top: 25),
                            child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.black87,
                                  BlendMode.hue,
                                ),
                                child: image != null
                                    ? Image.file(
                                        image!,
                                        width: 140,
                                        height: 192,
                                        fit: BoxFit.fill,
                                      )
                                    // ignore: sized_box_for_whitespace
                                    : Container(
                                        width: 240,
                                        height: 200,
                                        child: Icon(
                                          Icons.camera,
                                          size: 100,
                                          color: Colors.grey,
                                        ),
                                      )))),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
                onPressed: (() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AllPrescription(result);
                    }))),
                icon: Icon(Icons.alarm),
                label: Text("Alarm"))
          ],
        ),
      ),
    );
  }
}
