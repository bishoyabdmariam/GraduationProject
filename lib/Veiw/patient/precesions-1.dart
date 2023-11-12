// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'alarms.dart';

class AllPrescription extends StatelessWidget {
  String value = '';

  @override
  AllPrescription(this.value, {super.key});

  AllPrescription.fromname();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Precesions Page"),
        ),
        body: Column(
          children: <Widget>[
            Card(
              color: Colors.amberAccent,
              elevation: 5,
              child: SizedBox(
                height: 90,
                width: double.infinity,
                child: InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: double.infinity,
                          color: Colors.green,
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        ),
                        Column(
                          children: [
                            const Text(
                              "precision 1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              DateTime.now().toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllAlarms()));
                  },
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: const Text(
                  "",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
