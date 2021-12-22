import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/controllers/view_controller.dart';
import 'package:joma/screens/joblist_search_screen.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'joblist_topic_screen.dart';
import 'package:joma/assets/assets.dart';

class HomeScreen extends StatelessWidget {
  final ViewController viewController = Get.put(ViewController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BEREICH WÄHLEN',
            textAlign: TextAlign.center,
            style: AppTextStyles.darkH1,
          ),
        ),
        backgroundColor: const Color.fromRGBO(129, 129, 129, 1),
      ),
      body: Column(
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
                              ),
                            ),
                          ),
                        ),
                        flex: 1),
                  ],
                ),
                flex: 1),
          ),
        ],
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
