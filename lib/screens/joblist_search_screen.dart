import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/card.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_job_details.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_settings.dart';

class JobListSearchScreen extends StatelessWidget {
  const JobListSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _colorGrey = Color.fromRGBO(129, 129, 129, 1);
    const _colorRed = Color.fromRGBO(177, 72, 72, 1);
    const _colorBlue = Color.fromRGBO(86, 126, 155, 1);
    const _colorGreen = Color.fromRGBO(96, 158, 119, 1);
    const _colorYellow = Color.fromRGBO(239, 243, 130, 1);
    final List<Color> _jobColors = [
      _colorBlue,
      _colorGreen,
      _colorYellow,
      _colorRed
    ];

    return Scaffold(
      backgroundColor: AppBackgroundColors().darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors().darkPrimaryColor,
        title: Text('Alle Jobs'.toUpperCase(), style: AppTextStyles.darkH1),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildSearchBar(),
            for (int i = 0; i < 7; i++) generateSingleJobCard(_jobColors),
            const SizedBox(height: 50),
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

Widget generateSingleJobCard(List<Color> _jobColors) {
  final _random = new Random();
  Color _color = _jobColors[_random.nextInt(_jobColors.length)];

  return (Center(
    child: AppCardSearch(
        jobTitle: 'Jobtitel',
        jobDescription: 'Dies ist eine Testbeschreibung vom hier angezeigten Job!',
        color: _color,
        onPressed: () {})
  ));
}

Widget buildSearchBar() {
  return (Center(
    child: Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: Card(
        shape: Border.all(color: Colors.grey, width: 0.5),
        child: SizedBox(
          width: 320,
          height: 35,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('Suche ...'),
              ),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: '',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}
