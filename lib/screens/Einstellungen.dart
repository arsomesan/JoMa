import 'package:flutter/material.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil.dart';

import 'joblist_search_screen.dart';

class Einstellungen extends StatelessWidget {
  const Einstellungen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F2F2),
      body: Center(
        child:
// Group: Gruppe 1

            SizedBox(
          width: 390.0,
          height: 844.0,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment(-0.82, 0.62),
                width: 390.0,
                height: 90.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF818181),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFF707070),
                  ),
                ),
                child: SizedBox(
                  width: 390.0,
                  height: 43.0,
                  child: Row(
                    children: <Widget>[
                      Spacer(flex: 13),
                      Container(
                        width: 37.0,
                        height: 43.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19.0),
                          image: DecorationImage(
                            image: AssetImage(''),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Spacer(flex: 80),
                      Align(
                        alignment: Alignment(0.0, -0.05),
                        child: Text(
                          'EINSTELLUNGEN',
                          style: TextStyle(
                            fontFamily: 'Adobe Clean',
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Spacer(flex: 130),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 19),
              InkWell(
                onTap: () {
                  //TODO: onTap Rechteck 3
                  print('onTap Rechteck 3');
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
                  //TODO: onTap Rechteck 4
                  print('onTap Rechteck 4');
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
                  //TODO: onTap Rechteck 6
                  print('onTap Rechteck 6');
                },
                child: Container(
                  alignment: Alignment(-0.78, 0.01),
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
                  //TODO: onTap Rechteck 7
                  print('onTap Rechteck 7');
                },
                child: Container(
                  alignment: Alignment(-0.77, 0.0),
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
              Spacer(flex: 18),
              InkWell(
                onTap: () {
                  //TODO: onTap Rechteck 8
                  print('onTap Rechteck 8');
                },
                child: Container(
                  alignment: Alignment(-0.78, -0.01),
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
                    'AUSLOGGEN',
                    style: TextStyle(
                      fontFamily: 'Adobe Clean',
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Spacer(flex: 111),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (value) {
            if (value == 0) Navigator.push(context, MaterialPageRoute(builder: (context) => const JobListSearchScreen()),
            );
            if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenProfil()),
            );
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
