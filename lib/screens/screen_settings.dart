import 'package:joma/materials/button.dart';
import 'package:joma/screens//screen_settings_datenschutz.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_login.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_profil_settings_loader.dart';
import 'package:joma/screens/screen_select_view.dart';
import 'package:joma/screens/screen_settings_datenschutz.dart';
import 'package:joma/screens/screen_settings_impressum.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/screens/screen_welcome.dart';

import 'joblist_search_screen.dart';

class Einstellungen extends StatelessWidget {
  const Einstellungen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
          child: AppBar(
            title: Text('Einstellungen'.toUpperCase()),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(180),
              )
            ),
            backgroundColor: AppColors().darkPrimaryColor,
          ),
      ),

      backgroundColor: AppBackgroundColors().darkBackground,
      body: ListView (
        children: [
          Container (
            margin: EdgeInsets.fromLTRB(120, 0, 120,20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180),
              border: Border.all(width: 4, color: AppColors().darkSecondaryColor),
              color: AppColors().white
            ),
            child: Icon(
              Icons.settings,
              color: AppColors().darkPrimaryColor,
              size: 150,
            ),
          ),
          AppButton(
            text: 'Profil bearbeiten',
            color: AppColors().darkPrimaryColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilSettingsLoader()));
            }
          ),
          AppButton(
              // icon: AppIcons().profile,
              text: 'Ansicht wählen',
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectView()));
              }
          ),
          AppButton(
              text: 'Mitteilungen',
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilSettingsLoader()));
              }
          ),
          AppButton(
              text: 'Impressum',
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Impressum()));
              }
          ),
          AppButton(
              text: 'Datenschutz',
              color: AppColors().darkPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Impressum()));
              }
          ),
          AppButton(
              text: 'Abmelden',
              color: AppColors().darkSecondaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenWelcome()));
              }
          ),
        ],
        /*child: SizedBox(
          width: 390.0,
          height: 844.0,
          child: Stack(
            children: <Widget>[
            // Group: Gruppe 1

              SizedBox(
                width: 390.0,
                height: 844.0,
                child: Column(
                  children: <Widget>[
                    Spacer(flex: 19),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfilSettingsLoader()));
                        print('onTap Profil bearbeiten');
                      },
                      child: Container(
                        alignment: Alignment(-0.72, 0.01),
                        width: 364.0,
                        height: 91.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Text(
                          'PROFIL BEARBEITEN',
                          style: TextStyle(
                            fontFamily: 'Adobe Clean',
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 19),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SelectView()));
                        print('onTap Ansicht waehlen');
                      },
                      child: Container(
                        alignment: Alignment(-0.73, -0.01),
                        width: 364.0,
                        height: 91.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Text(
                          'ANSICHT WÄHLEN ',
                          style: TextStyle(
                            fontFamily: 'Adobe Clean',
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 18),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Impressum()));
                        print('onTap Impressum');
                      },
                      child: Container(
                        alignment: Alignment(-0.8, 0.01),
                        width: 364.0,
                        height: 91.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Text(
                          'IMPRESSUM',
                          style: TextStyle(
                            fontFamily: 'Adobe Clean',
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 18),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Datenschutz()));
                        print('onTap Datenschutz');
                      },
                      child: Container(
                        alignment: Alignment(-0.8, 0.0),
                        width: 364.0,
                        height: 92.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Text(
                          'DATENSCHUTZ',
                          style: TextStyle(
                            fontFamily: 'Adobe Clean',
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 66),
                    InkWell(
                      onTap: () => showDialog<String>(
                        //TODO: onTap Ausloggen - Pop-up -> Route zu screen_login

                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Ausloggen',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                          ),
                          ),
                          content:
                              const Text('Wollen Sie sich wirklich ausloggen?',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                  builder: (context) => ScreenLogin())),
                              child: const Text(
                                'Ja',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text(
                                'Abbrechen',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(176, 73, 75, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        child: Text(
                          'AUSLOGGEN',
                          style: TextStyle(
                            fontFamily: 'Adobe Clean',
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        alignment: Alignment.center,
                        width: 182.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(176, 73, 75, 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(flex: 106),
                  ],
                ),
              ),
            ],
          ),
        ),*/
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          elevation: 0,
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage('assets/images/darkJomaLogo.png',
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()),);
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (value) {
            if (value == 0) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const JobListSearchScreen()),
              );
            }
            if (value == 1) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilLoader()),
              );
            }
            //if (value == 2) Navigator.of(context).push(...);
          },
          backgroundColor: AppColors().darkPrimaryColor,
          selectedItemColor: AppColors().white,
          unselectedItemColor: AppColors().white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AppIcons().searchGlass,
              label: 'Suchen',
            ),
            BottomNavigationBarItem(
              icon: AppIcons().profile,
              label: 'Profil',
            ),
          ]
      ),
    );
  }
}

