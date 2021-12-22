import 'package:get/get.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/services/remote_services.dart';


class ProfilController extends GetxController {

  var profil = List<Profil>.empty().obs;

  @override
  void onInit() {
    fetchProfilfromassets();
    super.onInit();
  }

  void fetchProfilfromassets() async {
    var pro = await RemoteServices.fetchProfileFromAssets();
    profil.value = pro;
  }

  void fetchProfil() async {
    var pro = await RemoteServices.fetchProfil();
    profil.value = pro;
  }
}