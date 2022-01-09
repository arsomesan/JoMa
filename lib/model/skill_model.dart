// To parse this JSON data, do
//
//     final skills = skillsFromJson(jsonString);

import 'dart:convert';

List<Skills> skillsFromJson(String str) => List<Skills>.from(json.decode(str).map((x) => Skills.fromJson(x)));

String skillsToJson(List<Skills> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Skills {
  Skills({
    this.id,
    this.icon,
    this.title,
  });

  String? id;
  String? icon;
  String? title;

  factory Skills.fromJson(Map<String, dynamic> json) => Skills(
    id: json["id"],
    icon: json["icon"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon": icon,
    "title": title,
  };
}
