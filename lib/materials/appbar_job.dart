import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

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
          height: 200 - 70,
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
  final String title;
  final Color color; //
  final Color bgColor;
  final Color bgColorBar;
  final VoidCallback onPressed1;
  final double hoehe;
  final String imageUrl;
  final Color circleColor;
  final int blocked;


  AppBarJobArea({
    required this.title,
    required this.color,
    required this.bgColor,
    required this.bgColorBar,
    required this.onPressed1,
    required this.hoehe,
    required this.imageUrl,
    required this.circleColor,
    required this.blocked,
  });

  @override
  Size get preferredSize => Size.fromHeight(hoehe);

  @override
  Widget build(BuildContext context) {
    var blockedColor;
    if (blocked == 0)
    {
      blockedColor = AppColors().white;
    }
    else {
      blockedColor = bgColorBar;
    };

    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          body: Stack(
            children: <Widget>[
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.transparent,
              ),
              RoundRecJob(
                bgColor: bgColor,
                bgColorBar: bgColorBar,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        color: AppColors().white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: Svg(imageUrl, size: Size(100, 100)),
                          scale: 1.3,
                          colorFilter: ColorFilter.mode(
                            bgColorBar,
                            BlendMode.srcIn,
                          ),
                          fit: BoxFit.none,
                        ),
                        border: Border.all(
                          color: circleColor,
                          width: 5,
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      width: 300,
                      child: Text(title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: AppIcons().backArrow,
                    color: blockedColor,
                    onPressed: onPressed1,
                  ),
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
                    )),
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
