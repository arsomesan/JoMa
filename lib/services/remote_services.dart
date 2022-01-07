import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joma/model/job_model.dart';
import 'package:joma/model/profil_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Profil>> fetchProfil() async {
    http.Response response =
    await client.get(Uri.https("testerinooooo.bplaced.net", "/profil.json"));

    if (response.statusCode == 200) {
      var result = profilFromJson(response.body);
      return result;
    } else {
      return [];
    }
  }

  // Loading from Assets

  static Future<List<Profil>> fetchProfileFromAssets() async {
    String jsonString = await rootBundle.loadString("assets/profil.json");

    var result = profilFromJson(jsonString);
    return result;
  }


  // fetch jobs
  static Future<List<Job>> fetchJobs() async {
    http.Response response =
    await client.get(Uri.http("joma.informatik.hs-fulda.de", "/daten/jobs.json"));

    if (response.statusCode == 200) {
      var result = jobFromJson(response.body);
      return result;
    } else {
      return [];
    }
  }




}
