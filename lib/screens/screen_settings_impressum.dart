import 'package:flutter_svg/svg.dart';
import 'package:joma/materials/appbar_job.dart';
import 'package:joma/materials/appbar_replaceable_image.dart';
import 'package:joma/materials/navbar.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/button.dart';
import 'screen_joblist_search.dart';
import 'package:url_launcher/url_launcher.dart';

class Impressum extends StatelessWidget {
  const Impressum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarJobArea(
        blocked: 0,
        bgColor: Colors.transparent,
        bgColorBar: AppColors().darkPrimaryColor,
        circleColor: AppColors().darkSecondaryColor,
        color: AppBackgroundColors().darkBackground,
        title: 'Impressum'.toUpperCase(),
        hoehe: 230,
        imageUrl: 'assets/icons/speaker_notes_black_24dp.svg',
        onPressed1: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: AppBackgroundColors().darkBackground,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          //width: 390.0,
          //height: 644.0,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
// Group: Gruppe 4
              Column(
                //top: 360.0,
                //color: Colors.red,
                children: [
                  Container(height: 20),
                  Container(
                    //top: 15.0,
                    child: Container(
                        width: MediaQuery.of(context).size.width -25,
                        height: 340.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  Container(height: 20),
                  Container(
                    width: 380.0,
                    child: AppButton(text: "Impressum der Entwickler",
                        color:AppColors().darkSecondaryColor,
                        onPressed: () {
                          _launchURL();
                        }
                    ),
                  ),
                  Container(height: 50),
                ],
              ),
              Column(
                children: [
                  Container(height: 20,
                  ),
                  Container(
                    child: Container(
                      width: 350.0,
                      height: 330.0,
                      child: SingleChildScrollView(
                        //TODO edit text for Impressum
                        child: Text(
                          'Impressum\nAngaben gem. § 5 TMG:\nVorname, Name\nAdresse\nPLZ\nKontaktaufnahme:\nTelefon:\nFax:\nE-Mail:\n \nUmsatzsteuer-ID\n \nUmsatzsteuer-Identifikationsnummer gem. § 27 a Umsatzsteuergesetz:\nDE XXX XXX XXX\n \nHaftungsausschluss – Disclaimer:\nHaftung für Inhalte\nAlle Inhalte unseres Internetauftritts wurden mit größter Sorgfalt und nach bestem Gewissen erstellt. Für die Richtigkeit, Vollständigkeit und Aktualität der Inhalte können wir jedoch keine Gewähr übernehmen. Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt.\nEine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntniserlangung einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von den o.g. Rechtsverletzungen werden wir diese Inhalte unverzüglich entfernen.\nHaftungsbeschränkung für externe Links\nUnsere Webseite enthält Links auf externe Webseiten Dritter. Auf die Inhalte dieser direkt oder indirekt verlinkten Webseiten haben wir keinen Einfluss. Daher können wir für die „externen Links“ auch keine Gewähr auf Richtigkeit der Inhalte übernehmen. Für die Inhalte der externen Links sind die jeweilige Anbieter oder Betreiber (Urheber) der Seiten verantwortlich.\nDie externen Links wurden zum Zeitpunkt der Linksetzung auf eventuelle Rechtsverstöße überprüft und waren im Zeitpunkt der Linksetzung frei von rechtswidrigen Inhalten. Eine ständige inhaltliche Überprüfung der externen Links ist ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht möglich. Bei direkten oder indirekten Verlinkungen auf die Webseiten Dritter, die außerhalb unseres Verantwortungsbereichs liegen, würde eine Haftungsverpflichtung ausschließlich in dem Fall nur bestehen, wenn wir von den Inhalten Kenntnis erlangen und es uns technisch möglich und zumutbar wäre, die Nutzung im Falle rechtswidriger Inhalte zu verhindern.\nDiese Haftungsausschlusserklärung gilt auch innerhalb des eigenen Internetauftrittes „Name Ihrer Domain“ gesetzten Links und Verweise von Fragestellern, Blogeinträgern, Gästen des Diskussionsforums. Für illegale, fehlerhafte oder unvollständige Inhalte und insbesondere für Schäden, die aus der Nutzung oder Nichtnutzung solcherart dargestellten Informationen entstehen, haftet allein der Diensteanbieter der Seite, auf welche verwiesen wurde, nicht derjenige, der über Links auf die jeweilige Veröffentlichung lediglich verweist.\nWerden uns Rechtsverletzungen bekannt, werden die externen Links durch uns unverzüglich entfernt.\nUrheberrecht\nDie auf unserer Webseite veröffentlichen Inhalte und Werke unterliegen dem deutschen Urheberrecht (http://www.gesetze-im-internet.de/bundesrecht/urhg/gesamt.pdf) . Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung des geistigen Eigentums in ideeller und materieller Sicht des Urhebers außerhalb der Grenzen des Urheberrechtes bedürfen der vorherigen schriftlichen Zustimmung des jeweiligen Urhebers i.S.d. Urhebergesetzes (http://www.gesetze-im-internet.de/bundesrecht/urhg/gesamt.pdf ). Downloads und Kopien dieser Seite sind nur für den privaten und nicht kommerziellen Gebrauch erlaubt. Sind die Inhalte auf unserer Webseite nicht von uns erstellt wurden, sind die Urheberrechte Dritter zu beachten. Die Inhalte Dritter werden als solche kenntlich gemacht. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte unverzüglich entfernen.',
                          style: AppTextStyles.darkMainText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 100.0,
        width: 100.0,
        child: IconButton(
          icon: SvgPicture.asset(
            "assets/images/darkLogo.svg",
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
        selectedItemColor:AppColors().white,
        unselectedItemColor: AppBackgroundColors().darkBackground,
      ),
    );

  }
}
void _launchURL() async {
  const url = 'http://joma.informatik.hs-fulda.de/';
  if (!await launch(url)) throw 'Could not launch $url';
}
