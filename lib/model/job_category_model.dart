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
    this.colorRGB,
  });

  int? id;
  String? title;
  String? colorRGB;

  factory JobCategory.fromJson(Map<String, dynamic> json) => JobCategory(
    id: json["id"],
    title: json["title"],
    colorRGB: json["colorRGB"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "colorRGB": colorRGB,
  };
}
