import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/controllers/view_controller.dart';
import 'package:joma/screens/joblist_search_screen.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_settings.dart';
import 'joblist_topic_screen.dart';
import 'package:joma/materials/assets.dart';

class HomeScreen extends StatelessWidget {
  final ViewController viewController = Get.put(ViewController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Center(
          child: Text(
            'JOMA',
            textAlign: TextAlign.center,
            style: AppTextStyles.darkH1,
          ),
        ),
        actions: [
          IconButton(
              icon: AppIcons().settingsWheel,
            onPressed: () {
              Get.to(() => const Einstellungen());
            },
          )
        ],
        //backgroundColor: const Color.fromRGBO(129, 129, 129, 1),
      ),
      extendBodyBehindAppBar: true,

      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Center(
          child: Column(
            children: [
              
              /*
              GetBuilder<ViewController>(builder: (_){
                if(_.state == 1){
                  return const Text("Mangopudding");
                }
                else {
                  return Text("Der aktuelle State ist ${_.state}");
                }

              },),
               */
              RotationTransition(
                turns: const AlwaysStoppedAnimation(45 / 360),
                alignment: Alignment(-0.5, 1.5),
                child: Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: GestureDetector(
                              onTap: () {
                                //Get.to(JobListTopicScreen());
                                Get.to(() => JobListTopicScreen());

                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors().darkRed,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    child: const RotationTransition(
                                      turns: AlwaysStoppedAnimation(-45 / 360),
                                      child: Text(
                                        "TECHNIK\nHANDWERK",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            flex: 1),
                        Flexible(
                            child: GestureDetector(
                              onTap: () {
                                //Get.to(JobListTopicScreen());
                                Get.to(() => JobListTopicScreen());
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors().darkGreen,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    child: const RotationTransition(
                                      turns: AlwaysStoppedAnimation(-45 / 360),
                                      child: Text(
                                        "GÄRTNEREI\nLANDWIRTSCHAFT",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            flex: 1),
                      ],
                    ),
                    flex: 1),
              ),

              RotationTransition(
                turns:  const AlwaysStoppedAnimation(45 / 360),
                alignment: Alignment(-0.5, -0.5),
                child: Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              //Get.to(JobListTopicScreen());
                              Get.to(() => JobListTopicScreen());

                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors().darkBlue,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(32.0),
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  child: const RotationTransition(
                                    turns: AlwaysStoppedAnimation(-45 / 360),
                                    child: Text(
                                      "SOZIALES\nHAUSWIRTSCHAFT",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                            flex: 1),
                        Flexible(
                            child: GestureDetector(
                              onTap: () {
                                //Get.to(JobListTopicScreen());
                                Get.to(() => JobListTopicScreen());
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors().darkYellow,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    child: const RotationTransition(
                                      turns: AlwaysStoppedAnimation(-45 / 360),
                                      child: Text(
                                        "SERVICE\nLEBENSMITTEL",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            flex: 1),
                      ],
                    ),
                    flex: 1),
              ),
              Container(height: 250),
              const Text(
                "UNSICHER?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(height: 20),
              ElevatedButton(
                  onPressed: (){
                    Get.to(() => const JobListTopicScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    "Wahl-O-Mat",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                  ),)),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.home),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (value) {
            if (value == 0) Navigator.push(context, MaterialPageRoute(builder: (context) => const JobListSearchScreen()),
            );
            if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilLoader()),
            );
            //if (value == 2) Navigator.of(context).push(...);
          },
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.black54,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Suchen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ]
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = AppBackgroundColors().darkBackground;
    //paint.color = Colors.white;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.15);
    ovalPath.quadraticBezierTo(width * 0.45, height * 0.35, width * 0.51, height * 0.5);
    ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);
    ovalPath.lineTo(0, height);
    ovalPath.close();

    //paint.color = AppBackgroundColors().darkBackground.withOpacity(0.8);
    paint.color = Colors.blueAccent;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
