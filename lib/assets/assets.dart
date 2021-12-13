import 'package:flutter/material.dart';

class AppFont {
  static const mainFont = 'Raleway';
}

class AppTextStyles {
  static const appBar = TextStyle(fontFamily: AppFont.mainFont, fontSize: 20);
  static const titleText = TextStyle(fontFamily: AppFont.mainFont, fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white);
  static const mainText = TextStyle(fontFamily: AppFont.mainFont, fontSize: 15, fontWeight: FontWeight.bold);
  static const imageText = TextStyle(fontFamily: AppFont.mainFont, fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
  static const graduationText = TextStyle(fontFamily: AppFont.mainFont, fontSize: 20, fontWeight: FontWeight.bold);
  static const distanceText = TextStyle(fontFamily: AppFont.mainFont, fontSize: 23, fontWeight: FontWeight.bold, color: Colors.redAccent);
} // zum Einbinden:
  // - ein Text()-Widget eröffnen
  // - das style:-Attribut öffnen
  // - im style:-Attribut AppTextStyles.appBar

class AppColors {
  Color yellow = const Color.fromRGBO(236, 234, 149, 1.0);
  Color green = const Color.fromRGBO(96, 158, 120, 1);
  Color red = const Color.fromRGBO(176, 73, 75, 1);
  Color blue = const Color.fromRGBO(87, 126, 154, 1);
} // zum Einbinden:
  // - Klasse wählen (Colors, BackgroundColor, ...)
  // - BackgroundColor: AppColors().yellow

