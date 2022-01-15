import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';

class CheckboxButton extends StatelessWidget {
  bool value = false;
  final String text;

  CheckboxButton(
      {required this.text,
      required bool value,
      bool tristate: false,
      // required ValueChanged<bool> onChanged,
      bool autofocus: false});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
