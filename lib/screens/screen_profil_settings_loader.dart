import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/global/glovar.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_data.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_profil_skills.dart';
import 'package:joma/utils/user_simple_preferences.dart';
import 'dart:math' as math;

import 'joblist_search_screen.dart';

class ProfilSettingsLoader extends StatefulWidget {
  const ProfilSettingsLoader({Key? key}) : super(key: key);

  @override
  _ProfilSettingsLoaderState createState() => _ProfilSettingsLoaderState();
}

class _ProfilSettingsLoaderState extends State<ProfilSettingsLoader> {
  final DataController data = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //controller to save/use text from TextFormField
  final VornameController = TextEditingController();
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final TelController = TextEditingController();
  final StrasseController = TextEditingController();
  final HausnummerController = TextEditingController();
  final StadtController = TextEditingController();
  final PlzController = TextEditingController();

  //booleans to check for changes in TextFormField
  //TODO: implement better method of checking changed
  bool vornameCheck = false;
  bool nameCheck = false;
  bool emailCheck = false;
  bool telCheck = false;
  bool strasseCheck = false;
  bool hausnummerCheck = false;
  bool stadtCheck = false;
  bool plzCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil bearbeiten"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(() => ProfilData());
          },
        ),
        backgroundColor: Glovar.white,
        foregroundColor: Glovar.blackvar,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: Center(
              child: Obx(() {
                var remoteUser = profilToJson(data.profile);
                var tmpUser = profilFromJson(
                    UserSimplePreferences.getUser() ?? remoteUser.toString());
                Profil user = tmpUser[0];

                var bild = <Widget>[];
                var result = <Widget>[];
                var skills = <Widget>[];
                bild.add(
                  Container(
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
                );

                bild.add(
                  Container(
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 35,
                        margin: EdgeInsets.only(top: 10, bottom: 30),
                        child: TextButton(
                          child: Text('Avatar ändern'),
                          onPressed: () {
                            // Button to change the profile picture
                          },
                          style: TextButton.styleFrom(
                            primary: Glovar.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Glovar.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
                result.add(
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Vorname',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                );
                result.add(
                  Container(
                      child: TextFormField(
                          controller: VornameController,
                          onChanged: (text) {
                            vornameCheck = true;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: user.vorname!,
                          ))),
                );
                result.add(
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                );
                result.add(
                  Container(
                      child: TextFormField(
                          controller: NameController,
                          onChanged: (text) {
                            nameCheck = true;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: user.name!,
                          ))),
                );

                result.add(
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'E-Mail',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                );

                result.add(
                  Container(
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: EmailController,
                          onChanged: (text) {
                            emailCheck = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(EmailController.text);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: user.kontakt!.email,
                          ))),
                );

                result.add(
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Telefon',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                );

                result.add(
                  Container(
                      child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: TelController,
                          onChanged: (text) {
                            telCheck = true;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: user.kontakt!.tel,
                          ))),
                );

                result.add(
                  Row(children: [
                    Expanded(
                      flex: 5,
                      child: Column(children: [
                        Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Strasse',
                              style: TextStyle(color: Glovar.blackvar),
                            ),
                          ),
                        ),
                        Container(
                            child: TextFormField(
                                controller: StrasseController,
                                onChanged: (text) {
                                  strasseCheck = true;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: user.adresse!.strasse,
                                ))),
                      ]),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            child: Column(children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Hausnummer',
                                style: TextStyle(color: Glovar.blackvar),
                              ),
                            ),
                          ),
                          Container(
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: HausnummerController,
                                  onChanged: (text) {
                                    hausnummerCheck = true;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: user.adresse!.hausnummer,
                                  ))),
                        ])))
                  ]),
                );

                result.add(
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Stadt',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                );

                result.add(
                  Container(
                      child: TextFormField(
                          controller: StadtController,
                          onChanged: (text) {
                            stadtCheck = true;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: user.adresse!.ort,
                          ))),
                );

                result.add(
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Postleitzahl',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                );

                result.add(
                  Container(
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: PlzController,
                          onChanged: (text) {
                            plzCheck = true;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: user.adresse!.plz,
                          ))),
                );

                skills.add(
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Stärken',
                            style: TextStyle(color: Glovar.blackvar),
                          ),
                        ),
                      ),
                    ],
                  ),
                );

                skills.add(Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Wrap(
                    children: [
                      for (int i = 0; i < user.skills!.length; i++)
                        Container(
                            child: buildSkill(data.skills.indexWhere(
                                (skill) => skill.id == user.skills![i]))),
                      Container(
                        child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Get.to(() => ScreenProfilSkills());
                            }),
                      ),
                    ],
                  ),
                ));

                return Center(
                    child: Column(
                  children: [
                    Column(
                      children: bild,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: result,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: skills,
                        )),
                    Container(
                      child: Center(
                        child: Container(
                          width: 140,
                          height: 35,
                          margin: EdgeInsets.only(top: 35, bottom: 50),
                          child: TextButton(
                            child: Text('Speichern'),
                            onPressed: () {
                              if (emailCheck) {
                                tmpUser[0].kontakt!.email =
                                    EmailController.text;
                              }
                              if (vornameCheck) {
                                tmpUser[0].vorname = VornameController.text;
                              }
                              if (nameCheck) {
                                tmpUser[0].name = NameController.text;
                              }
                              if (telCheck) {
                                tmpUser[0].kontakt!.tel = TelController.text;
                              }
                              if (strasseCheck) {
                                tmpUser[0].adresse!.strasse =
                                    StrasseController.text;
                              }
                              if (hausnummerCheck) {
                                tmpUser[0].adresse!.hausnummer =
                                    HausnummerController.text;
                              }
                              if (stadtCheck) {
                                tmpUser[0].adresse!.ort = StadtController.text;
                              }
                              if (plzCheck) {
                                tmpUser[0].adresse!.plz = PlzController.text;
                              }

                              var lokalusersavetmp = profilToJson(tmpUser);
                              UserSimplePreferences.setUser(
                                  lokalusersavetmp.toString());
                              Get.off(() => ProfilData());

                            },
                            style: TextButton.styleFrom(
                              primary: Glovar.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Glovar.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
              }),
            )),
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
            Get.off(() => ScreenHome());
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (value) {
            if (value == 0) Get.off(() => JobListSearchScreen());
            if (value == 1) Get.off(() => ProfilLoader());
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

  //dont know how skills are gonna look...
  //as an example using inputchips
  //colors get generated at random
  Widget buildSkill(int skillID) => Container(
        margin: EdgeInsets.only(right: 5),
        child: InputChip(
            label: Text(data.skills.elementAt(skillID).title.toString()),
            labelStyle: TextStyle(color: AppColors().white),
            backgroundColor: Color(int.parse(
                data.skills.elementAt(skillID as int).colorHex.toString())),
            onPressed: () {}),
      );
}
