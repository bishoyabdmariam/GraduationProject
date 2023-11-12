import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:imagetotext/Veiw/patient/clock.dart';

class AllAlarms extends StatelessWidget {
  const AllAlarms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Alarms Page",
          ),
        ),
        body: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Alarm 1",
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Clock()));
                  },
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                width: double.infinity,
                height: 70,
                margin: EdgeInsets.all(10),
                child: Text(
                  "Alarm 2",
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                width: double.infinity,
                height: 70,
                margin: EdgeInsets.all(10),
                child: Text(
                  "Alarm 3",
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                width: double.infinity,
                height: 70,
                margin: EdgeInsets.all(10),
                child: Text(
                  "Alarm 4",
                ),
              ),
            ),
          ],
        ));
  }
}
