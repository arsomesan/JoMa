// ignore_for_file: avoid_print, prefer_const_constructors, duplicate_ignore

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; //Json
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_test.dart'; //Json
import 'package:joma/materials/assets.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  _ScreenLogin createState() => _ScreenLogin();
}

class _ScreenLogin extends State<ScreenLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color loginButtonColor = AppColors().darkPrimaryColor;
  //Color skipButtonColor = const Color(0xFFA1A1A1);
  bool _obscurePwd = true;

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
      backgroundColor: AppBackgroundColors().darkBackground,
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(children: <Widget>[
          Container(
            
            height: 130,
            color: AppColors().darkPrimaryColor,
            child: Text('Anmelden'.toUpperCase(),
            style:AppTextStyles.darkH1,
              ),
          ),
           
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              child: Padding (
                padding: EdgeInsets.fromLTRB(100, 50, 100, 0),
                child: AppLogo().darkLogo),
              
            ),
            Container(
               color: AppColors().white,
               margin: const EdgeInsets.fromLTRB(10,50,10,10),
                child: Padding( padding: EdgeInsets.all(0),
                  child:TextField(
                  style: TextStyle(backgroundColor: AppColors().white,),
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-Mail',
                  ),
                ))),
            Container(
                margin: const EdgeInsets.all(10),
                color: AppColors().white,
                child: Padding( padding: EdgeInsets.all(0),
                  child:TextField(
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
