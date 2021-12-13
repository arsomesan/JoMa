import 'package:get/get.dart';

class ViewController extends GetxController {
  int state = 0; //Initialsierung auf state 0 (Nur bilder)

  void setView(int id){
    if (id > 2 || id < 0 ) {
      throw Exception("Ungültige View-ID. Zulässig sind: [0,1,2]");
    }
    state = id;
    update(); //Updated Alle Screens die abhängig von der Ansichtsauswahl sind.
  }
}


/* States Info.
* 0: Nur Bilder
* 1: Leichte Sprache
* 2: Volltext
*
*
* Um den Controller zu nutzen, muss dieser erst in das gewünschte Widget hinzugefügt werden.
* final ViewController viewController = Get.put(ViewController()); -> In die erste Zeile nach dem definieren der Klasse
*
* ggf. müsst ihr noch euren Konstruktor anpassen.(Das const entfernen.)
* * Nach dem anpassen des Konstruktors müssen dann noch die MaterialPageRoutes auf den anderen Seiten angepasst werden. (das const entfernen. bekommt ihr aber angezeigt)
*
* Die Komponenten, welche auf den Controller zugreifen sollen, müssen in einem GetBuilder Widget liegen: (Hier mal ein einfacher Text.)
*
* GetBuilder<ViewController>(builder: (_){
*   return Text("Der aktuelle State ist ${_.state}");
* },),
*
* In diesem Builder Widget, lässt sich der aktuelle State mit: 'viewController.state' oder '_.state' einsehen.
*
* Es sollte zwar nicht relevant sein, aber der Aktuelle State lässt sich dann z.B. mit einem GestureDetector und folgender Methode ändern:
*
* GestureDetector(
*   onTap: () { viewController.setView(1); },
*   child: Card(...)
* ),
*
* */

