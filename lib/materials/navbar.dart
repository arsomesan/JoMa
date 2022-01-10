import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:joma/screens/joblist_search_screen.dart';
import 'package:joma/screens/screen_profil_loader.dart';

import 'assets.dart';

class AppNavBar extends StatelessWidget {
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  //final VoidCallback onTab;

  AppNavBar({required this.backgroundColor, required this.selectedItemColor, required this.unselectedItemColor});


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        backgroundColor: backgroundColor,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
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