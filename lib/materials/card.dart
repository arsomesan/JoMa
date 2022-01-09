import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';

// ---------- BUTTONS ----------

/* Diese Klasse beinhaltet einen standardisierten Button, der sich durch unsere App zieht (wie z.B. im Login-Screen)
zum Einbinden:
  - AppButton(text: [ hier den Text einfügen, der auf dem Button angezeigt werden soll ],
              color: [ hier die Farbe einfügen, entweder AppColors().darkPrimaryColor oder AppColors().darkSecondaryColor ],
              onPressed: [ hier die Callback-Routine einfügen, bspw. für den HomeScreen ->
              () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));} ]
              )
*/
class AppCard extends StatelessWidget {
  final String jobTitle;
  final String jobDescription;
  final Color color;
  final VoidCallback onPressed;


  AppCard({required this.jobTitle, required this.jobDescription, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          )
        ),
        margin: EdgeInsets.only(top: 20),
        child: Card(
          child: SizedBox(
            width: 320,
            height: 130,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Column(
                      children: [
                        Text(this.jobTitle,
                             style: AppTextStyles.darkH2),
                        Container(height: 10),
                        Container(
                          width: 220,
                          child: Text(this.jobDescription,
                                      style: AppTextStyles.darkInfoText),
                        ),
                      ],
                    )),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: this.color,
                    radius: 20,
                    child: AppIcons().forwardArrow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}