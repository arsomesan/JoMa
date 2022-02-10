// Page-Imports


import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/materials/appbar_job.dart';
import 'package:joma/materials/navbar.dart';
import 'package:joma/model/job_category_model.dart';
import 'package:joma/model/job_model.dart';
import 'package:joma/model/profil_model.dart';

import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/pdf_viewer.dart';
import 'package:joma/utils/user_simple_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screen_joblist_search.dart';
import 'package:geocoding/geocoding.dart';

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



class ScreenJobDetails extends StatefulWidget {
  final int? jobID;

  const ScreenJobDetails({Key? key, required this.jobID}) : super(key: key);

  @override
  State<ScreenJobDetails> createState() => _ScreenJobDetailsState();
}

class _ScreenJobDetailsState extends State<ScreenJobDetails> {
  final _pics = [
    "assets/icons/hammer-solid.svg",
    "assets/icons/tractor-solid.svg",
    "assets/icons/hands-helping-solid.svg",
    "assets/icons/hamburger-solid.svg"
  ];

  @override
  void initState() {
    getCoords();
    super.initState();
  }

  final DataController data = Get.find();

  late Job job = data.jobs.elementAt(widget.jobID!);

  late JobCategory currentJobCategory =
      data.jobCategories.firstWhere((category) => category.id == job.category);

  late Color currentColor = Color(int.parse(data.jobCategories
      .elementAt(currentJobCategory.id as int)
      .colorHex
      .toString()));

  late Color currentBackgroundColor = Color(int.parse(data.jobCategories
      .elementAt(currentJobCategory.id as int)
      .backgroundColorHex
      .toString()));

  List<double> userCoords = [0, 0];
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    Profil user = tmpUser[0]; //Wird nicht genutzt ? Warum ? @Adrian ?
    bool savedData = data.jobList[widget.jobID!];
    selected = !savedData;

    data.setCurrentJob(widget.jobID as int);

    return Scaffold(
        backgroundColor: AppColors().white,
        appBar: AppBarJobArea(
          blocked: 0,
          bgColor: AppColors().white,
          bgColorBar: currentColor,
          circleColor: currentColor,
          color: currentColor,
          title: currentJobCategory.title.toString().toUpperCase(),
          hoehe: 230,
          imageUrl: _pics[currentJobCategory.id as int],
          onPressed1: () {
            Navigator.of(context).pop();
          },
        ),
        floatingActionButton: SizedBox(
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
          backgroundColor: currentColor,
          selectedItemColor: AppColors().white,
          unselectedItemColor: AppColors().white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: ListView(
          children: [
            //titleImageBuilder(job),
            titleTextBuilder(context),
            bookmarkBuilder(tmpUser),
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
                onPressed: () async {
                  //save jobs with sent application in data structure
                  data.applicationJobList[widget.jobID!] = true;
                  //save data structure in shared preferences profile
                  saveApplicationJobState(data.applicationJobList, tmpUser);
                  //route to pdfviewer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PDFViewer()));
                }),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ));
  }



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

