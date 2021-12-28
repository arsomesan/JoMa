import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_login.dart';
import 'package:joma/utils/user_simple_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();
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
        primarySwatch: Colors.blue,
      ),
      home:Center(
      child: AnimatedSplashScreen(
      splash: Image.asset(
      'assets/images/Logo.png',
      ),
      nextScreen: ScreenLogin(),
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.amber,
      ),

    //home: const ScreenLogin(),
      //home: const HomeScreen(),
    ),
    );
  }
}

