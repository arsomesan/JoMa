import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/button.dart';

class PopUpAlert extends StatelessWidget {
  final String title;
  final String content;
  final BuildContext context;
  final Widget current;

  PopUpAlert({
    required this.title,
    required this.content,
    required this.context,
    required this.current,
  });

  Widget continueButton(BuildContext context) => Container(
      alignment: Alignment.center,
      child: TextButton( child: Text( "Weiter",
      style: TextStyle(color: AppColors().darkSecondaryColor),),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }
      ),
      );

  Widget cancelButton(Widget current) => Container(
          alignment: Alignment.center,
          child: TextButton(
              child: Text( "Abbrechen",
              style: TextStyle(color: AppColors().darkSecondaryColor)),
              onPressed: () {
                Get.off(() => current);
              }
          ),
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: const TextStyle(
            fontFamily: AppFont.mainFont,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
        ),
      ),
      backgroundColor: AppColors().darkPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      actions: [Row(
        children: [SizedBox(width: 10), cancelButton(current),
          SizedBox(width: 100),
          continueButton(context)
        ],
      )],
      content: Text(
        this.content,
        style: const TextStyle(
            fontFamily: AppFont.mainFont,
            fontSize: 16,
            color: Colors.white
        ),
      ),
    );
  }
}
