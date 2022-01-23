import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/appbar.dart';
import 'package:joma/materials/appbar_job.dart';
import 'package:joma/materials/assets.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppBackgroundColors().darkBackground,
        body: Center(
            child: ListView(children: <Widget>[
          Container(
            height: 255,
            margin: const EdgeInsets.only(bottom: 280),
          //   child: AppBarJobArea(
          //     bgColor: AppBackgroundColors().darkBackground,
          //     bgColorBar: AppColors().darkPrimaryColor,
          //     color: AppColors().darkPrimaryColor,
          //     title: 'Willkommen \nbei JOMA'.toUpperCase(),
          //     onPressed1: () {},
          //     onPressed2: () {},
          //   ),

          //   // child: ElevatedButton(
          //   //   onPressed: () {
          //   //     Navigator.pop(context);
          //   //   },
          //   //   child: const Text('Go back!'),
          //   // ),
          // ),
//         ])));
//   }
// }
          )])));}}