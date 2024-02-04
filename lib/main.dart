import 'package:bmi/screens/home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHome(),
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white, size: 60),
          textTheme: const TextTheme(
            displayMedium: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            displayLarge: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
