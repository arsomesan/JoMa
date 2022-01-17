import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/materials/checkbox_button.dart';
import 'package:joma/materials/navbar.dart';
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

class ScreenNotifications extends StatelessWidget {
  const ScreenNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mitteilungen'.toUpperCase()),
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

      body: ListView(
        children: [
          CheckboxButton(
              text: 'Soziales & Hauswirtschaft',
              value: false,
              onChanged: (bool? value) {},
              icon: Icon(FontAwesomeIcons.tools),
          ),
          CheckboxButton(
            text: 'Handwerk & Technik',
            value: false,
            onChanged: (bool? value) {},
            icon: Icon(FontAwesomeIcons.tools),
          ),
          CheckboxButton(
            text: 'Service & Lebensmittel',
            value: false,
            onChanged: (bool? value) {},
            icon: Icon(FontAwesomeIcons.tools),
          ),
          CheckboxButton(
            text: 'Gärtnerei & Landwirtschaft',
            value: false,
            onChanged: (bool? value) {},
            icon: Icon(FontAwesomeIcons.tools),
          )
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

      bottomNavigationBar: AppNavBar(
        backgroundColor: AppColors().darkPrimaryColor,
        selectedItemColor: AppColors().darkSecondaryColor,
        unselectedItemColor: AppColors().white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}