import 'package:get/get.dart';
import 'package:joma/model/job_model.dart';
import 'package:joma/services/remote_services.dart';

class JobsController extends GetxController {

  var jobList = List<Job>.empty().obs;

  @override
  void onInit() {
    fetchJobs();
    super.onInit();
  }

  void fetchJobs() async {
    var jobs = await RemoteServices.fetchJobs();
    jobList.value = jobs;
  }

}