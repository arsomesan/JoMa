import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';

// ---------- BUTTONS ----------

/* Diese Klasse beinhaltet einen standardisierten Button, der sich durch unsere App zieht (wie z.B. im Login-Screen)
zum Einbinden:
  - AppButton(text: hier den Text einfügen, der auf dem Button angezeigt werden soll,
              color: hier die Farbe einfügen, entweder AppColors().darkPrimaryColor oder AppColors().darkSecondaryColor,
              onPressed: hier die Callback-Routine einfügen, bspw. für den HomeScreen -> () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));}
              )
*/
class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  // TODO: implement a possibility to use an icon in the button
  // TODO: implement a possibility to change the text color

  AppButton({required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // double-Wert

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(0, 17, 0, 17)),
              backgroundColor: MaterialStateProperty.all<Color>(color),
              textStyle: MaterialStateProperty.all<TextStyle>(
                  AppTextStyles.darkButtonText),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          AppButtonValues().borderRadiusCircular),
                      side: BorderSide(color: color))))),
    );
  }
}

class AppButtonWithIcon extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final Icon icon;

  // TODO: implement a possibility to use an icon in the button
  // TODO: implement a possibility to change the text color

  AppButtonWithIcon(
      {required this.text,
      required this.color,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: ElevatedButton.icon(
            onPressed: onPressed,
            icon: icon,
            label: Text(text),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.fromLTRB(0, 15, 0, 15)),
                  backgroundColor: MaterialStateProperty.all<Color>(color),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      AppTextStyles.darkButtonText),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppButtonValues().borderRadiusCircular),
                          side: BorderSide(color: color))))
          ),
    );
  }
}
