import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  }
}
