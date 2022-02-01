import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/appbar.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/button.dart';

class ScreenPasswordReset extends StatefulWidget {
  const ScreenPasswordReset({Key? key}) : super(key: key);

  @override
  _ScreenPasswordResetState createState() => _ScreenPasswordResetState();
}

class _ScreenPasswordResetState extends State<ScreenPasswordReset> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscurePwd = true;

  @override
  Widget build(BuildContext context) {
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
                    title: 'Passwort\n vergessen'.toUpperCase()
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    text: TextSpan(children: const [
                      TextSpan(
                        text: 'E-Mail',
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
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      backgroundColor: AppColors().white
                    ),
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-Mail',
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
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
                        text: 'Passwort',
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
                        text: 'Passwort wiederholen',
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
                      obscureText: _obscurePwd,
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Passwort wiederholen',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          suffixIcon: IconButton(
                            icon: Icon(_obscurePwd
                                ? Icons.visibility
                                : Icons.visibility_off),
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
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 02),
                child: AppButton(
                  text: 'Passwort aktualisieren',
                  color: AppColors().darkSecondaryColor,
                  onPressed: () {
                  }
                )
              ),
            ]),
      ),
    );
  }
}

