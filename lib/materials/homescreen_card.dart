import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';

class HomeScreenCard extends StatelessWidget {
  final VoidCallback elevatedButtonRoute;
  final Color color;
  final Icon icon;
  final String title;

  // TODO: optional hier noch einen Textstyle einbinden

  HomeScreenCard(
      {required this.elevatedButtonRoute,
      required this.color,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 125,
      height: 125,
      child: ElevatedButton(
        onPressed: this.elevatedButtonRoute,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(this.color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ))),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(-45 / 360),
          child: Container(
              width: 90,
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  this.icon,
                  Text(this.title, style: TextStyle(
                      color: AppBackgroundColors().darkBackground,
                      fontWeight: FontWeight.bold,
                      fontSize: 11)
                  ),
                ],
              )),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
