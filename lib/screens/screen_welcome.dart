// ignore_for_file: avoid_print, prefer_const_constructors, duplicate_ignore

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; //Json
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/materials/appbar.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/screens/screen_login.dart';
import 'package:joma/screens/screen_register.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_test.dart'; //Json
import 'package:joma/materials/assets.dart';

class ScreenWelcome extends StatefulWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  @override
  _ScreenWelcome createState() => _ScreenWelcome();
}

class _ScreenWelcome extends State<ScreenWelcome> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color loginButtonColor = AppColors().darkPrimaryColor;
  Color registerButtonColor = AppColors().darkSecondaryColor;

  get title => null;

  get color => null;

  get bgColor => null;

  get bgColorBar => null;

  //bool _obscurePwd = true;

  List _items = [];

  void readJson() async {
    String response = await rootBundle.loadString('assets/users.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["user"];
    });
  }

  bool validate(String email, String pwd) {
    readJson();
    if (_items.isNotEmpty) {
      for (int i = 0; i < _items.length; i++) {
        String emailTmp = _items[i]['email'].toString();
        String pwdTmp = _items[i]['pwd'].toString();
        if (emailTmp == emailController.text &&
            pwdTmp == passwordController.text) {
          print("Login erfolgreich");
          return true;
        }
      }
    }
    print("Login nicht erfolgreich");
    return true; // TODO: set to false -> is true only for test purposes
  }

  @override
  Widget build(BuildContext context) {
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
              title: ''.toUpperCase(),
            ),
          ),
          Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(15, 150, 15, 10),
              child: AppButton(
                text: 'Registrieren',
                color: AppColors().darkSecondaryColor,
                onPressed: () {
                  if (validate(emailController.text, passwordController.text)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScreenRegister()),
                    );
                  }
                },
              )),
          Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
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
                  if (validate(emailController.text, passwordController.text)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScreenLogin()),
                    );
                  }
                },
              ))
        ])));
  }
}

//             Container(
//                 height: 50,
//                 margin: const EdgeInsets.fromLTRB(15, 350, 15, 10),
//                 child: AppButton(
//                   text: ('Registrieren'),
//                   color: AppColors().darkSecondaryColor,
//                   // style: AppButton.styleFrom(
//                   //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//                   //   primary: AppColors().darkSecondaryColor,
//                   //   onPrimary: Colors.white,
//                   //   textStyle: TextStyle(
//                   //       fontSize: 16,
//                   //       fontWeight: FontWeight.w600,
//                   //       fontFamily: 'Raleway'),
//                   // ),
//                   onPressed: () {
//                     if (validate(
//                         emailController.text, passwordController.text)) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => ScreenRegister()),
//                       );
//                     }
//                   },
//                 )),
//                 Container(
//                 height: 50,
//                 margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
//                 child: ElevatedButton(
//                   child: Text('Anmelden'),
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//                     primary: AppColors().darkPrimaryColor,
//                     onPrimary: Colors.white,
//                     textStyle: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         fontFamily: 'Raleway'),
//                   ),
//                   onPressed: () {
//                     if (validate(
//                         emailController.text, passwordController.text)) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => ScreenLogin()),
//                       );
//                     }
//                   },
//                 ));

//   }
// }
