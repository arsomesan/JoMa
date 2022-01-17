import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:joma/screens/joblist_topic_screen.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_login.dart';
import 'package:joma/screens/screen_notifications.dart';
import 'package:joma/screens/screen_register.dart';
import 'package:joma/screens/screen_saved_jobs.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_welcome.dart';
import 'package:joma/utils/user_simple_preferences.dart';
import 'package:joma/materials/assets.dart';

import 'controllers/data_controller.dart';

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
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        //------------ APP BAR THEME ---------------//
        // appBarTheme: const AppBarTheme(
        //   elevation: 0,
        //   titleTextStyle:  TextStyle(
        //   color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700,),
        //   backgroundColor: Color(0xFF30459B),
        //   toolbarHeight: 50,
        //   // shape: RoundedRectangleBorder(
        //   // side: BorderSide(width: 3, color: Colors.orange),
        //   //       borderRadius: BorderRadius.vertical(
        //   //       bottom: Radius.elliptical(850, 100),
        //   //       ),
        //   // ),
        // ),
      ),



      home: Center(
      child: AnimatedSplashScreen(
      splash: Image.asset(
      'assets/images/darkJomaLogo.png',
      ),
      nextScreen: ScreenWelcome(),
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: AppColors().darkSecondaryColor,
      ),
      

    //home: const ScreenLogin(),
    //home: const ScreenHome(),
      ),
    );
    
  


 
  }
}