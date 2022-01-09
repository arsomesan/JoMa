import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';

// Runder Kasten als Klasse //

class RoundRecMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: AppColors().darkPrimaryColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.zero,
          bottom: Radius.elliptical(550, 220),
        ),
      ),
    );
  }
}


// ENDE Runder Kasten als Klasse //



//--------------------- NUTZUNG
// Appbar kann genutzt werden durch den Auruf: AppBarMainArea();
// genutzt werden kann sie folgendermaßen: 
// hier ein Beispielsweise


// class _ScreenTest extends State<ScreenTest> {
//   get title => null;
//   get color => null;
//   get bgColor => null;
//   get bgColorBar => null;

//   @override
//   Widget build(BuildContext context) {
//     return AppBarMainArea(
//       bgColor: AppBackgroundColors().darkBackground,
//       bgColorBar: AppColors().darkPrimaryColor,
//       color: AppColors().darkPrimaryColor,
//       title: 'Test hi',
//     );
//   }
// }





// AppBarMainArea - normale Appbar am beginn der App //

class AppBarMainArea extends StatelessWidget {
  final String title; // Titel der Seite in der AppBar
  final Color color; //
  final Color bgColor;
  final Color bgColorBar;
  //final Icon iconTheme;

  AppBarMainArea({
    required this.title,
    required this.color,
    required this.bgColor,
    required this.bgColorBar,
    //required this.iconTheme
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          title.toUpperCase(),
          style: AppTextStyles.darkH1,
          textAlign: TextAlign.left,
        ),
        backgroundColor: bgColorBar,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
        RoundRecMain(),
        Positioned(
          child:
        Padding(
          padding: const EdgeInsets.fromLTRB(140, 80, 140, 0),
          child: AppLogo().darkLogo,
        ),),
      ],
    )
    );
  }
}


// ENDE ------ AppBarMainArea - normale Appbar am beginn der App //
