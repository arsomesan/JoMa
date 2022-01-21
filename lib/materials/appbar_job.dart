import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/screens/screen_settings.dart';






class RoundRecJob extends StatelessWidget {
    Color bgColor;
    Color bgColorBar;
    
    RoundRecJob({
    required this.bgColor,
    required this.bgColorBar,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: bgColorBar,
            border: Border.all(
              width: 5,
              color: bgColorBar,
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
            color: bgColorBar,
          ),
        )
      ],
    );
  }
}



class AppBarJobArea extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Titel der Seite in der AppBar
  final Color color; //
  final Color bgColor;
  final Color bgColorBar;
  final VoidCallback onPressed1;
  // final VoidCallback onPressed2;
  final Icon icon;
  final double hoehe;

  AppBarJobArea({
    required this.title,
    required this.color,
    required this.bgColor,
    required this.bgColorBar,
    required this.onPressed1,
    // required this.onPressed2,
    required this.icon,
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
                height: 250,
                width: double.infinity,
                color: Colors.transparent,
              ),
              RoundRecJob(
                bgColor: bgColor, 
                bgColorBar: bgColorBar,),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AppLogo().darkLogoAssestImage,
                        fit: BoxFit.contain,
                      ),
                      //color: Colors.green,
                    ),
                    //child: AppLogo().darkLogo,
                  ),
                ),
              ),
              Positioned.fill(
                top: -100,
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
                    )),
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
