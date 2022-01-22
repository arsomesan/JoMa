import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/screens/screen_settings.dart';

import 'appbar.dart';


class RoundRecMainImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: AppColors().darkPrimaryColor,
            border: Border.all(
                width: 6,
                color: AppColors().darkPrimaryColor
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.zero,
              bottom: Radius.elliptical(550, 220),
            ),
          ),
        ),
        Container(
          height: 200-70,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: AppColors().darkPrimaryColor,
          ),
        )
      ],
    );
  }
}

class AppBarReplaceableImage extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Titel der Seite in der AppBar
  final Color color; //
  final Color bgColor;
  final Color bgColorBar;
  final DecorationImage bild;
  final double hoehe;




  AppBarReplaceableImage({
    required this.title,
    required this.color,
    required this.bgColor,
    required this.bgColorBar,
    required this.bild,
    required this.hoehe,


  });
  @override
  Size get preferredSize => Size.fromHeight(hoehe);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          body: Stack(
            //fit: StackFit.loose,
            children: <Widget>[
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.transparent,
              ),
              RoundRecMainImage(),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      //color: bgColorBar,
                      color: AppColors().white,
                      shape: BoxShape.circle,
                      image: bild,
                      border: Border.all(
                        color: AppColors().darkSecondaryColor,
                        width: 3.5,
                      )
                      //color: Colors.green,
                    ),
                    //child: AppLogo().darkLogo,
                  ),
                ),
              ),

              Positioned.fill(
                top: -170,
                //left: 30,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: AppIcons().backArrow,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ),
              ),
              Positioned.fill(
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: AppIcons().settingsWheel,
                      onPressed: () {
                        Get.to(() => const Einstellungen());
                      },
                    )
                ),
              ),
            ],
          )),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(140, 80, 140, 0),
      child: AppLogo().darkLogo,
    );
  }
}

// ENDE ------ AppBarMainArea - normale Appbar am beginn der App //