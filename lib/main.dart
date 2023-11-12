// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imagetotext/Veiw/welcome/FirstScreen.dart';

import 'Veiw/patient/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB1DvNircBdMQLTqF904Y1y0UqWNxhR1qs",
          appId: "imagetotext-63b16",
          messagingSenderId: "messagingSenderId",
          projectId: "imagetotext-63b16"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Courgette",
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
