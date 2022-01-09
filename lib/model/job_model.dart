// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'dart:convert';

List<Job> jobFromJson(String str) =>
    List<Job>.from(json.decode(utf8.decode(str.runes.toList())).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  Job({
    this.id,
    this.category,
    this.insertionDate,
    this.type,
    this.title,
    this.company,
    this.homepage,
    this.contactPerson,
    this.address,
    this.coords,
    this.description,
    this.skills,
    this.requiredGraduation,
    this.images,
  });

  int? id;
  int? category;
  DateTime? insertionDate;
  String? type;
  String? title;
  String? company;
  String? homepage;
  ContactPerson? contactPerson;
  Address? address;
  Coords? coords;
  String? description;
  List<int>? skills;
  String? requiredGraduation;
  Images? images;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        category: json["category"],
        insertionDate: DateTime.parse(json["insertionDate"]),
        type: json["type"],
        title: json["title"],
        company: json["company"],
        homepage: json["homepage"],
        contactPerson: ContactPerson.fromJson(json["contactPerson"]),
        address: Address.fromJson(json["address"]),
        coords: Coords.fromJson(json["coords"]),
        description: json["description"],
        skills: List<int>.from(json["skills"].map((x) => x)),
        requiredGraduation: json["requiredGraduation"],
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "insertionDate": insertionDate!.toIso8601String(),
        "type": type,
        "title": title,
        "company": company,
        "homepage": homepage,
        "contactPerson": contactPerson!.toJson(),
        "address": address!.toJson(),
        "coords": coords!.toJson(),
        "description": description,
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "requiredGraduation": requiredGraduation,
        "images": images!.toJson(),
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

class Coords {
  Coords({
    this.long,
    this.lat,
  });

  String? long;
  String? lat;

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        long: json["long"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "long": long,
        "lat": lat,
      };
}

class Images {
  Images({
    this.banner,
    this.slides,
  });

  String? banner;
  List<Slides>? slides;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    banner: json["banner"],
    slides: List<Slides>.from(json["slides"].map((x) => Slides.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banner": banner,
    "slides": List<dynamic>.from(slides!.map((x) => x.toJson())),
  };
}

class Slides {
  Slides({
    this.url,
    this.description,
  });

  String? url;
  String? description;

  factory Slides.fromJson(Map<String, dynamic> json) => Slides(
    url: json["url"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "description": description,
  };
}