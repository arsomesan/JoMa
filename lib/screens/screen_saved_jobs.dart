import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/materials/appbar_replaceable_image.dart';
import 'package:joma/materials/assets.dart';
import 'package:get/get.dart';
import 'package:joma/materials/card.dart';
import 'package:joma/materials/navbar.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:joma/utils/user_simple_preferences.dart';

import 'screen_joblist_search.dart';

class ScreenSavedJobs extends StatelessWidget {
  ScreenSavedJobs({Key? key}) : super(key: key);
  final DataController data = Get.find();
  @override
  Widget build(BuildContext context) {
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    Profil user = tmpUser[0];
    var jobIndex = 0;

    return Scaffold(
      backgroundColor: AppBackgroundColors().darkBackground,
      appBar: AppBarReplaceableImage(
        bgColor: AppBackgroundColors().darkBackground,
        bgColorBar: AppColors().darkPrimaryColor,
        color: AppColors().darkPrimaryColor,
        title: 'Gespeicherte Jobs'.toUpperCase(),
        bild: DecorationImage(
          image: new AssetImage("assets/icons/walking-solid.png"),
          fit: BoxFit.cover,
        ),
        hoehe: 230,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 50),
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('Hier siehst du deine gespeicherten Jobs!',
                  style: AppTextStyles.darkH4White,
                  textAlign: TextAlign.center),
            ),
            Obx(() {
              var result = <Widget>[];

              if (user.savedJobs!.length == 0) {
                result.add(Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                        child: Text("Keine Jobs gespeichert.",
                        style: TextStyle(color: AppColors().white))),
                    Container(
                      child: Text(
                        user.savedJobs!.length.toString() +
                            " Gespeicherte Jobs von " +
                            data.jobs.length.toString(),
                        style: TextStyle(color: AppColors().white),
                      ),
                    )
                  ],
                ));
              } else {
                for (int i = 0; i < user.savedJobs!.length; i++) {
                  var currentJob = data.jobs.elementAt(user.savedJobs![i]);
                  result.add(AppCardSearch(
                      jobTitle: currentJob.title.toString(),
                      jobDescription: currentJob.description!.simple.toString(),
                      color: Color(int.parse(data.jobCategories
                          .elementAt(currentJob.category!)
                          .colorHex
                          .toString())),
                      onPressed: () {}));
                }
              }

              return Column(
                children: result,
              );
            }),
          ],
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
          selectedItemColor: AppColors().white,
          unselectedItemColor: AppColors().white),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
