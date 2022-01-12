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
import 'package:joma/services/remote_services.dart';

import 'joblist_search_screen.dart';

class JobListTopicScreen extends StatelessWidget {
  JobListTopicScreen({Key? key}) : super(key: key);
  final DataController data = Get.find();
  final category = 0; // TODO: state / view control

  /* TODO: variables for alternative implementation (see below)
  late List<Job> jobList = data.jobs;
  late Job jobOfTheWeek =
  data.jobs.firstWhere((job) => job.id == data.getJobOfTheWeek());
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppBackgroundColors().darkBackground,
      appBar: AppBar(
        backgroundColor: AppBackgroundColors().darkBackground,
        title: Text('Soziales & Hauswirtschaft'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child:
                Obx(() {
                  var result = <Widget>[];
                  Job jobOfTheWeek =
                      data.jobs.firstWhere((job) => job.id == data.getJobOfTheWeek());

                  result.add(AppCardSpecial(
                      jobTitle: jobOfTheWeek.title.toString(),
                      jobDescription: jobOfTheWeek.description!.full.toString(),
                      color: AppColors().darkBlue,
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenJobDetails(jobID: data.getJobOfTheWeek(),))); } ));

                  result.add(const SizedBox(height: 10));

                  for (var currentJob in data.jobs) {
                    JobCategory currentJobCategory = data.jobCategories.firstWhere((category) => category.id == currentJob.category);

                    result.add(AppCard(
                        jobTitle: currentJob.title.toString(),
                        jobDescription: currentJob.description!.full.toString(),
                        color: Color(int.parse(currentJobCategory.colorHex.toString())), //AppColors().darkBlue,
                        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenJobDetails(jobID: currentJob.id,))); } ));
                  }
                  return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: result));
                }),
              ),


              /* TODO: this is an alternative implementation. Figure out which is better.
              Center(
                child: Column(
                  children: [
                    AppCardSpecial(
                        jobTitle: jobOfTheWeek.title.toString(),
                        jobDescription: jobOfTheWeek.description!.full.toString(),
                        color: AppColors().darkBlue,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenJobDetails(
                                        jobID: data.getJobOfTheWeek(),
                                      )));
                        }),
                    for (var currentJob in data.jobs)
                      AppCard(
                          jobTitle: currentJob.title.toString(),
                          jobDescription: currentJob.description!.full.toString(),
                          color: AppColors().darkBlue,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenJobDetails(
                                          jobID: currentJob.id,
                                        )));
                          }),
                  ],
                ),
              ))
              */


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