// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'dart:convert';

List<Job> jobFromJson(String str) => List<Job>.from(json.decode(utf8.decode(str.runes.toList())).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  Job({
    this.id,
    this.title,
    this.category,
    this.company,
    this.homepage,
    this.contactPerson,
    this.address,
    this.description,
    this.skills,
    this.isTraineeship,
  });

  int? id;
  String? title;
  String? category;
  String? company;
  String? homepage;
  ContactPerson? contactPerson;
  Address? address;
  String? description;
  List<String>? skills;
  bool? isTraineeship;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    title: json["title"],
    category: json["category"],
    company: json["company"],
    homepage: json["homepage"],
    contactPerson: ContactPerson.fromJson(json["contactPerson"]),
    address: Address.fromJson(json["address"]),
    description: json["description"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    isTraineeship: json["isTraineeship"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
    "company": company,
    "homepage": homepage,
    "contactPerson": contactPerson!.toJson(),
    "address": address!.toJson(),
    "description": description,
    "skills": List<dynamic>.from(skills!.map((x) => x)),
    "isTraineeship": isTraineeship,
  };
}

class Address {
  Address({
    this.street,
    this.zip,
    this.city,
  });

  String? street;
  String? zip;
  String? city;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    zip: json["zip"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "zip": zip,
    "city": city,
  };
}

class ContactPerson {
  ContactPerson({
    this.firstname,
    this.lastname,
    this.phone,
    this.role,
  });

  String? firstname;
  String? lastname;
  String? phone;
  String? role;

  factory ContactPerson.fromJson(Map<String, dynamic> json) => ContactPerson(
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone: json["phone"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "phone": phone,
    "role": role,
  };
}
