import 'package:joma/materials/appbar_job.dart';
import 'package:joma/materials/button.dart';
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
      appBar: AppBarJobArea(
        bgColor: Colors.transparent,
        bgColorBar: AppColors().darkPrimaryColor,
        circleColor: AppColors().darkSecondaryColor,
        color: AppBackgroundColors().darkBackground,
        title: 'Einstellungen'.toUpperCase(),
        hoehe: 230,
        imageUrl: 'assets/icons/cog-solid.svg',
        onPressed1: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: AppBackgroundColors().darkBackground,
      body: ListView (
        children: [
          const SizedBox(height: 15),
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
          ),*/
          const SizedBox(height: 35),
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
          AppButtonWithIcon(
              text: 'Datenschutz',
              icon: AppIcons().privacy,
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Datenschutz()));
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
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          elevation: 0,
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage(
              'assets/images/darkJomaLogo.png',
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ScreenHome()),
            );
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (value) {
            if (value == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ScreenJobListSearch()),
              );
            }
            if (value == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilLoader()),
              );
            }
            //if (value == 2) Navigator.of(context).push(...);
          },
          backgroundColor: AppColors().darkPrimaryColor,
          selectedItemColor: AppColors().white,
          unselectedItemColor: AppColors().white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AppIcons().searchGlass,
              label: 'Suchen',
            ),
            BottomNavigationBarItem(
              icon: AppIcons().profile,
              label: 'Profil',
            ),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

