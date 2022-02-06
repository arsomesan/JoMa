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

class SelectView extends StatelessWidget {
  final ViewController viewController = Get.put(ViewController());

  SelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 110,
          title: Text(
            'Ansicht wählen'.toUpperCase(),
            style: AppTextStyles.darkH1,
          ),
          backgroundColor: AppBackgroundColors().darkBackground,
          centerTitle: true,
        ),
        backgroundColor: AppBackgroundColors().darkBackground,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //Card1: nur Bilder
                GetBuilder<ViewController>(
                  builder: (_) {
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
                                margin: const EdgeInsets.all(20.0),
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
                              Text("NUR BILDER",
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
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                //style: EdgeInsets.all(20.0),
                                children: [
                                  Radio(
                                      value: 0,
                                      groupValue: _.state,
                                      onChanged: (choice) {
                                        viewController.setView(0);
                                      }),
                                ],
                              ),
                              const SizedBox(width: 20),
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
                                margin: const EdgeInsets.all(20.0),
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("LEICHTE",
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
                                  Text("SPRACHE",
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
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Radio(
                                      value: 1,
                                      groupValue: _.state,
                                      onChanged: (choice) {
                                        viewController.setView(1);
                                      }),
                                ],
                              ),
                              const SizedBox(width: 20),
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
                                margin: const EdgeInsets.all(20.0),
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
                              Text("VOLLTEXT",
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
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Radio(
                                      value: 2,
                                      groupValue: _.state,
                                      onChanged: (choice) {
                                        viewController.setView(2);
                                      }),
                                ],
                              ),
                              const SizedBox(width: 20),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenHome()));
                      },
                    )),
                Container(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextEditingController nameController = TextEditingController();

