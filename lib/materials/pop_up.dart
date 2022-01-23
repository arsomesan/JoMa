import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PopUpAlert extends StatelessWidget {
  final String title;
  final String content;
  final Widget route;
  final Widget current;

  PopUpAlert({
    required this.title,
    required this.content,
    required this.route,
    required this.current,
  });

  Widget cancelButton(Widget route) => TextButton(
    child: Text("Abbrechen"),
    onPressed: () {
      Get.off(() => route);
    },
  );

  Widget continueButton(Widget current) => TextButton(
    child: Text("Erneut Versuchen"),
    onPressed: () {
      Get.off(() => current);
    },
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
      ),
      actions: [cancelButton(route)],
      content: Text(
        this.content,
      ),
    );
  }
}
