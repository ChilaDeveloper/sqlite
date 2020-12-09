import 'package:flutter/material.dart';
import 'MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SqlLite',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        // backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'SqLite Ejercicio 2'),
    );
  }
}