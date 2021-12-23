import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:joma/controllers/profil_controller.dart';
import 'package:joma/model/profil_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;

  static const _keyName = "profil";
  static const _keyEmail = "mail";
  static const _keyTelefon = "123";
  static const _keyAdresse = "fill";
  static const _keyStadt = "city";
  static const _keyPicture = "kek";

/*
  static void setVars(int i) async {
    final ProfilController controller = Get.put(ProfilController());
    Profil profil = controller.profil[i];
    var name = profil.vorname! + " " + profil.name!;
    var email = profil.kontakt?.email ?? "mah";
    var tel = profil.kontakt?.tel ?? "test";
    var strasse = profil.adresse?.strasse ?? "test";
    var ort = profil.adresse?.ort ?? "test";
    var plz = profil.adresse?.plz ?? "test";
    var hausnummer = profil.adresse?.hausnummer ?? "test";
    var adresse = strasse + " " + hausnummer;
    var stadt = plz + " " + ort;
    var bild = profil.bild ?? "test";

    _preferences.setString(_keyName, name);
    _preferences.setString(_keyEmail, email);
    _preferences.setString(_keyTelefon, tel);
    _preferences.setString(_keyAdresse, adresse);
    _preferences.setString(_keyStadt, stadt);
    _preferences.setString(_keyPicture, bild);
  }
*/



  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
     //setVars(0);
  }

  static Future setName(String name) async =>
    await _preferences.setString(_keyName, name);

  static Future setEmail(String email) async =>
    await _preferences.setString(_keyEmail, email);

  static Future setTelefon(String telefon) async =>
      await _preferences.setString(_keyTelefon, telefon);

  static Future setAdresse(String adresse) async =>
      await _preferences.setString(_keyAdresse, adresse);

  static Future setStadt(String stadt) async =>
      await _preferences.setString(_keyStadt, stadt);

  static Future setPicture(String pictureurl) async =>
      await _preferences.setString(_keyPicture, pictureurl);

  static String? getName() => _preferences.getString(_keyName);
  static String? getEmail() => _preferences.getString(_keyEmail);
  static String? getTelefon() => _preferences.getString(_keyTelefon);
  static String? getAdresse() => _preferences.getString(_keyAdresse);
  static String? getStadt() => _preferences.getString(_keyStadt);
  static String? getPicture() => _preferences.getString(_keyPicture);

  static Future setProfil(Profil profil) async {
    final json = profil.toJson();

  }

}