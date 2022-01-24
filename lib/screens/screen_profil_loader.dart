import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/global/glovar.dart';
import 'package:joma/materials/appbar_job.dart';
import 'package:joma/materials/appbar_replaceable_image.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/materials/navbar.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_joblist_search.dart';
import 'package:joma/screens/screen_applications.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_data.dart';
import 'package:joma/screens/screen_profil_settings.dart';
import 'package:joma/screens/screen_saved_jobs.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:joma/services/remote_services.dart';
import 'package:joma/utils/user_simple_preferences.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

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
      appBar: AppBarJobArea(
        bgColor: Colors.transparent,
        bgColorBar: AppColors().darkPrimaryColor,
        circleColor: AppColors().darkSecondaryColor,
        color: AppBackgroundColors().darkBackground,
        title: 'Profil'.toUpperCase(),
        hoehe: 230,
        imageUrl: 'assets/icons/tractor-solid.svg',
        onPressed1: () {
          Navigator.of(context).pop();
        },
      ),

      backgroundColor: AppBackgroundColors().darkBackground,
      body: ListView (
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        children: [
          AppButtonWithIcon(
              text: 'Profil anzeigen',
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