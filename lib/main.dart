import 'package:covid19/Constants.dart';
import 'package:covid19/colors.dart';
import 'package:covid19/screens/CountryPage.dart';
import 'package:covid19/screens/HomePage.dart';
import 'package:covid19/screens/Symptoms.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
        seconds: 3,
        backgroundColor: primaryBlack,
        image: Image.asset('assets/splash.png'),
        loaderColor: Colors.white,
        photoSize: 150.0,
        loadingText: Text(
          'Stay Home, Stay Safe.',
          style: kLoadingTextStyle,
        ),
        navigateAfterSeconds: PageView(
          controller: PageController(initialPage: 1),
          physics: BouncingScrollPhysics(),
          children: [Symptoms(), HomePage(), CountryPage()],
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Circular',
          primaryColor: primaryBlack,
          brightness: Brightness.dark),
    );
  }
}

//todo: add nepal's data in home screen
//todo: add splashscreen
