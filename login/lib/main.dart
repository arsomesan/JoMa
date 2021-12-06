// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bachelor_projekt/views/screen_login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joma',
      home:Center(
        child: AnimatedSplashScreen(
          splash: Image.asset(
            'assets/Logo.png',
          ), 
        nextScreen: ScreenLogin(),
            splashTransition: SplashTransition.rotationTransition,
            backgroundColor: Colors.amber,
          ),
         
         
         /* child: Text('joma',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),*/
        ));
  }
}