import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/global/glovar.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_joblist_search.dart';
import 'package:joma/screens/screen_applications.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_data.dart';
import 'package:joma/screens/screen_profil_settings_loader.dart';
import 'package:joma/screens/screen_saved_jobs.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:joma/services/remote_services.dart';
import 'package:joma/utils/user_simple_preferences.dart';

class ProfilLoader extends StatefulWidget {
  const ProfilLoader({Key? key}) : super(key: key);

  @override
  _ProfilLoaderState createState() => _ProfilLoaderState();
}



class _ProfilLoaderState extends State<ProfilLoader> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().darkPrimaryColor,
        title: Text(
          'Profil'.toUpperCase(),
          style: AppTextStyles.darkH1,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: AppIcons().settingsWheel,
            onPressed: () {
              Get.to(() => const Einstellungen());
            },
          )
        ],
      ),

      backgroundColor: AppBackgroundColors().darkBackground,
      body: ListView (
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        children: [
          AppButtonWithIcon(
              text: 'Persönliche Daten',
              icon: AppIcons().profile,
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilData())); // screen_profileView
              }
          ),
          AppButtonWithIcon(
              text: 'Gespeicherte Jobs',
              icon: AppIcons().bookMark,
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenSavedJobs())); // screen_savedJob
              }
          ),
          AppButtonWithIcon(
              text: 'Bewerbungen',
              icon: AppIcons().applicationsSent,
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenApplications())); // screen_savedJob
              }
          ),
          AppButtonWithIcon(
              text: 'Einstellungen',
              icon: AppIcons().settingsWheel,
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Einstellungen())); // screen_savedJob
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
                    builder: (context) => const ScreenJobListSearch()),
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