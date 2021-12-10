// ignore_for_file: avoid_print, prefer_const_constructors, duplicate_ignore

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; //Json
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_test.dart'; //Json

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  _ScreenLogin createState() => _ScreenLogin();
}

class _ScreenLogin extends State<ScreenLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color loginButtonColor = const Color(0xFF434343);
  Color skipButtonColor = const Color(0xFFA1A1A1);
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
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Image(
                image: AssetImage('assets/images/Logo.png'),
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-Mail',
                  ),
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                )),
            Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: ElevatedButton(
                  child: Text('Einloggen'.toUpperCase()),
                  style: ElevatedButton.styleFrom(
                    primary: loginButtonColor,
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway'),
                  ),
                  onPressed: () {
                    if (validate(
                        emailController.text, passwordController.text)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectView()),
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
                      text: 'Du hast keinen Account? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: 'Hier Registrieren',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Account erstellen.');
                          })
                  ]),
                )),
            Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
                child: ElevatedButton(
                    child: Text('Überspringen'.toUpperCase()),
                    style: ElevatedButton.styleFrom(
                      primary: skipButtonColor,
                      onPrimary: Colors.black,
                      textStyle: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      print('Überspringen');
                      Get.to(SelectView());
                    }))
          ])),
    );
  }
}
