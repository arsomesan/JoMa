import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/materials/appbar.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/materials/pop_up.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:joma/utils/user_simple_preferences.dart';

class ScreenPasswordReset extends StatefulWidget {
  const ScreenPasswordReset({Key? key}) : super(key: key);

  @override
  _ScreenPasswordResetState createState() => _ScreenPasswordResetState();
}

class _ScreenPasswordResetState extends State<ScreenPasswordReset> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  bool _obscurePwd = true;
  bool _obscurePwd2 = true;
  bool _obscurePwd3 = true;

  @override
  Widget build(BuildContext context) {
    final DataController data = Get.find();
//Load Profile from Json
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    Profil user = tmpUser[0];
    return Scaffold(
      backgroundColor: AppBackgroundColors().darkBackground,
      body: Center(
        child: ListView(
            children: <Widget>[
              Container(
                height: 255,
                margin: EdgeInsets.only(bottom: 20),
                child: AppBarMainArea(
                    bgColor: AppBackgroundColors().darkBackground,
                    bgColorBar: AppColors().darkPrimaryColor,
                    color: AppColors().darkPrimaryColor,
                    title: 'Passwort\n ändern'.toUpperCase()
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    text: TextSpan(children: const [
                      TextSpan(
                        text: 'Altes Passwort',
                        style: AppTextStyles.darkH4White,
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
                      obscureText: _obscurePwd,
                      controller: oldPasswordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Altes Passwort',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          suffixIcon: IconButton(
                            icon: Icon(_obscurePwd
                                ? Icons.visibility
                                : Icons.visibility_off
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePwd = !_obscurePwd;
                              });
                            },
                          )
                      )
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: RichText(
                    text: TextSpan(children: const [
                      TextSpan(
                        text: 'Neues Passwort',
                        style: AppTextStyles.darkH4White,
                      )
                    ]),
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10, 05, 10, 05),
                color: AppColors().white,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: TextField(
                    obscureText: _obscurePwd2,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Neues Passwort',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePwd2
                          ? Icons.visibility
                          : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscurePwd2 = !_obscurePwd2;
                          });
                        },
                      )
                    )
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: RichText(
                    text: TextSpan(children: const [
                      TextSpan(
                        text: 'Neues Passwort wiederholen',
                        style: AppTextStyles.darkH4White,
                      )
                    ]),
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10, 05, 10, 05),
                color: AppColors().white,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: TextField(
                      obscureText: _obscurePwd3,
                      controller: passwordController2,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Neues Passwort wiederholen',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          suffixIcon: IconButton(
                            icon: Icon(_obscurePwd3
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscurePwd3 = !_obscurePwd3;
                              });
                            },
                          )
                      )
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 02),
                child: AppButton(
                  text: 'Passwort ändern',
                  color: AppColors().darkSecondaryColor,
                  onPressed: () {
                    bool oldPass = false;
                    bool newPass = false;
                    if(oldPasswordController.text == user.password) oldPass = true;
                    if(passwordController.text == passwordController2.text && passwordController.text != "") newPass = true;

                    if(oldPass == false && newPass) {
                      showDialog(context: context,
                          builder: (context) => PopUpAlert(title: "Altes Passwort nicht korrekt", content: "Bitte überprüfe das eingegebene alte Passwort.", current: Einstellungen(), context: context)

                      );
                    }

                    if(oldPass && newPass == false) {
                      showDialog(context: context,
                          builder: (context) => PopUpAlert(title: "Neues Passwort stimmt nicht.", content: "Entweder stimmen die Passwörter nicht überein oder du hast die Felder leer gelassen.", current: Einstellungen(), context: context)

                      );
                    }

                    if(oldPass == false && newPass == false) {
                      showDialog(context: context,
                          builder: (context) => PopUpAlert(title: "Alles falsch.", content: "Das alte Passwort ist nicht korrekt oder die neuen Stimmen nicht überein. Vielleicht hast du auch ein Feld leer gelassen.", current: Einstellungen(), context: context)

                      );
                    }

                    if(oldPass && newPass) {
                      tmpUser[0].password = passwordController.text;
                      var lokalusersavetmp = profilToJson(tmpUser);
                      UserSimplePreferences.setUser(
                          lokalusersavetmp.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Ihr Passwort wurde erfolgreich geändert.'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors().darkPrimaryColor,
                          action: SnackBarAction(
                            label: 'Schließen',
                            textColor: AppColors().white,
                            onPressed: () {},
                          ),
                        ),
                      );
                    }

                  }
                )
              ),
            ]),
      ),
    );
  }
}

