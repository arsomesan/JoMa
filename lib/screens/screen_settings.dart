import 'package:flutter_svg/svg.dart';
import 'package:joma/materials/appbar_replaceable_image.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/materials/navbar.dart';
import 'package:joma/screens//screen_settings_datenschutz.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_login.dart';
import 'package:joma/screens/screen_notifications.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_profil_settings.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_settings_datenschutz.dart';
import 'package:joma/screens/screen_settings_impressum.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/screens/screen_welcome.dart';

import 'screen_joblist_search.dart';

class Einstellungen extends StatelessWidget {
  const Einstellungen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReplaceableImage(
        bgColor: AppBackgroundColors().darkBackground,
        bgColorBar: AppColors().darkPrimaryColor,
        color: AppColors().darkPrimaryColor,
        title: 'Einstellungen'.toUpperCase(),
        bild: DecorationImage(
          image: new AssetImage("assets/icons/walking-solid.png"),
          fit: BoxFit.cover,
        ),
        hoehe: 230,
      ),
      backgroundColor: AppBackgroundColors().darkBackground,
      body: ListView (
        padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
        children: [
          //const SizedBox(height: 15),
          /*CircleAvatar(
            radius: 50,
            backgroundColor: AppColors().darkSecondaryColor,
            child: CircleAvatar(
              radius: 45,
              backgroundColor: AppColors().white,
              child: Icon(
                  Icons.settings,
                  color: AppColors().darkPrimaryColor,
                  size: 50),
            ),
          ),
          const SizedBox(height: 35),*/
          AppButtonWithIcon(
            text: 'Profil bearbeiten',
              icon: AppIcons().profile,
            color: AppColors().darkPrimaryColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenProfilSettings()));
            }
          ),
          AppButtonWithIcon(
              text: 'Ansicht wählen',
              icon: AppIcons().settingsWheel,
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectView()));
              }
          ),
          AppButtonWithIcon(
              text: 'Mitteilungen',
              icon: AppIcons().notifications,
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenNotifications()));
              }
          ),
          AppButtonWithIcon(
              text: 'Impressum',
              icon: AppIcons().imprint,
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Impressum()));
              }
          ),
          AppButton(
              text: 'Datenschutz',
              color: AppColors().darkSecondaryColor,
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Datenschutz()));
                // TODO: Klassen Datenschutz kann nicht aufgerufen werden
                Navigator.push(context, MaterialPageRoute(builder: (context) => Impressum()));
              }
          ),
          AppButton(
              text: 'Abmelden',
              color: AppColors().darkSecondaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenWelcome()));
              }
          ),
        ],
      ),

      //------Bottom Navigation------//
      floatingActionButton: Container(
        height: 100.0,
        width: 100.0,
        child: IconButton(
          icon: SvgPicture.asset("assets/images/darkLogo.svg",
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ScreenHome()),
            );
          },
        ),
      ),

      bottomNavigationBar: AppNavBar(
          backgroundColor: AppColors().darkPrimaryColor,
          selectedItemColor: AppColors().white,
          unselectedItemColor: AppColors().white),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

