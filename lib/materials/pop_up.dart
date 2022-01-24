import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/button.dart';

class PopUpAlert extends StatelessWidget {
  final String title;
  final String content;
  final Widget route;
  final Widget current;

  PopUpAlert({
    required this.title,
    required this.content,
    required this.route,
    required this.current,
  });

  Widget continueButton(Widget route) => TextButton(
    child: Container(
      alignment: Alignment.center,
      child: AppButton(text: "Weiter",
          color: AppColors().darkSecondaryColor,
          onPressed: () {
            Get.off(() => route);
          }
      ),
    ),
        onPressed: () {
          Get.off(() => route);
        },
      );

  Widget cancelButton(Widget current) => TextButton(
        child: Container(
          alignment: Alignment.center,
          child: AppButton(text: "Zurück",
              color: AppColors().darkSecondaryColor,
              onPressed: () {
                Get.off(() => current);
              }
          ),
        ),
        onPressed: () {
          Get.off(() => current);
        },
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: TextStyle(
            fontFamily: AppFont.mainFont,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
        ),
      ),
      backgroundColor: AppColors().darkPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      actions: [cancelButton(current)],
      content: Text(
        this.content,
        style: TextStyle(
            fontFamily: AppFont.mainFont,
            fontSize: 16,
            color: Colors.white
        ),
      ),
    );
  }
}
