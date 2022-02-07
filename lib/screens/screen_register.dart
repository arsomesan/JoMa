// ignore_for_file: avoid_print, prefer_const_constructors, duplicate_ignore

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; //Json
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/materials/appbar.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_test.dart'; //Json
import 'package:joma/materials/assets.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({Key? key}) : super(key: key);

  @override
  _ScreenRegister createState() => _ScreenRegister();
}

class _ScreenRegister extends State<ScreenRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController_1 = TextEditingController();
  TextEditingController passwordController_2 = TextEditingController();
  Color loginButtonColor = AppColors().darkPrimaryColor;
  Color registerButtonColor = AppColors().darkSecondaryColor;
  bool _obscurePwd_1 = true;
  bool _obscurePwd_2 = true;

  List _items = [];

  void readJson() async {
    String response = await rootBundle.loadString('assets/users.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["user"];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppBackgroundColors().darkBackground,
      body: Center(
          child: ListView(children: <Widget>[
        Container(
          height: 255,
          margin: EdgeInsets.only(bottom: 20),
          child: AppBarMainArea(
            bgColor: AppBackgroundColors().darkBackground,
            bgColorBar: AppColors().darkPrimaryColor,
            color: AppColors().darkPrimaryColor,
            title: 'Registrieren'.toUpperCase(),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            'Der Job maßgeschneidert für dich!',
            textAlign: TextAlign.center,
            style: AppTextStyles.darkH4White,
          ),
        ),
        Container(
            color: AppColors().white,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(10, 05, 10, 05),
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
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(10, 05, 10, 05),
            color: AppColors().white,
            child: Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  obscureText: _obscurePwd_1,
                  controller: passwordController_1,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Passwort',
                    suffixIcon: IconButton(
                        icon: Icon(_obscurePwd_1
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscurePwd_1 = !_obscurePwd_1;
                          });
                        }),
                  ),
                ))),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(10, 05, 10, 05),
            color: AppColors().white,
            child: Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  obscureText: _obscurePwd_2,
                  controller: passwordController_2,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Passwort wiederholen',
                    suffixIcon: IconButton(
                        icon: Icon(_obscurePwd_2
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscurePwd_2 = !_obscurePwd_2;
                          });
                        }),
                  ),
                ))),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 02),
            child: AppButton(
              text: 'Registrieren',
              color: AppColors().darkSecondaryColor,
              onPressed: () {
                print('registriert');
              },
            )),
        AppButton(
          text: "Zurück",
          color: AppColors().darkPrimaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
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
