import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/card.dart';
import 'package:joma/model/job_category_model.dart';
import 'package:joma/model/job_model.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_job_details.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:joma/services/remote_services.dart';
import 'package:joma/materials/search_widget.dart';

final DataController data = Get.find();
String query = '';
var searchResult = <Job>[];

late int categoryID;
late Color currentColor = Color(
    int.parse(data.jobCategories.elementAt(categoryID).colorHex.toString()));


class ScreenJobListSearch extends StatefulWidget {
  @override
  ScreenJobListSearchState createState() => ScreenJobListSearchState();
}

class ScreenJobListSearchState extends State<ScreenJobListSearch> {
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  Future init() async {
    setState(()=> searchJob(query));
  }
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppBackgroundColors().darkBackground,
        appBar: AppBar(
          backgroundColor: AppColors().darkPrimaryColor,
          title: Text('Alle Jobs'.toUpperCase(), style: AppTextStyles.darkH1),
          centerTitle: true,
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
              buildSearch(),
              generateJobCards(context),
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
      ),
    );
  }


  Widget generateJobCards(context) {
    var jobCards = <Widget>[];
    int i = 0;
    for (var currentJob in searchResult) {
      jobCards.add(AppCardSearch(
          jobTitle: currentJob.title.toString(),
          jobDescription: currentJob.description!.full.toString(),
          color: Color(int.parse(data.jobCategories
              .elementAt((searchResult
              .elementAt(i)
              .category)!.toInt())
              .colorHex
              .toString())),
          //AppColors().darkBlue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ScreenJobDetails(
                          jobID: currentJob.id,
                        )));
          }));
      i++;
    }
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: jobCards),
    );
  }

/*
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
*/
  Widget buildSearch() =>
      SearchWidget(
        text: query,
        hintText: 'Was suchst du?',
        onChanged: searchJob,
      );

  void searchJob(String query) {
    final queryLower = query.toLowerCase();
    var result = <Job>[];
    for (int currentJob = 0; currentJob < data.jobs.length; currentJob++) {
      final jobLower = data.jobs
          .elementAt(currentJob)
          .title
          .toString()
          .toLowerCase();

      if (jobLower.contains(queryLower)) {
        result.add(data.jobs.elementAt(currentJob));

      }
    }
    setState(() {
      searchResult = result;
    });


  }
}

