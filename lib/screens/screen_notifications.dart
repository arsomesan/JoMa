import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/materials/checkbox_button.dart';
import 'package:joma/materials/navbar.dart';
import 'package:joma/screens//screen_settings_datenschutz.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_login.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_profil_settings.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_settings_datenschutz.dart';
import 'package:joma/screens/screen_settings_impressum.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/screens/screen_welcome.dart';

import 'screen_joblist_search.dart';

class ScreenNotifications extends StatefulWidget {
  const ScreenNotifications({Key? key}) : super(key: key);

  @override
  _ScreenNotificationsState createState() => _ScreenNotificationsState();

}

class _ScreenNotificationsState extends State<ScreenNotifications> {
  List<bool> _isChecked = [false, false, false, false];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              value: _isChecked[0],
              onChanged: (bool? value) {
                setState(() {
                  _isChecked[0] = value!;
                });

              },
              icon: AppIcons().blueSection,
          ),
          CheckboxButton(
            text: 'Handwerk & Technik',
            value: _isChecked[1],
            onChanged: (bool? value) {
              setState(() {
                _isChecked[1] = value!;
              });

            },
            icon: AppIcons().redSection,
          ),
          CheckboxButton(
            text: 'Service & Lebensmittel',
            value: _isChecked[2],
            onChanged: (bool? value) {
              setState(() {
                _isChecked[2] = value!;
              });

            },
            icon: AppIcons().yellowSection,
          ),
          CheckboxButton(
            text: 'Gärtnerei & Landwirtschaft',
            value: _isChecked[3],
            onChanged: (bool? value) {
              setState(() {
                _isChecked[3] = value!;
              });

            },
            icon: AppIcons().greenSection,
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