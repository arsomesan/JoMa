import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/controllers/view_controller.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_joblist_search.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:joma/utils/user_simple_preferences.dart';
import 'screen_joblist_category.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/homescreen_card.dart';
import 'package:joma/materials/navbar.dart';

class ScreenHome extends StatelessWidget {
  final ViewController viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    //profile to use
    Profil user = tmpUser[0];
    fillBooleanData(data.jobList, user.savedJobs!, data.jobs);
    fillBooleanData(data.boolList, user.skills!, data.skills);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'JOMA',
            textAlign: TextAlign.center,
            style: AppTextStyles.darkH1,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: AppIcons().settingsWheel,
              onPressed: () {
                Get.to(() => const Einstellungen());
              },
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: CustomPaint(
            painter: BackgroundPainter(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 130),
                  Stack(children: [
                    Container(
                      alignment: Alignment.center,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(45 / 360),
                        child: Container(
                          width: 300,
                          height: 300,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                child: HomeScreenCard(
                                  elevatedButtonRoute: () {
                                    Get.to(() =>
                                        ScreenJobListCategory(categoryID: 0));
                                  },
                                  color: AppColors().darkRed,
                                  icon: AppIcons().homeRedSection,
                                  title: 'TECHNIK\nHANDWERK',
                                  startOrEnd: 1,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 150,
                                child: HomeScreenCard(
                                  elevatedButtonRoute: () {
                                    Get.to(() =>
                                        ScreenJobListCategory(categoryID: 1));
                                  },
                                  color: AppColors().darkGreen,
                                  icon: AppIcons().homeGreenSection,
                                  title: 'GÄRTNEREI\nLANDWIRT-\nSCHAFT',
                                  startOrEnd: 0,
                                ),
                              ),
                              Positioned(
                                top: 150,
                                left: 0,
                                child: HomeScreenCard(
                                  elevatedButtonRoute: () {
                                    Get.to(() =>
                                        ScreenJobListCategory(categoryID: 2));
                                  },
                                  color: AppColors().darkBlue,
                                  icon: AppIcons().homeBlueSection,
                                  title: 'SOZIALES\nHAUSWIRT-\nSCHAFT',
                                  startOrEnd: 0,
                                ),
                              ),
                              Positioned(
                                top: 150,
                                left: 150,
                                child: HomeScreenCard(
                                  elevatedButtonRoute: () {
                                    Get.to(() =>
                                        ScreenJobListCategory(categoryID: 3));
                                  },
                                  color: AppColors().darkYellow,
                                  icon: AppIcons().homeYellowSection,
                                  title: 'SERVICE\nLEBENSMITTEL',
                                  startOrEnd: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Container(height: 90),
                  const Text(
                    "UNSICHER?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => ScreenJobListCategory(categoryID: 0));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 20),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      "Wahl-O-Mat",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(height: 50),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          height: 100.0,
          width: 100.0,
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/images/darkLogo.svg",
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ScreenHome()),
              );
            },
          ),
        ),
        bottomNavigationBar: AppNavBar(
          backgroundColor: AppColors().darkPrimaryColor,
          selectedItemColor: AppBackgroundColors().darkBackground,
          unselectedItemColor: AppBackgroundColors().darkBackground,
        ),
        /*bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            onTap: (value) {
              if (value == 0)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JobListSearchScreen()),
                );
              if (value == 1)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilLoader()),
                );
              //if (value == 2) Navigator.of(context).push(...);
            },
            backgroundColor: AppColors().darkPrimaryColor,
            selectedItemColor: AppColors().white,
            unselectedItemColor: AppColors().white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: AppIcons().searchGlass,
                label: 'Suchen',
              ),
              BottomNavigationBarItem(
                icon: AppIcons().profile,
                label: 'Profil',
              ),
            ]),*/
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
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

    canvas.drawPath(mainBackground, paint);

    var paint4 = Paint()
      ..color = const Color.fromRGBO(20, 20, 40, 0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(width * 0.8, height * 0.8), width * 0.5, paint4);

    var paint1 = Paint()
      ..color = const Color.fromRGBO(25, 25, 126, 0.4)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(width * 0.1, height * 0.5), width * 0.45, paint1);

    var paint2 = Paint()
      ..color = const Color.fromRGBO(87, 87, 174, 0.2)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(width * 0.8, height * 0.2), width * 0.5, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

//filling boolean arrays from user simple preferences or remote data
void fillBooleanData(
    List<bool> listSave, List<int> listCheck, List<dynamic> org) async {
  var remoteUser = profilToJson(data.profile);
  //Load Profile from Shared Preferences if given. If not load Json Profile
  var tmpUser =
      profilFromJson(UserSimplePreferences.getUser() ?? remoteUser.toString());
  //profile to use
  Profil user = tmpUser[0];
  for (int i = 0; i < listSave.length; i++) {
    for (int l = 0; l < listCheck.length; l++) {
      if (org[i].id == listCheck[l]) {
        listSave[i] = true;
        break;
      }
    }
  }
}
