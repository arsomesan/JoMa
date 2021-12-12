// Page-Imports
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil.dart';
import 'joblist_search_screen.dart';

// Material-Imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Element-Imports
import 'package:carousel_slider/carousel_slider.dart';

// Map-Imports
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// Asset-Imports
import 'package:joma/assets/assets.dart';


class ScreenJobDetails extends StatelessWidget {
  const ScreenJobDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder(),
        floatingActionButton: homeButtonBuilder(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: navBarBuilder(),
        body: ListView(
          children: [
            titleImageBuilder(),
            titleTextBuilder(),
            carouselSliderBuilder(),
            jobDescriptionBuilder(),
            skillBackgroundBuilder(),
            graduationBuilder(),
            mapBuilder(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(115, 30, 0, 0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    minRadius: 25,
                    maxRadius: 25,
                    child: Image(
                        image: AssetImage('assets/icons/google-brands.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                  child: Column(
                    children: [
                      Text("Hochschule Fulda",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                      Text("Leipziger Str. 123",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                      Text("36037 Fulda",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Bewerben"),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ));
  }

// ---------- APP-BAR ----------

  // Dieses Widget baut die App-Bar auf
  PreferredSizeWidget appBarBuilder() {
    return AppBar(
      backgroundColor: AppColors().green,
      title: Text(
        'Gärtnerei & Landwirtschaft',
        style: AppTextStyles.appBar,
      ),
      centerTitle: true,
    );
  }

// ---------- TITELBILD ----------

  Widget titleImageBuilder() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
    child: Image(
    image: NetworkImage(
    'https://www.rose-galabau.de/wp-content/uploads/2021/10/Rose-landschaftsbau-gruenflaechenpflege-gewerbliche-landschaftsgaertner-pflasterarbeiten.jp_.jpg',
    ),
    ),
    ),
    );
  }

// ---------- JOB-BESCHREIBUNG ----------

  Widget jobDescriptionBuilder() {
    return Padding(
      padding: EdgeInsets.fromLTRB(44, 10, 44, 0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
          style: AppTextStyles.mainText,
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
          Expanded(child: buildSkill()),
          Expanded(child: buildSkill()),
          Expanded(child: buildSkill()),
          Expanded(child: buildSkill()),
        ],
      ),
    );
  }

  // Dieses Widget baut eine einzelne Fähigkeit auf
  Widget buildSkill() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildBox(child: Icon(Icons.build)),
      const SizedBox(height: 5),
      Text(
        'Fähigkeit',
        style: AppTextStyles.mainText,
      )
    ],
  );

  // Dieses Widget baut einen Kreis als Hintergrund um das Fähigkeits-Icon auf
  Widget buildBox({required Widget child}) =>
      Container(
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
              buildSchoolBox(child:
              Icon(Icons.school, size: 50)),
              const SizedBox(height: 10),
              Text(
                'Hauptschulabschluss',
                style: AppTextStyles.graduationText,
              )
            ],
          ),
        ],
      ),
    );
  }

  // Dieses Widget baut einen Kreis als Hintergrund um das Schulabschluss-Icon auf
  Widget buildSchoolBox({required Widget child}) =>
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors().green,
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

}

// ---------- TITEL ----------

// Diese Klasse baut den Titel auf
class titleTextBuilder extends StatelessWidget {
  const titleTextBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: new Center(
            child: new Text(
              "Pflege der Grünflächen",
              style: AppTextStyles.titleText,
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- BILDER-KARUSSELL ----------

// Diese Klasse baut den Carousel-Slider auf
class carouselSliderBuilder extends StatelessWidget {
  const carouselSliderBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        enlargeCenterPage: true,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 15.0),
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        'Tätigkeit $i',
                        style: AppTextStyles.imageText,
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
}

// ---------- SKILL-BACKGROUND ----------

// Diese Klasse baut den Hintergrund der Fähigkeiten auf
class skillBackgroundBuilder extends StatelessWidget {
  const skillBackgroundBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors().green,
        child: ScreenJobDetails().buildSkillCards(),
      ),
    );
  }
}

// ---------- NAV-BAR ----------

// Diese Klasse baut die Bottom-Navigationbar auf
class navBarBuilder extends StatelessWidget {
  const navBarBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
              MaterialPageRoute(builder: (context) => const ScreenProfil()),
            );
          //if (value == 2) Navigator.of(context).push(...);
        },
        backgroundColor: AppColors().green,
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
}

// ---------- HOME-BUTTON ----------

// Diese Klasse baut den Home-Button auf
class homeButtonBuilder extends StatelessWidget {
  const homeButtonBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.home),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
    );
  }
}