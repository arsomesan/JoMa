import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/controllers/profil_controller.dart';
import 'package:joma/model/profil_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;

  //saving whole profile in one string
  static const _user = "test";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
  }

  static Future setUser(String userdata) async =>
      await _preferences.setString(_user, userdata);

  static String? getUser() => _preferences.getString(_user);

}