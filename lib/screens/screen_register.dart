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

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({Key? key}) : super(key: key);

  @override
  _ScreenRegister createState() => _ScreenRegister();
}

class _ScreenRegister extends State<ScreenRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color loginButtonColor = AppColors().darkPrimaryColor;
  Color registerButtonColor = AppColors().darkSecondaryColor;
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
          print("Registrieren erfolgreich");
          return true;
        }
      }
    }
    print("Registrieren nicht erfolgreich");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppBackgroundColors().darkBackground,
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(children: <Widget>[
            Container(
              height: 150,
              padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
              color: AppColors().darkPrimaryColor,
              child: Text(
                'Registrieren'.toUpperCase(),
                style: AppTextStyles.darkH1,
              ),
            ),
            // ------- LOGO
            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.all(5),
            //   child: Padding(
            //       padding: EdgeInsets.fromLTRB(100, 50, 100, 0),
            //       child: AppLogo().darkLogo),
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                'Der Job maßgeschneidert für dich!',
                textAlign: TextAlign.center,
                style: AppTextStyles.darkH3,
              ),
            ),
            Container(
                color: AppColors().white,
                margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
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
                margin: const EdgeInsets.all(10),
                color: AppColors().white,
                child: Padding(
                    padding: EdgeInsets.all(0),
                    child: TextField(
                      obscureText: _obscurePwd,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Passwort wiederholen',
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
                margin: const EdgeInsets.fromLTRB(15, 90, 15, 0),
                child: ElevatedButton(
                  child: Text('Registrieren'),
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
                        text: 'by creating an account you agree to joma.',
                        style: TextStyle(color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Datenschutz.');
                          })
                  ]),
                )),
          ])),
    );
  }
}
