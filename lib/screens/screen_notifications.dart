import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/materials/appbar_job.dart';
import 'package:joma/materials/appbar_replaceable_image.dart';
import 'package:joma/materials/checkbox_button.dart';
import 'package:joma/materials/navbar.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/utils/user_simple_preferences.dart';

class ScreenNotifications extends StatefulWidget {
  const ScreenNotifications({Key? key}) : super(key: key);

  @override
  _ScreenNotificationsState createState() => _ScreenNotificationsState();

}

class _ScreenNotificationsState extends State<ScreenNotifications> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final DataController data = Get.find();
//Load Profile from Json
    var remoteUser = profilToJson(data.profile);
    //Load Profile from Shared Preferences if given. If not load Json Profile
    var tmpUser = profilFromJson(UserSimplePreferences.getUser() ?? remoteUser.toString());
    Profil user = tmpUser[0];

    List<bool> _isChecked = user.notis!;



    return Scaffold(
      appBar: AppBarJobArea(
        bgColor: Colors.transparent,
        bgColorBar: AppColors().darkPrimaryColor,
        circleColor: AppColors().darkSecondaryColor,
        color: AppBackgroundColors().darkBackground,
        title: 'Mitteilungen'.toUpperCase(),
        hoehe: 230,
        imageUrl: 'assets/icons/notifications_active_black_24dp.svg',
        // TODO: SVG wird nicht angezeigt??
        onPressed1: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: AppBackgroundColors().darkBackground,

      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        children: [
          Text(
            'Werde benachrichtigt,\n sobald neue Jobs verfügbar sind!',
            textAlign: TextAlign.center,
            style: AppTextStyles.darkCardTextWhite
          ),
          CheckboxButton(
              text: 'Soziales & Hauswirtschaft',
              value: _isChecked[0],
              onChanged: (bool? value) {
                setState(() {
                  _isChecked[0] = value!;
                  saveNotis(_isChecked, tmpUser);
                });

              },
              icon: AppIcons().blueSection,
          ),
          CheckboxButton(
            text: 'Handwerk & Technik',
            value: _isChecked[1],
            onChanged: (bool? value) {
              setState(() {
                _isChecked[1] = value!;
                saveNotis(_isChecked, tmpUser);

              });

            },
            icon: AppIcons().redSection,
          ),
          CheckboxButton(
            text: 'Service & Lebensmittel',
            value: _isChecked[2],
            onChanged: (bool? value) {
              setState(() {
                _isChecked[2] = value!;
                saveNotis(_isChecked, tmpUser);
              });

            },
            icon: AppIcons().yellowSection,
          ),
          CheckboxButton(
            text: 'Gärtnerei & Landwirtschaft',
            value: _isChecked[3],
            onChanged: (bool? value) {
              setState(() {
                _isChecked[3] = value!;
                saveNotis(_isChecked, tmpUser);
              });

            },
            icon: AppIcons().greenSection,
          ),
          Container(
              margin: EdgeInsets.only(top: 30, bottom: 40),
              padding: EdgeInsets.only(left: 100, right: 100),
              child: SizedBox(
                width: MediaQuery.of(context).size.height * 0.25,
                child: ElevatedButton(

                    onPressed: () {
                      Get.off(() => const Einstellungen());
                    },
                    child: Text(
                      "Speichern",
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.fromLTRB(0, 25, 0, 25)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors().darkSecondaryColor),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            AppTextStyles.darkButtonText),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                    color:
                                    AppColors().darkSecondaryColor))))),
              )
          )
        ],
      ),




      //------Bottom Navigation------//
      floatingActionButton: Container(
        height: 100.0,
        width: 100.0,
        child: IconButton(
          icon: SvgPicture.asset("assets/images/darkLogo.svg",
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ScreenHome()),
            );
          },
        ),
      ),

      bottomNavigationBar: AppNavBar(
        backgroundColor: AppColors().darkPrimaryColor,
        selectedItemColor: AppBackgroundColors().darkBackground,
        unselectedItemColor: AppColors().white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

  void saveNotis(List<bool> _isChecked, List<Profil> tmpUser) {
    tmpUser[0].notis = _isChecked;
    var lokalusersavetmp = profilToJson(tmpUser);
    UserSimplePreferences.setUser(lokalusersavetmp.toString());
  }