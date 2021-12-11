import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/screens/joblist_search_screen.dart';
import 'package:joma/screens/screen_profil.dart';
import 'joblist_topic_screen.dart';
import 'package:joma/assets/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BEREICH WÄHLEN',
            textAlign: TextAlign.center,
            style: AppTextStyles.appBar,
          ),
        ),
        backgroundColor: const Color.fromRGBO(129, 129, 129, 1),
      ),
      body: Column(
        children: [
          Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: GestureDetector(
                        onTap: () {
                          //Get.to(JobListTopicScreen());
                          Get.to(() => JobListTopicScreen());
                        },
                        child: Container(
                          color: const Color.fromRGBO(236, 234, 149, 1),
                          margin: const EdgeInsets.fromLTRB(20, 10, 5, 5),
                          child: Container(
                              child: const Center(
                                  child: Text(
                                    "Lebensmittel & Service",
                                  )),
                              constraints: const BoxConstraints.expand()),
                        ),
                      ),
                      flex: 1),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        //Get.to(JobListTopicScreen());
                        Get.to(() => JobListTopicScreen());

                      },
                      child: Container(
                        color: const Color.fromRGBO(96, 158, 120, 1),
                        margin: const EdgeInsets.fromLTRB(5, 10, 20, 5),
                        child: Container(
                            child: const Center(
                                child: Text(
                                  "Gärtnerei & Landwirtschaft",
                                )),
                            constraints: const BoxConstraints.expand()),
                      ),
                    ),
                      flex: 1),
                ],
              ),
              flex: 1),
          Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        //Get.to(JobListTopicScreen());
                        Get.to(() => JobListTopicScreen());

                      },
                      child: Container(
                        color: const Color.fromRGBO(176, 73, 75, 1),
                        margin: const EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Container(
                            child: const Center(
                                child: Text(
                                  "Handwerk und Technik",
                                )),
                            constraints: const BoxConstraints.expand()),
                      ),
                    ),
                      flex: 1),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        //Get.to(JobListTopicScreen());
                        Get.to(() => JobListTopicScreen());

                      },
                      child: Container(
                        color: const Color.fromRGBO(87, 126, 154, 1),
                        margin: const EdgeInsets.fromLTRB(5, 5, 20, 10),
                        child: Container(
                            child: const Center(
                                child: Text(
                                  "Soziales & Hauswirtschaft",
                                )),
                            constraints: const BoxConstraints.expand()),
                      ),
                    ),
                      flex: 1),
                ],
              ),
              flex: 1),



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
            if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenProfil()),
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
