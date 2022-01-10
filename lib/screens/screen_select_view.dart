import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:joma/controllers/view_controller.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/screens/screen_home.dart';

import 'package:get/get.dart';
import 'package:joma/materials/assets.dart';

class SelectView extends StatelessWidget {

  final ViewController viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'ANSICHT',
            textAlign: TextAlign.center,
            //style: TextStyle(fontFamily: 'Marcellus', fontSize: 20),
            style: AppTextStyles.darkH1,
          ),
        ),
        //backgroundColor: const Color.fromRGBO(129, 129, 129, 1),
          backgroundColor: AppBackgroundColors().darkBackground,
      ),
      backgroundColor: AppBackgroundColors().darkBackground,

      body: Center(
        child: Column(
          children: [

            //Card1: nur Bilder
            GetBuilder<ViewController>(builder: (_) {
              return Flexible(
                child: GestureDetector(
                  onTap: () {viewController.setView(0);},
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    /*child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                    debugPrint('Card tapped.');
                    },*/
                    child: Column(
                      children: [
                        Container(

                         padding: EdgeInsets.all(28.0),
                         margin: EdgeInsets.all(44.0),
                          child: Text("Bildsprache",
                                      style:  AppTextStyles.darkH2,
                                      textAlign: TextAlign.center),


                        ),
                      ],
                    ),
                    color: (() {
                      if (_.state == 0) {
                         return AppColors().darkPrimaryColor;

                      } else {
                        return Colors.white;
                      }
                    }()),
                    shape: Border.all(
                      color: (() {
                        if (_.state == 0) {
                          return Colors.blue;
                        } else {
                          return Colors.black;
                        }
                      }()),
                    ),

                  ),
                ),
                flex: 1,
              );
            },),

            //Card2: Leichte Sprache
            GetBuilder<ViewController>(builder: (_) {
              return Flexible(
                child: GestureDetector(
                  onTap: () {viewController.setView(1);},
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Container(

                          padding: EdgeInsets.all(28.0),
                          margin: EdgeInsets.all(44.0),
                          child: Text("Leichte Sprache",
                              style:  AppTextStyles.darkH2,
                              textAlign: TextAlign.center),


                        ),
                      ],
                    ),
                    color: (() {
                      if (viewController.state == 1) {
                        return AppColors().darkPrimaryColor;
                      } else {
                        return Colors.white;
                      }
                    }()),
                    shape: Border.all(
                      color: (() {
                        if (_.state == 1) {
                          return Colors.blue;
                        } else {
                          return Colors.black;
                        }
                      }()),
                    ),

                  ),
                ),
                flex: 1,
              );
            },),

            //Card3: Volltext
            GetBuilder<ViewController>(builder: (_) {
              return Flexible(
                child: GestureDetector(
                  onTap: () {viewController.setView(2);},
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Container(

                          padding: EdgeInsets.all(28.0),
                          margin: EdgeInsets.all(44.0),
                          child: Text("Volltext",
                              style:  AppTextStyles.darkH2,
                              textAlign: TextAlign.center),


                        ),
                      ],
                    ),
                    color: (() {
                      if (_.state == 2) {
                        return AppColors().darkPrimaryColor;
                      } else {
                        return Colors.white;
                      }
                    }()),
                    shape: Border.all(
                      color: (() {
                        if (_.state == 2) {
                          return Colors.blue;
                        } else {
                          return Colors.black;
                        }
                      }()),
                    ),

                  ),
                ),
                flex: 1,
              );
            },),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        //color: Colors.black12,
        color: AppBackgroundColors().darkBackground,
        child:
        AppButton(text: "Weiter",
                  color: AppColors().darkSecondaryColor,
                  onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenHome()));},
        ),

      ),
    );
  }
}
