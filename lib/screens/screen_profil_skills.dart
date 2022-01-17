import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/materials/assets.dart';
import 'package:get/get.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/materials/card.dart';
import 'package:joma/materials/checkbox_button.dart';
import 'package:joma/materials/skill_checkbox_button.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/model/skill_model.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_profil_settings_loader.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:joma/utils/user_simple_preferences.dart';

import 'joblist_search_screen.dart';

class ScreenProfilSkills extends StatefulWidget {
  ScreenProfilSkills({Key? key}) : super(key: key);

  @override
  _ScreenProfilSkillsState createState() => _ScreenProfilSkillsState();
}

class _ScreenProfilSkillsState extends State<ScreenProfilSkills> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final DataController data = Get.find();
  @override
  Widget build(BuildContext context) {

    //Load Profile from Json
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(UserSimplePreferences.getUser() ?? remoteUser.toString());
    Profil user = tmpUser[0];

    data.boolList =
        new List.filled(data.skills.length, false, growable: false).obs;

    for (int i = 0; i < data.skills.length; i++) {
      for (int l = 0; l < user.skills!.length; l++) {
        if (data.skills[i].id == user.skills![l]) {
          data.boolList[i] = true;
          break;
        }
      }
    }

    return Scaffold(
      backgroundColor: AppBackgroundColors().darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors().darkPrimaryColor,
        title: Text(
          'Deine Stärken'.toUpperCase(),
          style: AppTextStyles.darkH1,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: AppIcons().settingsWheel,
            onPressed: () {
              Get.to(() => const Einstellungen());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(child: Obx(() {


          var result = <Widget>[];



          result.add(Container(
              child: Column(
            children: [
              for (int i = 0; i < data.skills.length; i++)
                //renderSkillWidget(i, data, tmpUser)
                SkillCheckboxButton(
                    text: data.skills[i].title.toString(),
                    value: data.boolList[i],
                    onChanged: (bool? value) {
                      setState(() {
                        data.boolList[i] = value!;
                        saveSkillState(data.boolList, tmpUser);
                      });
                    })
            ],
          )));

          return Center(
              child: Column(
            children: [
              Column(
                children: result,
              ),

              Container(
                  child: AppButton(
                      text: "Speichern",
                      color: AppColors().darkPrimaryColor,
                      onPressed: () {
                        saveSkillState(data.boolList, tmpUser);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const ProfilSettingsLoader()));
                      }
                  )
              )
                ],
          ));
        })),
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
                    builder: (context) => const JobListSearchScreen()),
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

  void saveSkillState(RxList<bool> boolList, List<Profil> tmpUser) {
    int count = 0;
    for (int i = 0; i < data.boolList.length; i++) {
      if (data.boolList[i] == true) count++;
    }

    var skillList = new List.filled(count, 0, growable: false);
    int before = -1;
    for (int i = 0; i < skillList.length; i++) {
      for (int l = 0; l < data.boolList.length; l++) {
        print(l);
        if (data.boolList[l] == true && l > before) {
          skillList[i] = l;
          before = l;
          break;
        }
      }
    }
    tmpUser[0].skills = skillList;
    var lokalusersavetmp = profilToJson(tmpUser);
    UserSimplePreferences.setUser(lokalusersavetmp.toString());
  }



}
