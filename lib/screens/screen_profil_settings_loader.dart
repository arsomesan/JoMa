import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/global/glovar.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/services/remote_services.dart';
import 'package:joma/utils/user_simple_preferences.dart';

import 'joblist_search_screen.dart';

class ProfilSettingsLoader extends StatefulWidget {
  const ProfilSettingsLoader({Key? key}) : super(key: key);

  @override
  _ProfilSettingsLoaderState createState() => _ProfilSettingsLoaderState();
}



class _ProfilSettingsLoaderState extends State<ProfilSettingsLoader> {

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
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
      ),
    );
  }
}



Widget profile(List<Profil>? profil) {


  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final TelController = TextEditingController();
  final AdressController = TextEditingController();
  final StadtController = TextEditingController();

  bool nameCheck = false;
  bool emailCheck = false;
  bool telCheck = false;
  bool adressCheck= false;
  bool stadtCheck= false;

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
        title: Text("Profil bearbeiten"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(() => ProfilLoader());
          },
        ),
        backgroundColor: Glovar.white,
        foregroundColor: Glovar.blackvar,
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Button linking to settings page
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
            child: Center(
              child: Container(
                width: 120,
                height: 35,
                margin: EdgeInsets.only(top: 10, bottom: 30),
                child: TextButton(
                  child: Text('Avatar ändern'),
                  onPressed: () {
                    // Button to change the profile picture
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
            margin: EdgeInsets.only(left: 20),
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
                    margin: EdgeInsets.only(right: 20),
                    child: TextFormField(
                        controller: NameController,
                        onChanged: (text) {
                          nameCheck = true;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: name,
                        )
                    )
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
                    margin: EdgeInsets.only(right: 20),
                    child: TextFormField(
                        controller: EmailController,
                        onChanged: (text) {
                          emailCheck = true;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: email,
                        )
                    )
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
                    margin: EdgeInsets.only(right: 20),
                    child: TextFormField(
                        controller: TelController,
                        onChanged: (text) {
                          telCheck = true;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: tel,
                        )
                    )
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
                    margin: EdgeInsets.only(right: 20),
                    child: TextFormField(
                        controller: AdressController,
                        onChanged: (text) {
                          adressCheck = true;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: adresse,
                        )
                    )
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
                    margin: EdgeInsets.only(right: 20),
                    child: TextFormField(
                        controller: StadtController,
                        onChanged: (text) {
                          stadtCheck = true;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: stadt,
                        )
                    )
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
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  // Button linking to settings page
                                })
                        ),
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
                  child: Text('Speichern'),
                  onPressed: () async {

                    if (emailCheck) {
                      await UserSimplePreferences.setEmail(EmailController.text);
                    }

                    if (nameCheck) {
                      await UserSimplePreferences.setName(NameController.text);
                    }

                    if (telCheck) {
                      await UserSimplePreferences.setTelefon(TelController.text);
                    }

                    if (adressCheck) {
                      await UserSimplePreferences.setAdresse(AdressController.text);
                    }

                    if (stadtCheck) {
                      await UserSimplePreferences.setStadt(StadtController.text);
                    }


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
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.home),
      onPressed: () {
        Get.off(() => HomeScreen());
      },
    ),
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (value) {
          if (value == 0) Get.off(() => JobListSearchScreen());
          if (value == 1) Get.off(() => ProfilLoader());
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