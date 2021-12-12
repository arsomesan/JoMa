import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:joma/controllers/view_controller.dart';
import 'package:joma/screens/screen_home.dart';

class SelectView extends StatelessWidget {

  final ViewController viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BEREICH WÄHLEN',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Marcellus', fontSize: 20),
          ),
        ),
        backgroundColor: const Color.fromRGBO(129, 129, 129, 1),
      ),
      body: Center(
        child: Column(
          children: [
            //Card1: Nur Bilder
            GetBuilder<ViewController>(builder: (_) {
              return Flexible(
                child: GestureDetector(
                  onTap: () {viewController.setView(0);},
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Flexible(
                          child: Ink.image(
                            image: const NetworkImage(
                                'https://source.unsplash.com/random/800x600?house'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Nur Bilder"),
                        ),
                      ],
                    ),
                    color: (() {
                      if (_.state == 0) {
                        return const Color.fromRGBO(184, 219, 255, 1.0);
                      } else {
                        return Colors.white;
                      }
                    }()),
                    shape: Border.all(
                      color: (() {
                        if (_.state == 0) {
                          return Colors.blue;
                        } else {
                          return Colors.black;
                        }
                      }()),
                    ),

                  ),
                ),
                flex: 1,
              );
            },),

            //Card2: Leichte Sprache
            GetBuilder<ViewController>(builder: (_) {
              return Flexible(
                child: GestureDetector(
                  onTap: () {viewController.setView(1);},
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Flexible(
                          child: Ink.image(
                            image: const NetworkImage(
                                'https://source.unsplash.com/random/800x600?house'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Leichte Sprache"),
                        ),
                      ],
                    ),
                    color: (() {
                      if (viewController.state == 1) {
                        return const Color.fromRGBO(184, 219, 255, 1.0);
                      } else {
                        return Colors.white;
                      }
                    }()),
                    shape: Border.all(
                      color: (() {
                        if (_.state == 1) {
                          return Colors.blue;
                        } else {
                          return Colors.black;
                        }
                      }()),
                    ),

                  ),
                ),
                flex: 1,
              );
            },),

            //Card3: Volltext
            GetBuilder<ViewController>(builder: (_) {
              return Flexible(
                child: GestureDetector(
                  onTap: () {viewController.setView(2);},
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Flexible(
                          child: Ink.image(
                            image: const NetworkImage(
                                'https://source.unsplash.com/random/800x600?house'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Volltext"),
                        ),
                      ],
                    ),
                    color: (() {
                      if (_.state == 2) {
                        return const Color.fromRGBO(184, 219, 255, 1.0);
                      } else {
                        return Colors.white;
                      }
                    }()),
                    shape: Border.all(
                      color: (() {
                        if (_.state == 2) {
                          return Colors.blue;
                        } else {
                          return Colors.black;
                        }
                      }()),
                    ),

                  ),
                ),
                flex: 1,
              );
            },),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black12,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Weiter",
                style: TextStyle(fontFamily: 'Marcellus', fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
