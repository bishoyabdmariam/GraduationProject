// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// ignore: camel_case_types
class alarm extends StatelessWidget {
  String value = '';
  @override
  alarm(this.value, {super.key});

  alarm.fromname();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alarm"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Container(
                child: Text(
                  "Prescription",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
