import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/global/glovar.dart';
import 'package:joma/materials/appbar.dart';
import 'package:joma/materials/appbar_replaceable_image.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/button.dart';
import 'package:joma/model/profil_model.dart';

import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_settings.dart';
import 'package:joma/screens/screen_profil_skills.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:joma/utils/user_simple_preferences.dart';

import 'screen_joblist_search.dart';

class ProfilData extends StatelessWidget {
  const ProfilData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController data = Get.find();
//Load Profile from Json
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    Profil user = tmpUser[0];
    return Scaffold(
      backgroundColor: AppBackgroundColors().darkBackground,
      appBar: AppBarReplaceableImage(
        bgColor: AppBackgroundColors().darkBackground,
        bgColorBar: AppColors().darkPrimaryColor,
        color: AppColors().darkPrimaryColor,
        title: 'Profil'.toUpperCase(),
        bild: DecorationImage(
          image: NetworkImage(user.bild!),
          fit: BoxFit.cover,
        ),
        hoehe: 250,
      ),
      /*appBar: AppBar(
          title: const Text("Profil"),
          centerTitle: true,
          backgroundColor: Glovar.white,
          foregroundColor: Glovar.blackvar,
          actions: [
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Get.to(const Einstellungen());
                }),
          ]),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*Container(
              height: 255,
              //margin: EdgeInsets.only(bottom:20),
              child: AppBarReplaceableImage(
                bgColor: AppBackgroundColors().darkBackground,
                bgColorBar: AppColors().darkPrimaryColor,
                color: AppColors().darkPrimaryColor,
                title: 'Profil'.toUpperCase(),
                bild: DecorationImage(
                  image: NetworkImage(user.bild!),
                  fit: BoxFit.cover,
                ),
              ),
            ),*/
            /*Center(
              child: Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(top: 25.0),
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.bild!),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Glovar.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),*/
            Container(
              margin: const EdgeInsets.only(left: 20, top: 30),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(color: AppColors().white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      user.vorname! + " " + user.name!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors().white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'E-Mail',
                        style: TextStyle(color: AppColors().white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      user.kontakt!.email!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors().white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Telefon',
                        style: TextStyle(color: AppColors().white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      user.kontakt!.tel!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors().white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Adresse',
                        style: TextStyle(color: AppColors().white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      user.adresse!.strasse! + " " + user.adresse!.hausnummer!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors().white),
                    ),
                  ),
                  /*Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Stadt',
                        style: TextStyle(color: AppColors().white),
                      ),
                    ),
                  ),*/
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      user.adresse!.plz! + " " + user.adresse!.ort!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors().white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, bottom: 10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 20, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Stärken',
                        style: TextStyle(color: AppColors().white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Wrap(
                      children: [
                        for (int i = 0; i < user.skills!.length; i++)
                          Container(
                              child: buildSkill(
                                  data.skills.indexWhere(
                                          (skill) => skill.id == user.skills![i]),
                                  data)),
                      ],
                    ),
                  ),


                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35, bottom: 50),
              child: SizedBox(
                height: 60,
                width: 160,
                child: AppButton(
                    text: 'Profil bearbeiten',
                    color: AppColors().darkSecondaryColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenProfilSettings()));
                    }
                ),
              ),
            )

          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          elevation: 0,
          child: SvgPicture.asset("assets/images/darkLogo.svg",
          ),
          onPressed: () {
            Get.off(() => ScreenHome());
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (value) {
            if (value == 0) Get.off(() => ScreenJobListSearch());
            //if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilLoader()),
            //);
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
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildSkill(int skillID, DataController data) => Container(
        margin: EdgeInsets.only(right: 5, bottom: 5),
        child: InputChip(
            label: Text(data.skills.elementAt(skillID).title.toString()),
            labelStyle: TextStyle(color: AppColors().white),
            backgroundColor: Color(int.parse(
                data.skills.elementAt(skillID as int).colorHex.toString())),
            onPressed: () {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),

      );
}
