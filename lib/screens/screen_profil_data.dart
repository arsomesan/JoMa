import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/global/glovar.dart';
import 'package:joma/materials/assets.dart';

import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_settings_loader.dart';
import 'package:joma/screens/screen_settings.dart';

import 'joblist_search_screen.dart';

class ProfilData extends StatelessWidget {
  const ProfilData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                margin: const EdgeInsets.only(top: 25.0),
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: NetworkImage("https://picsum.photos/250/250"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Glovar.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 30),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(color: Glovar.blackvar),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Norbert Haselmann",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'E-Mail',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "n-haselmann@mail.com",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Telefon',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "0800/2222222",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Adresse',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Leipziger Straße 12",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Stadt',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kassel",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Stärken',
                        style: TextStyle(color: Glovar.blackvar),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        InputChip(
                            label: const Text('Belastbarkeit'),
                            labelStyle: TextStyle(color: Glovar.white),
                            backgroundColor: Glovar.red,
                            onPressed: () {}),
                        Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: InputChip(
                                label: const Text('Teamfähigkeit'),
                                labelStyle: TextStyle(color: Glovar.white),
                                backgroundColor: Glovar.blue,
                                onPressed: () {})),
                        Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: InputChip(
                                label: const Text('Offenheit'),
                                labelStyle: TextStyle(color: Glovar.white),
                                backgroundColor: Glovar.green,
                                onPressed: () {})),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        InputChip(
                            label: const Text('Engagement'),
                            labelStyle: TextStyle(color: Glovar.white),
                            backgroundColor: Glovar.purple,
                            onPressed: () {}),
                        Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: InputChip(
                                label: const Text('Geduld'),
                                labelStyle: TextStyle(color: Glovar.white),
                                backgroundColor: Glovar.orange,
                                onPressed: () {})),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 140,
                height: 35,
                margin: const EdgeInsets.only(top: 35, bottom: 50),
                child: TextButton(
                  child: const Text('Profil bearbeiten'),
                  onPressed: () {
                    Get.off(() => const ProfilSettingsLoader());
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
            SizedBox(
              height: 35,
              child: Center(
                child: TextButton(
                  child: const Text('Impressum'),
                  onPressed: () {
                    // Button linking to the impress page
                  },
                  style: TextButton.styleFrom(
                    primary: Glovar.greylight,
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.only(bottom: 60),
              child: Center(
                child: TextButton(
                  child: const Text('Datenschutz'),
                  onPressed: () {
                    // Button linking to the impress page
                  },
                  style: TextButton.styleFrom(
                    primary: Glovar.greylight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          elevation: 0,
          child: const CircleAvatar(
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
            if (value == 0) Get.off(() => const JobListSearchScreen());
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
}
