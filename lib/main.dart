import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:joma/screens/screen_joblist_category.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_joblist_search.dart';
import 'package:joma/screens/screen_login.dart';
import 'package:joma/screens/screen_notifications.dart';
import 'package:joma/screens/screen_register.dart';
import 'package:joma/screens/screen_saved_jobs.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_test.dart';
import 'package:joma/screens/screen_welcome.dart';
import 'package:joma/utils/user_simple_preferences.dart';
import 'package:joma/materials/assets.dart';

import 'controllers/data_controller.dart';
import 'model/profil_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();
  final DataController data = Get.put(DataController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    //profile to use
    Profil user = tmpUser[0];
    fillBooleanData(data.jobList, user.savedJobs!, data.jobs);
    fillBooleanData(data.boolList, user.skills!, data.skills);
    return GetMaterialApp(
      title: 'JOMA',
      theme: ThemeData(
      
      ),



      home: Center(
      child: AnimatedSplashScreen(
      splash: SvgPicture.asset("assets/images/darkLogo.svg"),
      nextScreen: ScreenWelcome(),
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: AppColors().darkPrimaryColor,
      ),
      
      ),
    );
    
  


 
  }
}

//filling boolean arrays from user simple preferences or remote data
void fillBooleanData(List<bool> listSave, List<int> listCheck, List<dynamic> org) async {
  var remoteUser = profilToJson(data.profile);
  //Load Profile from Shared Preferences if given. If not load Json Profile
  var tmpUser = profilFromJson(
      UserSimplePreferences.getUser() ?? remoteUser.toString());
  //profile to use
  Profil user = tmpUser[0];
  for (int i = 0; i < listSave.length; i++) {
    for (int l = 0; l < listCheck.length; l++) {
      if (org[i].id == listCheck[l]) {
        listSave[i] = true;
        break;
      }
    }
  }
}