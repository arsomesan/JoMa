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
import 'package:joma/materials/button.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_test.dart'; //Json
import 'package:joma/materials/assets.dart';
import 'package:joma/utils/user_simple_preferences.dart';

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

  @override
  Widget build(BuildContext context) {
    //Load Profile from Json
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    Profil user = tmpUser[0];

    bool validate(String email, String pwd) {
      //ToDos: json durchlaufen
      if (user.kontakt!.email == email && user.password == pwd) {
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
          margin: EdgeInsets.only(bottom: 20),
          child: AppBarMainArea(
            bgColor: AppBackgroundColors().darkBackground,
            bgColorBar: AppColors().darkPrimaryColor,
            color: AppColors().darkPrimaryColor,
            title: 'Anmelden'.toUpperCase(),
          ),
          //style:AppTextStyles.darkH1,
        ),
        Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: RichText(
              text: TextSpan(children: const [
                TextSpan(
                  text: 'E-Mail',
                  style: AppTextStyles.darkH4,
                )
              ]),
            )),
        Container(
            color: AppColors().white,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(10, 05, 10, 05),
            child: Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    backgroundColor: AppColors().white,
                  ),
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-Mail',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ))),
        Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: RichText(
              text: TextSpan(children: const [
                TextSpan(
                  text: 'Passwort',
                  style: AppTextStyles.darkH4,
                )
              ]),
            )),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(10, 05, 10, 05),
            color: AppColors().white,
            child: Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  obscureText: _obscurePwd,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Passwort',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
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
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(0, 190, 0, 02),
            child: AppButton(
              text: 'Anmelden',
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                if (validate(emailController.text, passwordController.text)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectView()),
                  );
                }
              },
            )),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
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
