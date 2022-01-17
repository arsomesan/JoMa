// Page-Imports

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/model/job_category_model.dart';
import 'package:joma/model/job_model.dart';
import 'package:joma/model/skill_model.dart';

import 'package:joma/materials/card.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/services/remote_services.dart';
import 'joblist_search_screen.dart';

// Material-Imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Element-Imports
import 'package:carousel_slider/carousel_slider.dart';

// Map-Imports
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// Asset-Imports & Buttons
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/button.dart';

// FontAwesome-Import (not working atm)
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreenJobDetails extends StatelessWidget {
  final int? jobID;
  ScreenJobDetails({Key? key, required this.jobID}) : super(key: key);
  final DataController data = Get.find();
  late Job job = data.jobs.elementAt(jobID!);

  late JobCategory currentJobCategory = data.jobCategories
      .firstWhere((category) => category.id == job.category);

  late Color currentColor = Color(
      int.parse(data.jobCategories.elementAt(currentJobCategory.id as int).colorHex.toString()));
  late Color currentBackgroundColor = Color(
      int.parse(data.jobCategories.elementAt(currentJobCategory.id as int).backgroundColorHex.toString()));


@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: appBarBuilder(),
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
      body: ListView(
        children: [
          //titleImageBuilder(job),
          titleTextBuilder(context),
          carouselSliderBuilder(),
          jobDescriptionBuilder(),
          skillBackgroundBuilder(context),
          graduationBuilder(),
          mapBuilder(),
          adressBuilder(),
          buildHorizontalDivider(),
          buildDistanceText(),
          //buildApplyButton(),
          AppButton(
              text: 'Bewerben',
              color: AppColors().darkSecondaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenHome()));
              }),
          SizedBox(
            height: 50.0,
          ),
        ],
      ));


}

// ---------- APP-BAR ----------

// Dieses Widget baut die App-Bar auf
PreferredSizeWidget appBarBuilder() {
  return AppBar(
    backgroundColor: currentColor,
    title: Text(
      currentJobCategory.title.toString().toUpperCase(),
      style: AppTextStyles.darkH4,
    ),
    centerTitle: true,
  );
}

// ---------- TITELBILD ----------
/*
Widget titleImageBuilder(Job job) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        image: NetworkImage(
          job.images!.banner.toString(),
        ),
      ),
    ),
  );
}
*/
// ---------- JOB-BESCHREIBUNG ----------

Widget jobDescriptionBuilder() {
  return Padding(
    padding: EdgeInsets.fromLTRB(44, 10, 44, 0),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        job.description!.full.toString(),
        style: AppTextStyles.darkMainText,
      ),
    ),
  );
}

// ---------- FÄHIGKEITEN ----------

// Dieses Widget baut eine Reihe von Fähigkeiten auf
Widget buildSkillCards() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < job.skills!.length; i++)
          Expanded(
              child: buildSkill(data.skills.indexWhere((skill) => skill.id == job.skills![i]))),
      ],
    ),
  );
}

// Dieses Widget baut eine einzelne Fähigkeit auf
Widget buildSkill(int skillID) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildBox(child: Icon(Icons.build)),
        const SizedBox(height: 5),
        Text(
          data.skills.elementAt(skillID).title.toString(),
          style: AppTextStyles.darkMainText,
        )
      ],
    );

// Dieses Widget baut einen Kreis als Hintergrund um das Fähigkeits-Icon auf
Widget buildBox({required Widget child}) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(7),
      child: child,
    );

// ---------- SCHULABSCHLUSS ----------

// Dieses Widget baut die Schulabschluss-Anzeige auf
Widget graduationBuilder() {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSchoolBox(child: Icon(Icons.school, size: 50)),
            const SizedBox(height: 10),
            Text(
              job.requiredGraduation.toString(),
              style: AppTextStyles.darkH1,
            )
          ],
        ),
      ],
    ),
  );
}

// Dieses Widget baut einen Kreis als Hintergrund um das Schulabschluss-Icon auf
Widget buildSchoolBox({required Widget child}) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors().darkGreen,
      ),
      padding: EdgeInsets.all(15),
      child: child,
    );

// ---------- MAP ----------

// Dieses Widget baut (zunächst) eine Karte
Widget mapBuilder() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: Image(
      image: AssetImage('assets/images/maps.PNG'),
    ),
  );
}

// ---------- ADRESSE ----------

// Dieses Widget baut die Adresszeile auf
Widget adressBuilder() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAdressBox(child: AppIcons().nurBilder),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              job.company.toString(),
              style: AppTextStyles.darkMainText,
            ),
            Text(
              job.address!.street.toString(),
              style: AppTextStyles.darkMainText,
            ),
            Text(
              job.address!.zip.toString() + ' ' + job.address!.city.toString(),
              style: AppTextStyles.darkMainText,
            ),
          ],
        ),
      ],
    ),
  );
}

// Dieses Widget baut einen Kreis um das Logo des Unternehmens in der Adresszeile auf
Widget buildAdressBox({required Widget child}) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors().darkGreen,
      ),
      padding: EdgeInsets.all(20),
      child: child,
    );

// ---------- DIVIDER ----------

// Dieses Widget baut einen horizontalen Divider auf
Widget buildHorizontalDivider() {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: Colors.black,
          height: 35,
        ),
      )
    ],
  );
}

// ---------- ENTFERNUNG ----------

// Dieses Widget baut den Text für die Entfernung auf
Widget buildDistanceText() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '10 km entfernt!',
          style: AppTextStyles.darkH1,
        )
      ],
    ),
  );
}

// ---------- BEWERBEN-BUTTON ----------

// Dieses Widget baut den Bewerben-Button auf
Widget buildApplyButton() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 20, 100, 50),
    child: ElevatedButton(
      onPressed: () {},
      child: Text("Bewerben"),
    ),
  );
}

// ---------- TITEL ----------

// Diese Klasse baut den Titel auf
Widget titleTextBuilder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          height: 100.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: new Center(
            child: new Text(
              job.title.toString(),
              style: AppTextStyles.darkH2,
            ),
          ),
        ),
      ),
    );
  }


// ---------- BILDER-KARUSSELL ----------

// Diese Klasse baut den Carousel-Slider auf
Widget carouselSliderBuilder() {

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: job.images!.slides!.map((slide) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 15.0),
              //decoration: BoxDecoration(color: Colors.blueGrey),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Image(
                        image: NetworkImage(slide.url.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }


// ---------- SKILL-BACKGROUND ----------

// Diese Klasse baut den Hintergrund der Fähigkeiten auf
Widget skillBackgroundBuilder(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors().darkGreen,
        child: buildSkillCards(),
      ),
    );
  }
}

// ---------- NAV-BAR ----------

// Diese Klasse baut die Bottom-Navigationbar auf
Widget navBarBuilder(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          if (value == 0)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const JobListSearchScreen()),
            );
          if (value == 1)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilLoader()),
            );
          //if (value == 2) Navigator.of(context).push(...);
        },
        backgroundColor: AppColors().darkGreen,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Suchen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ]);

}

// ---------- HOME-BUTTON ----------

// Diese Klasse baut den Home-Button auf
Widget homeButtonBuilder(BuildContext context) {

    return FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.home),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScreenHome()),
        );
      },
    );

}


