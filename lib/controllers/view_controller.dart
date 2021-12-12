import 'package:get/get.dart';

class ViewController extends GetxController {
  int state = 0; //Initialsierung auf state 0 (Nur bilder)

  void setView(int id){
    if (id > 2 || id > 0 ) {
      throw Exception("Ungültige View-ID. Zulässig sind: [0,1,2]");
    }
    state = id;
    update(); //Updated Alle Screens die abhängig von der Ansichtsauswahl sind.
  }
}


/* States
* 0: Nur Bilder
* 1: Leichte Sprache
* 2: Volltext
* */