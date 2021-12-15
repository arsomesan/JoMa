import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/global/glovar.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil.dart';

import 'joblist_search_screen.dart';

var email = "max@mustermann.de";
var tel = "+49 123 456789";
var strasse = "Musterstrasse";
var ort = "Musterort";
var plz = "12345";
var hausnummer = "123";
var adresse = strasse + " " + hausnummer;
var stadt = plz + " " + ort;
var name = "Max Mustermann";
var bild = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.tenor.com%2Fimages%2F6b6b5eff607c722e56f378f7dd613f58%2Ftenor.gif&f=1&nofb=1";




class ScreenProfilSettings extends StatelessWidget {
  const ScreenProfilSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("Profil bearbeiten"),
          centerTitle: true,
          backgroundColor: Glovar.white,
          foregroundColor: Glovar.blackvar,
          ),
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
                          bild),
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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()),);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (value) {
            if (value == 0) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const JobListSearchScreen()),
            );
            }
            if (value == 1) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ScreenProfil()),
            );
            }
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
}
