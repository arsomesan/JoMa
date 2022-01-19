import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';

class HomeScreenCard extends StatelessWidget {
  final VoidCallback elevatedButtonRoute;
  final Color color;
  final Icon icon;
  final String title;
  final int startOrEnd; // 0 = start, 1 = end
  final _crossAlignments = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.end
  ];
  final _mainAlignments = [
    MainAxisAlignment.start,
    MainAxisAlignment.end
  ];

  // TODO: optional hier noch einen Textstyle einbinden

  HomeScreenCard(
      {required this.elevatedButtonRoute,
      required this.color,
      required this.icon,
      required this.title,
      required this.startOrEnd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 150,
      height: 150,
      child: ElevatedButton(
        onPressed: elevatedButtonRoute,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ))),
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(-45 / 360),
          child: Container(
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: _mainAlignments[startOrEnd],
                crossAxisAlignment: _crossAlignments[startOrEnd],
                children: [
                  icon,
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              )),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
