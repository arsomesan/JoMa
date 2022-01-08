// ignore_for_file: avoid_print, prefer_const_constructors, duplicate_ignore

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; //Json
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_test.dart'; //Json
import 'package:joma/assets/assets.dart';

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
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
                  title: Text('Willkommen \nbei Joma'.toUpperCase(),
                          style: AppTextStyles.darkH1,
                          textAlign: TextAlign.left,
                          ),
                ),
      backgroundColor: AppBackgroundColors().darkBackground,
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Color(0xFF30459B),
                borderRadius: BorderRadius.vertical(
                  top: Radius.zero, 
                  bottom: Radius.elliptical(850, 200),
                  ),
              ),

              
              child: Padding (
                padding: EdgeInsets.fromLTRB(150, 40, 150, 0),
                child: AppLogo().darkLogo),
            ),
            
            
        
            Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(15, 80, 15, 10),
                child: ElevatedButton(
                  child: Text('Registrieren'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    primary: AppColors().darkSecondaryColor,
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
                height: 50,
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: ElevatedButton(
                  child: Text('Anmelden'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
           
            
          ])),
    );
    
  }
}
