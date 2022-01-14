import 'dart:convert';

List<Profil> profilFromJson(String str) => List<Profil>.from(json.decode(utf8.decode(str.runes.toList())).map((x) => Profil.fromJson(x)));
String profilToJson(List<Profil> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profil {
  Profil({
    this.name,
    this.vorname,
    this.login,
    this.password,
    this.bild,
    this.adresse,
    this.kontakt,
    this.zugriff,
    this.skills,
  });

  String? name;
  String? vorname;
  String? login;
  String? password;
  String? bild;
  Adresse? adresse;
  Kontakt? kontakt;
  Zugriff? zugriff;
  List<int>? skills;

  factory Profil.fromJson(Map<String, dynamic> json) => Profil(
    name: json["name"],
    vorname: json["vorname"],
    login: json["login"],
    password: json["password"],
    bild: json["bild"],
    adresse: Adresse.fromJson(json["adresse"]),
    kontakt: Kontakt.fromJson(json["kontakt"]),
    zugriff: Zugriff.fromJson(json["zugriff"]),
    skills: List<int>.from(json["skills"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "vorname": vorname,
    "login": login,
    "password": password,
    "bild": bild,
    "adresse": adresse!.toJson(),
    "kontakt": kontakt!.toJson(),
    "zugriff": zugriff!.toJson(),
    "skills": List<dynamic>.from(skills!.map((x) => x)),
  };
}

class Adresse {
  Adresse({
    this.ort,
    this.plz,
    this.strasse,
    this.hausnummer,
  });

  String? ort;
  String? plz;
  String? strasse;
  String? hausnummer;

  factory Adresse.fromJson(Map<String, dynamic> json) => Adresse(
    ort: json["ort"],
    plz: json["plz"],
    strasse: json["strasse"],
    hausnummer: json["hausnummer"],
  );

  Map<String, dynamic> toJson() => {
    "ort": ort,
    "plz": plz,
    "strasse": strasse,
    "hausnummer": hausnummer,
  };
}

class Kontakt {
  Kontakt({
    this.email,
    this.tel,
    this.web,
  });

  String? email;
  String? tel;
  String? web;

  factory Kontakt.fromJson(Map<String, dynamic> json) => Kontakt(
    email: json["email"],
    tel: json["tel"],
    web: json["web"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "tel": tel,
    "web": web,
  };
}

class Zugriff {
  Zugriff({
    this.datum,
  });

  DateTime? datum;

  factory Zugriff.fromJson(Map<String, dynamic> json) => Zugriff(
    datum: DateTime.parse(json["datum"]),
  );

  Map<String, dynamic> toJson() => {
    "datum": "${datum!.year.toString().padLeft(4, '0')}-${datum!.month.toString().padLeft(2, '0')}-${datum!.day.toString().padLeft(2, '0')}",
  };
}
