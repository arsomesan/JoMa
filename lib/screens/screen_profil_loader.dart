import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/global/glovar.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/joblist_search_screen.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_settings_loader.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:joma/services/remote_services.dart';
import 'package:joma/utils/user_simple_preferences.dart';

class ProfilLoader extends StatefulWidget {
  const ProfilLoader({Key? key}) : super(key: key);

  @override
  _ProfilLoaderState createState() => _ProfilLoaderState();
}



class _ProfilLoaderState extends State<ProfilLoader> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Profil>>(
          future: RemoteServices.fetchProfil(),

          builder: (BuildContext context,
              AsyncSnapshot<List<Profil>> snapshot) {
            if (snapshot.hasData) {
              return profile(snapshot.data);
            } else if (snapshot.hasError) {
              //hier bitte Fehler behandeln
            } else {}
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }
}


Widget profile(List<Profil>? profil) {

  Profil profilUsing = profil![2];

  var profilname = profilUsing.vorname! + " " + profilUsing.name!;
  var profilstadt = profilUsing.adresse!.plz! +  " " + profilUsing.adresse!.ort!;
  var profilemail = profilUsing.kontakt!.email;
  var profiltel = profilUsing.kontakt!.tel;
  var profiladresse = profilUsing.adresse!.strasse! + " " + profilUsing.adresse!.hausnummer!;
  var profilbild = profilUsing.bild;

  var name = (UserSimplePreferences.getName()) ?? profilname;
  var email = (UserSimplePreferences.getEmail()) ?? profilemail;
  var tel = (UserSimplePreferences.getTelefon()) ?? profiltel;
  var adresse = (UserSimplePreferences.getAdresse()) ?? profiladresse;
  var stadt = (UserSimplePreferences.getStadt()) ?? profilstadt;
  var bild = (UserSimplePreferences.getPicture()) ?? profilbild;
  return Scaffold(
    appBar: AppBar(
        title: Text("Profil"),
        centerTitle: true,
        backgroundColor: Glovar.white,
        foregroundColor: Glovar.blackvar,
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Get.to(Einstellungen());
              }),
        ]),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(top: 25.0),
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        bild!),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Glovar.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(color: Glovar.blackvar),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'E-Mail',
                      style: TextStyle(color: Glovar.blackvar),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      email!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Telefon',
                      style: TextStyle(color: Glovar.blackvar),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      tel!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Adresse',
                      style: TextStyle(color: Glovar.blackvar),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      adresse,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Stadt',
                      style: TextStyle(color: Glovar.blackvar),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      stadt,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Stärken',
                      style: TextStyle(color: Glovar.blackvar),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                            child: InputChip(
                                label: const Text('Belastbarkeit'),
                                labelStyle: TextStyle(color: Glovar.white),
                                backgroundColor: Glovar.red,
                                onPressed: () {
                                  print('I am the one thing in life.');
                                })),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: InputChip(
                                label: const Text('Teamfähigkeit'),
                                labelStyle: TextStyle(color: Glovar.white),
                                backgroundColor: Glovar.blue,
                                onPressed: () {
                                  print('I am the one thing in life.');
                                })),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: InputChip(
                                label: const Text('Offenheit'),
                                labelStyle: TextStyle(color: Glovar.white),
                                backgroundColor: Glovar.green,
                                onPressed: () {
                                  print('I am the one thing in life.');
                                })),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                            child: InputChip(
                                label: const Text('Engagement'),
                                labelStyle: TextStyle(color: Glovar.white),
                                backgroundColor: Glovar.purple,
                                onPressed: () {
                                  print('I am the one thing in life.');
                                })),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: InputChip(
                                label: const Text('Geduld'),
                                labelStyle: TextStyle(color: Glovar.white),
                                backgroundColor: Glovar.orange,
                                onPressed: () {
                                  print('I am the one thing in life.');
                                })),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: Container(
                width: 140,
                height: 35,
                margin: EdgeInsets.only(top: 35, bottom: 50),
                child: TextButton(
                  child: Text('Profil bearbeiten'),
                  onPressed: () {
                    Get.off(() => ProfilSettingsLoader());
                    /*
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ScreenProfilSettings()),
                    );
                     */
                  },
                  style: TextButton.styleFrom(
                    primary: Glovar.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Glovar.grey,

                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 35,
            child: Center(
              child: Container(
                child: TextButton(
                  child: Text('Impressum'),
                  onPressed: () {
                    // Button linking to the impress page
                  },
                  style: TextButton.styleFrom(
                    primary: Glovar.greylight,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            margin: EdgeInsets.only(bottom: 60),
            child: Center(
              child: Container(
                child: TextButton(
                  child: Text('Datenschutz'),
                  onPressed: () {
                    // Button linking to the impress page
                  },
                  style: TextButton.styleFrom(
                    primary: Glovar.greylight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.home),
      onPressed: () {
        Get.off(() => ScreenHome());
      },
    ),
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (value) {
          if (value == 0) Get.off(() => JobListSearchScreen());
          //if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilLoader()),
          //);
          //if (value == 2) Navigator.of(context).push(...);
        },
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Suchen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ]
    ),
    floatingActionButtonLocation:
    FloatingActionButtonLocation.centerDocked,
  );
}