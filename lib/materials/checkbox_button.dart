import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';

class CheckboxButton extends StatefulWidget {
  final String text;

  CheckboxButton(
      {required this.text,
      required bool value,
      bool tristate: false,
      // required ValueChanged<bool> onChanged,
      bool autofocus: false});

  @override
  State<CheckboxButton> createState() => _CheckboxButtonState();
}

class _CheckboxButtonState extends State<CheckboxButton> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors().darkPrimaryColor,
        ),
        child: CheckboxListTile(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          title: Text('Notification'.toUpperCase(), style: AppTextStyles.darkButtonText),
          secondary: AppIcons().bookMark,
          controlAffinity:
          ListTileControlAffinity.platform,
          value: _checked,
          onChanged: (bool? value) {
            setState(() {
              _checked = value!;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.white,
        ),
      ),
    );
    /*Container(
      alignment: Alignment.center,
      width: 300,
      height: 45,
      margin: const EdgeInsets.fromLTRB(25, 25, 25, 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors().darkPrimaryColor),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 50,
                child: AppIcons().blueSection,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: 200,
                  child: Text(
                    text,
                    style: AppTextStyles.darkButtonText
                  )
              ),
            ], //Text
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerRight,
                width: 50,
                child: Checkbox(
                  activeColor: AppColors().white,
                  checkColor: AppColors().white,
                  focusColor: AppColors().white,
                  value: this.value,
                  onChanged: (bool? value) {
                    this.value = value!;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );*/
  }
}
