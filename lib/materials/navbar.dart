import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:joma/screens/screen_joblist_search.dart';
import 'package:joma/screens/screen_profil_loader.dart';

import 'assets.dart';

class AppNavBar extends StatelessWidget {
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  //final VoidCallback onTab;

  AppNavBar({required this.backgroundColor, required this.selectedItemColor, required this.unselectedItemColor });


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenJobListSearch()));
          }
          if (value == 1) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilLoader()));
          }
          //if (value == 2) Navigator.of(context).push(...);
        },

        currentIndex: 0,
        selectedItemColor: selectedItemColor, //Suche
        unselectedItemColor: unselectedItemColor, //Profil
        backgroundColor: backgroundColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
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
    );
  }
}

