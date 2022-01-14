import 'package:joma/materials/button.dart';
import 'package:joma/screens//screen_settings_datenschutz.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_login.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_profil_settings_loader.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_settings_datenschutz.dart';
import 'package:joma/screens/screen_settings_impressum.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/screens/screen_welcome.dart';

import 'joblist_search_screen.dart';

class Einstellungen extends StatelessWidget {
  const Einstellungen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text('Einstellungen'.toUpperCase(), style: AppTextStyles.darkH1),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: AppColors().darkPrimaryColor,
          ),


      backgroundColor: AppBackgroundColors().darkBackground,
      body: ListView (
        children: [
          /*Container (
            margin: EdgeInsets.fromLTRB(120, 0, 120,20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180),
              border: Border.all(width: 4, color: AppColors().darkSecondaryColor),
              color: AppColors().white
            ),
            child: Icon(
              Icons.settings,
              color: AppColors().darkPrimaryColor,
              size: 150,
            ),
          ),*/
          const SizedBox(height: 15),
          CircleAvatar(
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
          const SizedBox(height: 35),
          AppButton(
            text: 'Profil bearbeiten',
            color: AppColors().darkPrimaryColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilSettingsLoader()));
            }
          ),
          AppButton(
              // icon: AppIcons().profile,
              text: 'Ansicht wählen',
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectView()));
              }
          ),
          AppButton(
              text: 'Mitteilungen',
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilSettingsLoader()));
              }
          ),
          AppButton(
              text: 'Impressum',
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Impressum()));
              }
          ),
          AppButton(
              text: 'Datenschutz',
              color: AppColors().darkPrimaryColor,
              onPressed: () {
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
                    builder: (context) => const JobListSearchScreen()),
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
          selectedItemColor: AppColors().darkSecondaryColor,
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

