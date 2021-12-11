# JoMa

JoMa - Jobs maßgeschneidert -------
DNS Name: joma.informatik.hs-fulda.de -------
IP Webserver: 193.174.29.16 -------


## Überblick

Hallo! Wir sind ein junges Team, bestehend aus 15 Digitale Medien Studenten, das in Begleitung mit Prof. Jan-Torsten Milde und in Kooperation mit Startbahn/Perspektiva Fulda eine Jobbörsen-App, zugeschnitten auf die Schüler des Antoniusheims Fulda, entwickelt.
Ziel ist es, bis Ende des Wintersemester 2021/22 eine funktionierende App für unsere Kooperationspartner aufgestellt zu haben.
Dabei wird asynchron von Zuhause aus über Github & Discord gearbeitet und jeden Montag im Seminar der aktuelle Stand präsentiert.

Die App soll alle Jobangebote aus der Region, eingestellt von den jeweiligen Unternehmen, die barrierefrei für Menschen mit geistigen/körperlichen Einschränkungen sind, beinhalten. Dabei können die Schüler sowohl alle Angebote, als auch nach ihren bereits aus der Schule bekannten vier Kategorien einsehen. Ein Wahl-O-Mat soll bereits zu Beginn durch die Erfassung der Fähigkeiten und Interessen Jobs entsprechend filtern. Um den Bewerbungsprozess möglichst einfach zu halten, soll die App eine entsprechende Bewerbung im PDF-Format generieren und diese automatisiert an das jeweilige Unternehmen per E-Mail zusenden. Um möglichst barrierefrei zu bleiben, kann die App in drei verschiedenen Text- und Bildumfangsmodi benutzt werden. Im Profil werden die personenbezogenen, für eine Bewerbung relevanten Daten erhoben.

Wir sind ergeizig an der Sache dran und hoffen, mit dieser App Menschen mit besonderen Herausforderungen einen erleichterten Zugang in die Berufswelt zu verschaffen!

## Mögliche Elemente/Erweiterungen aus dem Technologieprototypen

- Datenmodell
    - modelliert in JSON
- Statemanagement (get)
- Lokale Daten (und auch remote mit http)
- Animationen (rive)
- Sprachausgabe (flutter_tts)
- Audioausgabe (just_audio)
- Videoausgabe (youtube_player_iframe)
- Spaltenbasierte Liste (flutter_staggered_grid_view )
- Fonts (google_fonts)
- Multimodales Widget (einfache Version mit Stack)
- OpenStreetMap eingebaut (flutter_map)
    - jetzt auch mit Suche über https://nominatim.openstreetmap.org/
    - Home eingebaut

## Dependencies
- cupertino_icons: ^1.0.2
- get: ^4.5.1
- carousel_slider: ^4.0.0
- latlong2: ^0.8.0
- latlng: any
- animated_splash_screen: ^1.1.0
- json_annotation: ^4.3.0

## Assets
- assets/
- assets/fonts/
- assets/icons/
- assets/images/
- assets/users.json

## Fonts
Raleway
  
# Tools
- https://app.quicktype.io/
- https://rive.app/
- https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html
- https://icon.kitchen/


# Was fehlt noch:

- lokales Speichern (shared_preferences)
