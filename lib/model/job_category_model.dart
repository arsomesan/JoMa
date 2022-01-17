// To parse this JSON data, do
//
//     final jobCategory = jobCategoryFromJson(jsonString);

import 'dart:convert';

List<JobCategory> jobCategoryFromJson(String str) => List<JobCategory>.from(json.decode(utf8.decode(str.runes.toList())).map((x) => JobCategory.fromJson(x)));

String jobCategoryToJson(List<JobCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobCategory {
  JobCategory({
    this.id,
    this.title,
    this.colorHex,
    this.backgroundColorHex,
    this.jobOfTheWeek,
  });

  int? id;
  String? title;
  String? colorHex;
  String? backgroundColorHex;
  int? jobOfTheWeek;

  factory JobCategory.fromJson(Map<String, dynamic> json) => JobCategory(
    id: json["id"],
    title: json["title"],
    colorHex: json["colorHEX"]!.replaceAll("#", "0xFF"),
    backgroundColorHex: json["backgroundColorHEX"]!.replaceAll("#", "0xFF"),
    jobOfTheWeek: json["jobOfTheWeek"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "colorHEX": colorHex,
    "backgroundColorHEX": backgroundColorHex,
    "jobOfTheWeek": jobOfTheWeek,
  };
}