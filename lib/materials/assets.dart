/*
Hellou zusammen! Diese Assets-Datei beinhaltet generische Elemente, die ihr problemlos in eure Seite einbauen könnt.
Diese Datei müsst ihr lediglich mit der Codezeile
  import 'package:joma/materials/assets.dart';
importieren und könnt alles hieraus verwenden, so, wie wir es in Adobe XD vorgestaltet haben. Viel Spaß!
*/

import 'package:flutter/material.dart';

// ---------- FONT ----------

// Diese Klasse beinhaltet die Font, die wir in der App benutzen, die Font ist bereits in den AppTextStyles eingebunden
class AppFont {
  static const mainFont = 'Roboto';
}

// ---------- LOGO ----------

/* Diese Klasse beinhaltet unser Logo
zum Einbinden
  - AppLogo().darkLogo
  - z.B. als child-Attribut
*/
class AppLogo {
  Image darkLogo = Image.asset('assets/images/darkJomaLogo.png');
  Image lightLogo = Image.asset('assets/images/lightJomaLogo.png');
}

// ---------- TEXT ----------

/* Die Klasse beinhaltet die Text-Styles für die verschiedenen Texte in unserer App
zum Einbinden:
  - ein Text()-Widget eröffnen
  - das style:-Attribut öffnen
  - im style:-Attribut AppTextStyles.darkH1
*/
class AppTextStyles {
  static const darkH1 = TextStyle(
      fontFamily: AppFont.mainFont, fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);
  static const darkH2 = TextStyle(
      fontFamily: AppFont.mainFont, fontSize: 23, fontWeight: FontWeight.bold);
  static const darkH3 = TextStyle(
      fontFamily: AppFont.mainFont, fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white);
  static const darkMainText = TextStyle(
      fontFamily: AppFont.mainFont, fontSize: 16);
  static const darkInfoText = TextStyle(
      fontFamily: AppFont.mainFont, fontSize: 14);
  static const darkButtonText = TextStyle(
      fontFamily: AppFont.mainFont,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white);
}

// ---------- FARBEN ----------

/* Die Klasse beinhaltet die Grundfarben für die verschiedenen Bereiche und Buttons in unserer App
zum Einbinden:
  - AppColors().darkPrimaryColor
*/
class AppColors {
  Color darkPrimaryColor = const Color.fromRGBO(48, 69, 155, 1);
  Color darkSecondaryColor = const Color.fromRGBO(239, 157, 15, 1);
  Color darkRed = const Color.fromRGBO(177, 44, 51, 1);
  Color darkGreen = const Color.fromRGBO(38, 127, 106, 1.0);
  Color darkBlue = const Color.fromRGBO(33, 89, 127, 1);
  Color darkYellow = const Color.fromRGBO(226, 199, 10, 1);
  Color white = const Color.fromRGBO(255, 255, 255, 1);
  Color black = const Color.fromRGBO(0, 0, 0, 1);
}

/* Die Klasse beinhaltet die Hintergrundfarben für die verschiedenen Bereiche in unserer App
zum Einbinden:
  - AppBackgroundColors().darkBackground
*/
class AppBackgroundColors {
  Color darkBackground = const Color.fromRGBO(20, 20, 40, 1);
  Color darkBackgroundRed = const Color.fromRGBO(180, 111, 111, 1);
  Color darkBackgroundGreen = const Color.fromRGBO(112, 173, 133, 1);
  Color darkBackgroundBlue = const Color.fromRGBO(128, 186, 196, 1);
  Color darkBackgroundYellow = const Color.fromRGBO(163, 152, 91, 1);
}

// ---------- ICONS ----------

/* Diese Klasse beinhaltet die verwendeten Icons, z.B. für die jeweiligen Bereiche
zum Einbinden:
  - AppIcons().backArrow
*/
class AppIcons {
  // generelle, (fast) auf jeder Seite zu findende Icons
  Icon backArrow = Icon(
      Icons.arrow_back,
      color: AppColors().white);
  Icon settingsWheel = Icon(
      Icons.settings,
      color: AppColors().white);

  // Nav-Bar
  Icon searchGlass = Icon(
      Icons.search,
      color: AppColors().white);
  Icon profile = Icon(
      Icons.person,
      color: AppColors().white);

  // Ansicht wählen
  Icon nurBilder = Icon(
      Icons.photo_library,
      color: AppBackgroundColors().darkBackground);
  Icon einfacheSprache = Icon(
      Icons.tag_faces,
      color: AppBackgroundColors().darkBackground);
  Icon vollText = Icon(
      Icons.chat,
      color: AppBackgroundColors().darkBackground);

  // Home-Screen
  Icon homeRedSection = Icon(
      Icons.build,
      color: AppBackgroundColors().darkBackground);
  Icon homeGreenSection = Icon(
      Icons.local_florist,
      color: AppBackgroundColors().darkBackground); // Icons.goat würde auch gehen
  Icon homeBlueSection = Icon(
      Icons.people,
      color: AppBackgroundColors().darkBackground);
  Icon homeYellowSection = Icon(
      Icons.local_dining,
      color: AppBackgroundColors().darkBackground);

  // auf der jeweiligen Jobbereichsseite
  Icon redSection = Icon(
      Icons.build,
      color: AppColors().white);
  Icon greenSection = Icon(
      Icons.local_florist,
      color: AppColors().white); // Icons.goat würde auch gehen
  Icon blueSection = Icon(
      Icons.people,
      color: AppColors().white);
  Icon yellowSection = Icon(
      Icons.local_dining,
      color: AppColors().white);

  // Profil & Settings
  Icon applicationsSent = Icon(
      Icons.work);
  Icon bookMark = Icon(
      Icons.bookmark);
  Icon notifications = Icon(
      Icons.notifications_active);
  Icon imprint = Icon(
      Icons.speaker_notes);
  Icon privacy = Icon(
      Icons.security);
}
//