  Widget jobDescriptionBuilder() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(44, 10, 44, 0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          job.description!.full.toString(),
          style: AppTextStyles.darkMainText,
        ),
      ),
    );
  }

  Widget buildSkillCards() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < job.skills!.length; i++)
            Expanded(
                child: buildSkill(data.skills
                    .indexWhere((skill) => skill.id == job.skills![i]))),
        ],
      ),
    );
  }

  Widget buildSkill(int skillID) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildBox(
              child: Icon(IconDataSolid(
                  int.parse("0x" + data.skills[skillID].icon.toString())))),
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              data.skills.elementAt(skillID).title.toString(),
              style: AppTextStyles.darkMainText,
              textAlign: TextAlign.center,
            ),
          )
        ],
      );

  Widget buildBox({required Widget child}) => Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(7),
        child: child,
      );

  Widget graduationBuilder() {
    if (job.requiredGraduation == "") {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSchoolBox(child: const Icon(Icons.school, size: 50)),
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
  }

  Widget buildSchoolBox({required Widget child}) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentBackgroundColor,
        ),
        padding: const EdgeInsets.all(15),
        child: child,
      );

  Widget mapBuilder() {
    void _launchURL(lat, long) async {
      String _mapUrl = "http://www.google.com/maps/place/$lat,$long";
      if (!await launch(_mapUrl)) throw 'Could not launch $_mapUrl';
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 300,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: FlutterMap(
              options: MapOptions(
                onTap: (tapPosition, point) {
                  _launchURL(job.coords!.lat!, job.coords!.long!);
                },
                center: LatLng(double.parse(job.coords!.lat!),
                    double.parse(job.coords!.long!)),
                zoom: 16.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://a.tile.openstreetmap.de/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(double.parse(job.coords!.lat!),
                          double.parse(job.coords!.long!)),
                      builder: (ctx) => const Icon(FontAwesomeIcons.mapPin,
                          color: Colors.red),
                    ),
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(userCoords[0], userCoords[1]),
                      builder: (ctx) =>
                          const Icon(FontAwesomeIcons.home, color: Colors.red),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

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
                job.address!.zip.toString() +
                    ' ' +
                    job.address!.city.toString(),
                style: AppTextStyles.darkMainText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAdressBox({required Widget child}) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentBackgroundColor,
        ),
        padding: const EdgeInsets.all(20),
        child: child,
      );

  Widget buildHorizontalDivider() {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            color: Colors.black,
            height: 35,
          ),
        )
      ],
    );
  }

  void getCoords() async {
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    //profile to use
    Profil user = tmpUser[0];
    String adresse = user.adresse!.strasse! +
        " " +
        user.adresse!.hausnummer! +
        ", " +
        user.adresse!.ort!;
    List<double> userPlace = [0, 0];
    if (kIsWeb) {
      userPlace = [50.5550540, 9.6588151];
    } else {
      List<Location> locations = await locationFromAddress(adresse);
      Location place = locations[0];
      userPlace = [place.latitude, place.longitude];
    }
    setState(() {
      userCoords = userPlace;
    });
  }

  Widget buildDistanceText() {
    LatLng userCoord = LatLng(userCoords[0], userCoords[1]);
    LatLng antoniusCoords = LatLng(50.5550540,
        9.6588151); //Was ist das und warum wird es nicht genutzt ? Kann das weg ? @Elian
    LatLng jobCoords =
        LatLng(double.parse(job.coords!.lat!), double.parse(job.coords!.long!));
    Distance dist = const Distance();

    double jobDist = 0;
    jobDist = dist.as(LengthUnit.Kilometer, userCoord, jobCoords);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$jobDist Kilometer entfernt!',
            style: AppTextStyles.darkH1,
          )
        ],
      ),
    );
  }

  Widget buildApplyButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 20, 100, 50),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Bewerben"),
      ),
    );
  }

  Widget titleTextBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          height: 45.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColors().white,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Center(
            child: Text(
              job.title.toString(),
              style: AppTextStyles.darkH2,
            ),
          ),
        ),
      ),
    );
  }

  Widget bookmarkBuilder(List<Profil> tmpUser) {
    return IconButton(
      onPressed: () {
        setState(() {
          data.jobList[widget.jobID!] = selected;
          saveJobState(data.jobList, tmpUser);
        });
        if (selected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Der Job wurde erfolgreich gespeichert.'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: currentColor,
              action: SnackBarAction(
                label: 'Schließen',
                textColor: AppColors().white,
                onPressed: () {},
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                  'Der Job wurde aus deinen gespeicherten Jobs entfernt.'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: currentColor,
              action: SnackBarAction(
                label: 'Schließen',
                textColor: AppColors().white,
                onPressed: () {},
              ),
            ),
          );
        }
      },
      icon: FaIcon(selected
          ? FontAwesomeIcons.bookmark
          : FontAwesomeIcons.solidBookmark),
      color: currentColor,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
    );
  }

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
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
              margin:
                  const EdgeInsets.symmetric(horizontal: 3.0, vertical: 15.0),
              decoration: BoxDecoration(color: currentBackgroundColor),
              child: Image(
                image: NetworkImage(slide.url.toString()),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget skillBackgroundBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: currentBackgroundColor,
        child: buildSkillCards(),
      ),
    );
  }

  Widget navBarBuilder(BuildContext context) {
    return AppNavBar(
      backgroundColor: AppColors().darkPrimaryColor,
      selectedItemColor: AppBackgroundColors().darkBackground,
      unselectedItemColor: AppBackgroundColors().darkBackground,
    );
  }

  Widget homeButtonBuilder(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      child: const Icon(Icons.home),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScreenHome()),
        );
      },
    );
  }
}

void saveJobState(RxList<bool> list, List<Profil> tmpUser) {
  int count = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i] == true) count++;
  }

  var savedList = List.filled(count, 0, growable: false);
  int before = -1;
  for (int i = 0; i < savedList.length; i++) {
    for (int l = 0; l < list.length; l++) {
      if (list[l] == true && l > before) {
        savedList[i] = l;
        before = l;
        break;
      }
    }
  }
  tmpUser[0].savedJobs = savedList;
  var lokalusersavetmp = profilToJson(tmpUser);
  UserSimplePreferences.setUser(lokalusersavetmp.toString());
}

void saveApplicationJobState(RxList<bool> list, List<Profil> tmpUser) {
  int count = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i] == true) count++;
  }

  var savedList = List.filled(count, 0, growable: false);
  int before = -1;
  for (int i = 0; i < savedList.length; i++) {
    for (int l = 0; l < list.length; l++) {
      if (list[l] == true && l > before) {
        savedList[i] = l;
        before = l;
        break;
      }
    }
  }
  tmpUser[0].sentApplications = savedList;
  var lokalusersavetmp = profilToJson(tmpUser);
  UserSimplePreferences.setUser(lokalusersavetmp.toString());
}
