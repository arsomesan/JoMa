import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:joma/controllers/view_controller.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:get/get.dart';
import 'package:joma/materials/assets.dart';
import 'package:flutter/material.dart';

enum Choice { bild, einfach,voll }

class SelectView extends StatelessWidget {
  final ViewController viewController = Get.put(ViewController());

  Choice? _character = Choice.bild;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight:110,
          title: Text(
            'Ansicht wählen'.toUpperCase(),
            style: AppTextStyles.darkH1,
          ),
          backgroundColor: AppBackgroundColors().darkBackground,
          centerTitle: true,
        ),
        backgroundColor: AppBackgroundColors().darkBackground,
        body: Center(
          child: Column(
            children: [
              //Card1: nur Bilder
              GetBuilder<ViewController>(
                builder: (_) {
                Choice? _character = Choice.bild;
                  return Container(

                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .20,
                    child: GestureDetector(
                      onTap: () {
                        viewController.setView(0);
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.photo_library,
                                size: 85,
                                color: (() {
                                  if (_.state == 0) {
                                    return Colors.white;
                                  } else {
                                    return AppBackgroundColors().darkBackground;
                                  }
                                }()),
                              ),
                            ),
                            Container(
                              child: Text("NUR BILDER",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: (() {
                                      if (_.state == 0) {
                                        return Colors.white;
                                      } else {
                                        return AppBackgroundColors()
                                            .darkBackground;
                                      }
                                    }()),
                                  ),
                                  textAlign: TextAlign.center),
                            ),

                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                new Radio(
                                  value: 0,
                                  groupValue: _.state,
                                 onChanged: (Choice) {}
                                ),
                              ],
                            ),
                          ],
                        ),
                        color: (() {
                          if (_.state == 0) {
                            return AppColors().darkPrimaryColor;
                          } else {
                            return Colors.white;
                          }
                        }()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  );
                },
              ),

              //Card2: Leichte Sprache
              GetBuilder<ViewController>(
                builder: (_) {
                  Choice? _character = Choice.einfach;
                  return Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .20,
                    child: GestureDetector(
                      onTap: () {
                        viewController.setView(1);
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.tag_faces,
                                size: 85,
                                color: (() {
                                  if (_.state == 1) {
                                    return Colors.white;
                                  } else {
                                    return AppBackgroundColors().darkBackground;
                                  }
                                }()),
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text("EINFACHE",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: (() {
                                            if (_.state == 1) {
                                              return Colors.white;
                                            } else {
                                              return AppBackgroundColors()
                                                  .darkBackground;
                                            }
                                          }()),
                                        ),
                                        textAlign: TextAlign.center),
                                  ),
                                  Container(
                                    child: Text("SPRACHE",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: (() {
                                            if (_.state == 1) {
                                              return Colors.white;
                                            } else {
                                              return AppBackgroundColors()
                                                  .darkBackground;
                                            }
                                          }()),
                                        ),
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                new Radio(
                                    value: 1,
                                    groupValue: _.state,
                                    onChanged: (Choice) {}
                                ),
                              ],
                            ),
                          ],
                        ),
                        color: (() {
                          if (viewController.state == 1) {
                            return AppColors().darkPrimaryColor;
                          } else {
                            return Colors.white;
                          }
                        }()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  );
                },
              ),

              //Card3: Volltext
              GetBuilder<ViewController>(
                builder: (_) {
                  Choice? _character = Choice.voll;
                  return Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .20,
                    child: GestureDetector(
                      onTap: () {
                        viewController.setView(2);
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.chat,
                                size: 85,
                                color: (() {
                                  if (_.state == 2) {
                                    return Colors.white;
                                  } else {
                                    return AppBackgroundColors().darkBackground;
                                  }
                                }()),
                              ),
                            ),
                            Container(
                              child: Text("VOLLTEXT",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: (() {
                                      if (_.state == 2) {
                                        return Colors.white;
                                      } else {
                                        return AppBackgroundColors()
                                            .darkBackground;
                                      }
                                    }()),
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                new Radio(
                                    value: 2,
                                    groupValue: _.state,
                                    onChanged: (Choice) {}
                                ),
                              ],
                            ),
                          ],
                        ),
                        color: (() {
                          if (_.state == 2) {
                            return AppColors().darkPrimaryColor;
                          } else {
                            return Colors.white;
                          }
                        }()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: AppButton(
                    text: "Weiter",
                    color: AppColors().darkSecondaryColor,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ScreenHome()));
                    },
                  )),
            ],

          ),
        ),
      ),
    );
  }
  }


  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

void setState(Null Function() param0) {
}


/*
(Choice) {
setState(() {
_character = voll;
});
*/


