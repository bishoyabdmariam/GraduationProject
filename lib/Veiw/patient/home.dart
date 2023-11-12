// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imagetotext/Veiw/patient/clock.dart';
import 'package:imagetotext/Veiw/patient/notifications.dart';
import 'package:imagetotext/Veiw/patient/alarm.dart';
import 'package:imagetotext/Veiw/patient/precesions-1.dart';
import 'package:imagetotext/Veiw/patient/scan_prescription.dart';

import '../login/login1.dart';

class Home extends StatelessWidget {
  Home();

  String value = '';
  Home.fromname(this.value);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => notification()));
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "asset/download (2).jpg",
              ),
              fit: BoxFit.cover,
            )),
            height: 700,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                  )
                ],
              ),
              SizedBox(
                height: size.height / 40,
              ),
              SizedBox(
                height: size.height / 40,
              ),
              InkWell(
                splashColor: Colors.black26,
                onTap: (() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return prescription();
                    }))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(280, 80),
                            textStyle: TextStyle(fontSize: 28),
                            onPrimary: Colors.black),
                        onPressed: (() => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return prescription();
                            }))),
                        icon: Icon(
                          Icons.document_scanner_rounded,
                        ),
                        label: Text("Read Prescription")),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(280, 80),
                      textStyle: TextStyle(fontSize: 28),
                      onPrimary: Colors.black),
                  onPressed: (() => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Clock();
                      }))),
                  icon: Icon(
                    Icons.alarm,
                  ),
                  label: Text("Alarm")),
              SizedBox(
                height: size.height / 30,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(280, 80),
                      textStyle: TextStyle(fontSize: 28),
                      onPrimary: Colors.black),
                  onPressed: (() => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AllPrescription.fromname();
                      }))),
                  icon: Icon(
                    Icons.medical_information,
                  ),
                  label: Text("Prescriptions")),
              SizedBox(
                height: size.height / 30,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(280, 80),
                      textStyle: TextStyle(fontSize: 28),
                      onPrimary: Colors.black),
                  onPressed: (() => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Clock();
                      }))),
                  icon: Icon(
                    Icons.chat,
                  ),
                  label: Text("Chat Room"))
            ])),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Container(
                color: Colors.green[700],
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('asset/profile.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      value.split("@")[0],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                // ignore: sort_child_properties_last
                child: InkWell(
                  child: ListTile(
                    leading: Text(
                      "Sign Out",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              title: Row(children: const [
                                Padding(
                                    padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.logout)),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Sign Out',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ]),
                              content: Text('DO you wanna signout!'),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel')),
                                TextButton(
                                    onPressed: () async {
                                      logout(context);
                                    },
                                    child: Text('Ok'))
                              ],
                            );
                          });
                    },
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  CircularProgressIndicator();
  await FirebaseAuth.instance.signOut();
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  );
}
