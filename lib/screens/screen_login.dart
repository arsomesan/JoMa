// ignore_for_file: avoid_print, prefer_const_constructors, duplicate_ignore

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; //Json
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/materials/appbar.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_test.dart'; //Json
import 'package:joma/materials/assets.dart';
import 'package:joma/services/remote_services.dart';
import 'package:joma/utils/user_simple_preferences.dart';
//import 'package:joma/services/remote_services_test.dart';



class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  _ScreenLogin createState() => _ScreenLogin();
}



class _ScreenLogin extends State<ScreenLogin> {
  late Future<List<Profil>> futureProfil;
  final DataController data = Get.find();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color loginButtonColor = AppColors().darkPrimaryColor;
 
 //Password anzeigen/nicht anzeigen lassen
  bool _obscurePwd = true;

  @override
  Widget build(BuildContext context) {

    //Load Profile from Json
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    Profil user = tmpUser[0];
    print(user.name);

    bool validate(String email, String pwd) {
      //ToDos: json durchlaufen
      if(user.kontakt!.email == email && user.password == pwd) {
        String? emailTmp = user.kontakt!.email;
        String? pwdTmp = user.password;
        if (emailTmp == emailController.text &&
            pwdTmp == passwordController.text) {
          print("Login erfolgreich");
          return true;
        }
      }   
    print("Login nicht erfolgreich");
    return false;
  }

    return Scaffold(
      backgroundColor: AppBackgroundColors().darkBackground,
      body: Center(
          child: ListView(children: <Widget>[
            Container(
              height: 255,
              child: AppBarMainArea(
                bgColor: AppBackgroundColors().darkBackground,
                bgColorBar: AppColors().darkPrimaryColor,
                color: AppColors().darkPrimaryColor,
                title: 'Willkommen \nbei joma'.toUpperCase(),
              ),
            ), 
            Container(
                color: AppColors().white,
                margin: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                child: Padding(
                    padding: EdgeInsets.all(0),
                    child: TextField(
                      style: TextStyle(
                        backgroundColor: AppColors().white,
                      ),
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-Mail',
                      ),
                    ))),
            Container(
                margin: const EdgeInsets.all(10),
                color: AppColors().white,
                child: Padding(
                    padding: EdgeInsets.all(0),
                    child: TextField(
                      obscureText: _obscurePwd,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Passwort',
                        suffixIcon: IconButton(
                            icon: Icon(_obscurePwd
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscurePwd = !_obscurePwd;
                              });
                            }),
                      ),
                    ))),
            Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(15, 140, 15, 0),
                child: ElevatedButton(
                  child: Text('Anmelden'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    primary: AppColors().darkPrimaryColor,
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Raleway'),
                  ),
                  onPressed: () {
                    if (validate(
                        emailController.text, passwordController.text)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SelectView()),
                      );
                    }
                  },
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Passwort vergessen?',
                        style: TextStyle(color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Account erstellen.');
                          })
                  ]),
                )),
          ])),
    );
  }
}
