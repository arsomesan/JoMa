import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/materials/assets.dart';

class SkillCheckboxButton extends StatefulWidget {
  final String text;
  ValueChanged<bool?>? onChanged;
  bool value;

  SkillCheckboxButton(
      {required this.text,
        required this.value,
        required this.onChanged
      });



  @override
  State<SkillCheckboxButton> createState() => _SkillCheckboxButtonState();
}

final DataController data = Get.find();


class _SkillCheckboxButtonState extends State<SkillCheckboxButton> {

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
          title: Text(widget.text.toUpperCase(), style: AppTextStyles.darkButtonText),
          secondary: Icon(FontAwesomeIcons.handshake),
          controlAffinity:
          ListTileControlAffinity.platform,
          value: widget.value,
          onChanged: widget.onChanged,
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
