import 'package:flutter/material.dart';
import 'package:joma/materials/appbar.dart';
import 'package:joma/materials/assets.dart';

class ScreenTest extends StatefulWidget {
  const ScreenTest({Key? key}) : super(key: key);

  @override
  _ScreenTest createState() => _ScreenTest();
}

class _ScreenTest extends State<ScreenTest> {
  get title => null;
  get color => null;
  get bgColor => null;
  get bgColorBar => null;

  @override
  Widget build(BuildContext context) {
    return AppBarMainArea(
      bgColor: AppBackgroundColors().darkBackground,
      bgColorBar: AppColors().darkPrimaryColor,
      color: AppColors().darkPrimaryColor,
      title: 'Test hi',
    );
  }
}
