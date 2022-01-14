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
                    child: Column(
                      children: [
                        Container(
                         //padding: EdgeInsets.all(28.0),
                          margin: EdgeInsets.all(65.0),
                          child:
                            Text("NUR BILDER",
                                      style:  AppTextStyles.darkH2,
                                      textAlign: TextAlign.center
                          ),
                        ),
                        Container(
                          child: AppIcons().nurBilder,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
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
                          //padding: EdgeInsets.all(28.0),
                          margin: EdgeInsets.all(43.0),
                          child: Text("EINFACHE SPRACHE",
                              style:  AppTextStyles.darkH2,
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          child: AppIcons().einfacheSprache,
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
                    shape:
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
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
                          //padding: EdgeInsets.all(28.0),
                          margin: EdgeInsets.all(60.0),
                          child: Text("VOLLTEXT",
                              style:  AppTextStyles.darkH2,
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          child: AppIcons().vollText,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                flex: 1,
              );
            },),Container(
                height:75,
                width: 370,
                child:
                AppButton(text: "Weiter",
                  color: AppColors().darkPrimaryColor,
                  onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenHome()));},
                )
            ),
          ],
        ),
      ),
    );
  }
}
