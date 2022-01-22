import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/appbar_replaceable_image.dart';
import 'package:joma/materials/assets.dart';
import 'package:get/get.dart';
import 'package:joma/materials/card.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_settings.dart';

import 'screen_joblist_search.dart';

class ScreenSavedJobs extends StatelessWidget {
  ScreenSavedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            AppCardSearch(
                jobTitle: 'Testjob',
                jobDescription: 'Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung',
                color: AppColors().darkYellow,
                onPressed: () {}
                ),
            AppCardSearch(
                jobTitle: 'Testjob',
                jobDescription: 'Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung',
                color: AppColors().darkBlue,
                onPressed: () {}
            ),
            AppCardSearch(
                jobTitle: 'Testjob',
                jobDescription: 'Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung',
                color: AppColors().darkRed,
                onPressed: () {}
            ),
            AppCardSearch(
                jobTitle: 'Testjob',
                jobDescription: 'Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung',
                color: AppColors().darkGreen,
                onPressed: () {}
            ),
            AppCardSearch(
                jobTitle: 'Testjob',
                jobDescription: 'Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung',
                color: AppColors().darkRed,
                onPressed: () {}
            ),
            AppCardSearch(
                jobTitle: 'Testjob',
                jobDescription: 'Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung',
                color: AppColors().darkBlue,
                onPressed: () {}
            ),
            AppCardSearch(
                jobTitle: 'Testjob',
                jobDescription: 'Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung Testjobbeschreibung',
                color: AppColors().darkYellow,
                onPressed: () {}
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          elevation: 0,
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage(
              'assets/images/darkJomaLogo.png',
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ScreenHome()),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (value) {
            if (value == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ScreenJobListSearch()),
              );
            }
            if (value == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilLoader()),
              );
            }
            //if (value == 2) Navigator.of(context).push(...);
          },
          backgroundColor: AppColors().darkPrimaryColor,
          selectedItemColor: AppColors().darkSecondaryColor,
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
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
