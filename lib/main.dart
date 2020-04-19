import 'package:covid19/colors.dart';
import 'package:covid19/screens/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Circular',
          primaryColor: primaryBlack,
          brightness: Brightness.light),
    );
  }
}
