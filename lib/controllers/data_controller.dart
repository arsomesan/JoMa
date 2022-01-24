import 'package:get/get.dart';
import 'package:joma/model/job_category_model.dart';
import 'package:joma/model/job_model.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/model/skill_model.dart';
import 'package:joma/services/remote_services.dart';

class DataController extends GetxController {

  var profile = List<Profil>.empty().obs;
  var jobs = List<Job>.empty().obs;
  var jobCategories = List<JobCategory>.empty().obs;
  var skills = List<Skill>.empty().obs;

  RxList<bool> boolList = List<bool>.empty().obs;
  RxList<bool> jobList = List<bool>.empty().obs;


  @override
  void onInit() {
    fetchJobs();
    fetchJobCategories();
    fetchSkills();
    fetchProfile();
    super.onInit();

  }

  void fetchProfile() async {
    var profile = await RemoteServices.fetchProfil();
    this.profile.value = profile;
  }

  void fetchJobs() async {
    var jobs = await RemoteServices.fetchJobs();
    this.jobs.value = jobs;
    this.jobList =
        List.filled(jobs.length, false, growable: false).obs;
  }

  void fetchJobCategories() async {
    var jobCategories = await RemoteServices.fetchJobCategories();
    this.jobCategories.value = jobCategories;
  }

  void fetchSkills() async {
    var skills = await RemoteServices.fetchSkills();
    this.skills.value = skills;
  }
}