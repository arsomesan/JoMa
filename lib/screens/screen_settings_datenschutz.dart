import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_profil_loader.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';

import 'screen_joblist_search.dart';

class Datenschutz extends StatelessWidget {
  const Datenschutz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColors().darkPrimaryColor,
      ),
      backgroundColor: AppBackgroundColors().darkBackground,
      body: Center(
        child: SizedBox(
          width: 390.0,
          height: 644.0,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
// Group: Gruppe 5
              SizedBox(
                width: 390.0,
                height: 844.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Positioned(
                top: 85.0,
                child: Container(
                  width: 364.0,
                  height: 500.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Positioned(
                top: 90.0,
                child: Container(
                  width: 350.0,
                  height: 490.0,
                  child: SingleChildScrollView(
                  child: Text(
                    'Datenschutzerklärung nach DSGVO\n\n1.	Grundlegendes\n\nMit dieser Datenschutzerklärung informieren wir Sie über die Art, den Umfang und den Zweck der Erhebung und Verwendung personenbezogener Daten durch den Websitebetreiber [Ihre Kontaktdaten einfügen].\n\nDer Websitebetreiber nimmt Ihren Datenschutz sehr ernst und behandelt Ihre personenbezogenen Daten vertraulich und entsprechend der gesetzlichen Vorschriften. Da durch neue Technologien und die ständige Weiterentwicklung dieser Webseite Änderungen an dieser Datenschutzerklärung vorgenommen werden können, empfehlen wir Ihnen sich die Datenschutzerklärung in regelmäßigen Abständen wieder durchzulesen.\n\nDer Begriff „personenbezogene Daten“ meint alle Daten, die auf Sie persönlich beziehbar sind. Darunter fallen beispielsweise Name, Adresse, E-Mailadressen, Nutzerverhalten. Hinsichtlich der übrigen Begrifflichkeiten, insbesondere der Begriffe „Verarbeitung“ und „Einwilligung“ verweisen wir auf die gesetzlichen datenschutzrechtlichen Definitionen.\nWeitere Definitionen von Begriffen finden Sie in Art. 4 DSGVO.\n\n2.	Name und Anschrift des Verantwortlichen\nDer Verantwortliche im Sinne der Datenschutz-Grundverordnung und anderer nationaler Datenschutzgesetze der Mitgliedsstaaten sowie sonstiger datenschutzrechtlicher Bestimmungen ist die: \n\nMuster GmbH\nMusterstraße\n12345 Musterort\nDeutschland\n\nTel.: xx\nE-Mail: xx \nWebsite: xx\n\n3.	Name und Anschrift des Datenschutzbeauftragten \nDer Datenschutzbeauftragte des Verantwortlichen ist:\n\nMax Mustermann\nMusterstraße\n12345 Musterort\nDeutschland\n\nTel.: xx\nE-Mail: xx \nWebsite: xx\n\n\n\n\n\n\n4.	Allgemeines zur Datenverarbeitung\nUmfang der Verarbeitung personenbezogener Daten\nWir verarbeiten personenbezogene Daten unserer Nutzer grundsätzlich nur, soweit dies zur Bereitstellung einer funktionsfähigen Website sowie unserer Inhalte und Leistungen erforderlich ist. Die Verarbeitung personenbezogener Daten unserer Nutzer erfolgt regelmäßig nur nach Einwilligung des Nutzers. Eine Ausnahme gilt in solchen Fällen, in denen eine vorherige Einholung einer Einwilligung aus tatsächlichen Gründen nicht möglich ist und die Verarbeitung der Daten durch gesetzliche Vorschriften gestattet ist. \nRechtsgrundlage für die Verarbeitung personenbezogener Daten\nSoweit wir für Verarbeitungsvorgänge personenbezogener Daten eine Einwilligung der betroffenen Person einholen, dient Art. 6 Abs. 1 lit. a EU-Datenschutzgrundverordnung (DSGVO) als Rechtsgrundlage. Bei der Verarbeitung von personenbezogenen Daten, die zur Erfüllung eines Vertrages, dessen Vertragspartei die betroffene Person ist, erforderlich ist, dient Art. 6 Abs. 1 lit. b DSGVO als Rechtsgrundlage. Dies gilt auch für Verarbeitungsvorgänge, die zur Durchführung vorvertraglicher Maßnahmen erforderlich sind. Soweit eine Verarbeitung personenbezogener Daten zur Erfüllung einer rechtlichen Verpflichtung erforderlich ist, der unser Unternehmen unterliegt, dient Art. 6 Abs. 1 lit. c DSGVO als Rechtsgrundlage. Für den Fall, dass lebenswichtige Interessen der betroffenen Person oder einer anderen natürlichen Person eine Verarbeitung personenbezogener Daten erforderlich machen, dient Art. 6 Abs. 1 lit. d DSGVO als Rechtsgrundlage. \nIst die Verarbeitung zur Wahrung eines berechtigten Interesses unseres Unternehmens oder eines Dritten erforderlich und überwiegen die Interessen, Grundrechte und Grundfreiheiten des Betroffenen das erstgenannte Interesse nicht, so dient Art. 6 Abs. 1 lit. f DSGVO als Rechtsgrundlage für die Verarbeitung.\n\nDatenlöschung und Speicherdauer\n\nDie personenbezogenen Daten der betroffenen Person werden gelöscht oder gesperrt, sobald der Zweck der Speicherung entfällt. Eine Speicherung kann darüber hinaus erfolgen, wenn dies durch den europäischen oder nationalen Gesetzgeber in unionsrechtlichen Verordnungen, Gesetzen oder sonstigen Vorschriften, denen der Verantwortliche unterliegt, vorgesehen wurde. Eine Sperrung oder Löschung der Daten erfolgt auch dann, wenn eine durch die genannten Normen vorgeschriebene Speicherfrist abläuft, es sei denn, dass eine Erforderlichkeit zur weiteren Speicherung der Daten für einen Vertragsabschluss oder eine Vertragserfüllung besteht.\n\n5.	Zugriffsdaten\n\nWir, der Websitebetreiber bzw. Seitenprovider, erheben aufgrund unseres berechtigten Interesses (s. Art. 6 Abs. 1 lit. f. DSGVO) Daten über Zugriffe auf die Website und speichern diese als „Server-Logfiles“ auf dem Server der Website ab. Folgende Daten werden so protokolliert:\n\n•	Besuchte Website\n•	Uhrzeit zum Zeitpunkt des Zugriffes\n•	Menge der gesendeten Daten in Byte\n•	Quelle/Verweis, von welchem Sie auf die Seite gelangten\n•	Verwendeter Browser\n•	Verwendetes Betriebssystem\n•	Verwendete IP-Adresse\n\nDie Server-Logfiles werden für maximal 7 Tage gespeichert und anschließend gelöscht. Die Speicherung der Daten erfolgt aus Sicherheitsgründen, um z. B. Missbrauchsfälle aufklären zu können. Müssen Daten aus Beweisgründen aufgehoben werden, sind sie solange von der Löschung ausgenommen bis der Vorfall endgültig geklärt ist.\n\n6.	Reichweitenmessung & Cookies\n\nDiese Website verwendet Cookies zur pseudonymisierten Reichweitenmessung, die entweder von unserem Server oder dem Server Dritter an den Browser des Nutzers übertragen werden. Bei Cookies handelt es sich um kleine Dateien, welche auf Ihrem Endgerät gespeichert werden. Ihr Browser greift auf diese Dateien zu. Durch den Einsatz von Cookies erhöht sich die Benutzerfreundlichkeit und Sicherheit dieser Website.\nFalls Sie nicht möchten, dass Cookies zur Reichweitenmessung auf Ihrem Endgerät gespeichert werden, können Sie dem Einsatz dieser Dateien hier widersprechen:\n\n•	Cookie-Deaktivierungsseite der Netzwerkwerbeinitiative: http://optout.networkadvertising.org/?c=1#!/\n•	Cookie-Deaktivierungsseite der US-amerikanischen Website: http://optout.aboutads.info/?c=2#!/\n•	Cookie-Deaktivierungsseite der europäischen Website: http://optout.networkadvertising.org/?c=1#!/\n\nGängige Browser bieten die Einstellungsoption, Cookies nicht zuzulassen. Hinweis: Es ist nicht gewährleistet, dass Sie auf alle Funktionen dieser Website ohne Einschränkungen zugreifen können, wenn Sie entsprechende Einstellungen vornehmen.\n\nErfassung und Verarbeitung personenbezogener Daten\n\nDer Websitebetreiber erhebt, nutzt und gibt Ihre personenbezogenen Daten nur dann weiter, wenn dies im gesetzlichen Rahmen erlaubt ist oder Sie in die Datenerhebung einwilligen.\nAls personenbezogene Daten gelten sämtliche Informationen, welche dazu dienen, Ihre Person zu bestimmen und welche zu Ihnen zurückverfolgt werden können – also beispielsweise Ihr Name, Ihre E-Mail-Adresse und Telefonnummer.\n\nDiese Website können Sie auch besuchen, ohne Angaben zu Ihrer Person zu machen. Zur Verbesserung unseres Online-Angebotes speichern wir jedoch (ohne Personenbezug) Ihre Zugriffsdaten auf diese Website. Zu diesen Zugriffsdaten gehören z. B. die von Ihnen angeforderte Datei oder der Name Ihres Internet-Providers. Durch die Anonymisierung der Daten sind Rückschlüsse auf Ihre Person nicht möglich. \n\n7.	Umgang mit Kontaktdaten\n\nNehmen Sie mit uns als Websitebetreiber durch die angebotenen Kontaktmöglichkeiten Verbindung auf, werden Ihre Angaben gespeichert, damit auf diese zur Bearbeitung und Beantwortung Ihrer Anfrage zurückgegriffen werden kann. Ohne Ihre Einwilligung werden diese Daten nicht an Dritte weitergegeben.\n\n8.	Umgang mit Kommentaren und Beiträgen\n\nHinterlassen Sie auf dieser Website einen Beitrag oder Kommentar, wird Ihre IP-Adresse gespeichert. Dies erfolgt aufgrund unserer berechtigten Interessen im Sinne des Art. 6 Abs. 1 lit. f. DSGVO und dient der Sicherheit von uns als Websitebetreiber: Denn sollte Ihr Kommentar gegen geltendes Recht verstoßen, können wir dafür belangt werden, weshalb wir ein Interesse an der Identität des Kommentar- bzw. Beitragsautors haben.\n\n9.	Google Analytics\n\nDiese Website nutzt aufgrund unserer berechtigten Interessen zur Optimierung und Analyse unseres Online-Angebots im Sinne des Art. 6 Abs. 1 lit. f. DSGVO den Dienst „Google Analytics“, welcher von der Google Inc. (1600 Amphitheatre Parkway Mountain View, CA 94043, USA) angeboten wird. Der Dienst (Google Analytics) verwendet „Cookies“ – Textdateien, welche auf Ihrem Endgerät gespeichert werden. Die durch die Cookies gesammelten Informationen werden im Regelfall an einen Google-Server in den USA gesandt und dort gespeichert.\n\nGoogle LLC hält das europäische Datenschutzrecht ein und ist unter dem Privacy-Shield-Abkommen zertifiziert: https://www.privacyshield.gov/participant?id=a2zt000000001L5AAI&status=Active\n\nAuf dieser Website greift die IP-Anonymisierung. Die IP-Adresse der Nutzer wird innerhalb der Mitgliedsstaaten der EU und des Europäischen Wirtschaftsraum und in den anderen Vertragsstaaten des Abkommens gekürzt. Nur in Einzelfällen wird die IP-Adresse zunächst ungekürzt in die USA an einen Server von Google übertragen und dort gekürzt. Durch diese Kürzung entfällt der Personenbezug Ihrer IP-Adresse. Die vom Browser übermittelte IP-Adresse des Nutzers wird nicht mit anderen von Google gespeicherten Daten kombiniert.\n\nIm Rahmen der Vereinbarung zur Auftragsdatenvereinbarung, welche wir als Websitebetreiber mit der Google Inc. geschlossen haben, erstellt diese mithilfe der gesammelten Informationen eine Auswertung der Websitenutzung und der Websiteaktivität und erbringt mit der Internetnutzung verbundene Dienstleistungen.\n\nDie von Google in unserem Auftrag erhobenen Daten werden genutzt, um die Nutzung unseres Online-Angebots durch die einzelnen Nutzer auswerten zu können, z. B. um Reports über die Aktivität auf der Website zu erstellen, um unser Online-Angebot zu verbessern.\n\nSie haben die Möglichkeit, die Speicherung der Cookies auf Ihrem Gerät zu verhindern, indem Sie in Ihrem Browser entsprechende Einstellungen vornehmen. Es ist nicht gewährleistet, dass Sie auf alle Funktionen dieser Website ohne Einschränkungen zugreifen können, wenn Ihr Browser keine Cookies zulässt.\n\nWeiterhin können Sie durch ein Browser-Plugin verhindern, dass die durch Cookies gesammelten Informationen (inklusive Ihrer IP-Adresse) an die Google Inc. gesendet und von der Google Inc. genutzt werden. Folgender Link führt Sie zu dem entsprechenden Plugin: https://tools.google.com/dlpage/gaoptout?hl=de\n\nAlternativ verhindern Sie mit einem Klick auf diesen Link (WICHTIG: Opt-Out-Link einfügen), dass Google Analytics innerhalb dieser Website Daten über Sie erfasst. Mit dem Klick auf obigen Link laden Sie ein „Opt-Out-Cookie“ herunter. Ihr Browser muss die Speicherung von Cookies also hierzu grundsätzlich erlauben. Löschen Sie Ihre Cookies regelmäßig, ist ein erneuter Klick auf den Link bei jedem Besuch dieser Website vonnöten.\n\nHier finden Sie weitere Informationen zur Datennutzung durch die Google Inc.: \n\n•	https://policies.google.com/privacy/partners?hl=de (Daten, die von Google-Partnern erhoben werden)\n•	https://adssettings.google.de/authenticated (Einstellungen über Werbung, die Ihnen angezeigt wird)\n•	https://policies.google.com/technologies/ads?hl=de (Verwendung von Cookies in Anzeigen)\n\n10.	Nutzung von Social-Media-Plugins von Facebook\n\nAufgrund unseres berechtigten Interesses an der Analyse, Optimierung und dem Betrieb unseres Online-Angebotes (im Sinne des Art. 6 Abs. 1 lit. f. DSGVO), verwendet diese Website das Facebook-Social-Plugin, welches von der Facebook Inc. (1 Hacker Way, Menlo Park, California 94025, USA) betrieben wird. Erkennbar sind die Einbindungen an dem Facebook-Logo bzw. an den Begriffen „Like“, „Gefällt mir“, „Teilen“ in den Farben Facebooks (Blau und Weiß). Informationen zu allen Facebook-Plugins finden Sie über den folgenden Link: https://developers.facebook.com/docs/plugins/\n\nFacebook Inc. hält das europäische Datenschutzrecht ein und ist unter dem Privacy-Shield-Abkommen zertifiziert: https://www.privacyshield.gov/participant?id=a2zt0000000GnywAAC&status=Active\n\nDas Plugin stellt eine direkte Verbindung zwischen Ihrem Browser und den Facebook-Servern her. Der Websitebetreiber hat keinerlei Einfluss auf die Natur und den Umfang der Daten, welche das Plugin an die Server der Facebook Inc. übermittelt. Informationen dazu finden Sie hier: https://www.facebook.com/help/186325668085084\n\nDas Plugin informiert die Facebook Inc. darüber, dass Sie als Nutzer diese Website besucht haben. Es besteht hierbei die Möglichkeit, dass Ihre IP-Adresse gespeichert wird. Sind Sie während des Besuchs auf dieser Website in Ihrem Facebook-Konto eingeloggt, werden die genannten Informationen mit diesem verknüpft.\n\nNutzen Sie die Funktionen des Plugins – etwa indem Sie einen Beitrag teilen oder „liken“ –, werden die entsprechenden Informationen ebenfalls an die Facebook Inc. übermittelt.\nMöchten Sie verhindern, dass die Facebook. Inc. diese Daten mit Ihrem Facebook-Konto verknüpft, loggen Sie sich bitte vor dem Besuch dieser Website bei Facebook aus und löschen Sie die gespeicherten Cookies. Über Ihr Facebook-Profil können Sie weitere Einstellungen zur Datenverarbeitung für Werbezwecke tätigen oder der Nutzung Ihrer Daten für Werbezwecke widersprechen. Zu den Einstellungen gelangen Sie hier: \n\n•	Profileinstellungen bei Facebook: https://www.facebook.com/ads/preferences/?entry_product=ad_settings_screen\n•	Cookie-Deaktivierungsseite der US-amerikanischen Website: http://optout.aboutads.info/?c=2#!/\n•	Cookie-Deaktivierungsseite der europäischen Website: http://optout.networkadvertising.org/?c=1#!/\n\nWelche Daten, zu welchem Zweck und in welchem Umfang Facebook Daten erhebt, nutzt und verarbeitet und welche Rechte sowie Einstellungsmöglichkeiten Sie zum Schutz Ihrer Privatsphäre haben, können Sie in den Datenschutzrichtlinien von Facebook nachlesen. Diese finden Sie hier: https://www.facebook.com/about/privacy/ \n\nHinweis: Je nachdem welche weiteren Tools und Integrationen du auf deiner Website nutzt und welche Cookies du einsetzt (z.B. Google Ads, Bing Ads, etc.), musst du diese ebenfalls hier aufführen. \n\n11.	Newsletter\n\nBeschreibung und Umfang der Datenverarbeitung\n\nAuf unserer Internetseite besteht die Möglichkeiteinen kostenfreien Newsletter zu abonnieren. Dabei werden bei der Anmeldung zum Newsletter die Daten aus der Eingabemaske an uns übermittelt.\n•	E-Mail-Adresse\no	IP-Adresse des aufrufenden Rechners\no	Datum und Uhrzeit der Registrierung\n\nFür die Verarbeitung der Daten wird im Rahmen des Anmeldevorgangs Ihre Einwilligung eingeholt und auf diese Datenschutzerklärung verwiesen.\n\nRechtsgrundlage für die Datenverarbeitung\n\nRechtsgrundlage für den Versand des Newsletters infolge des Verkaufs von Waren oder Dienstleistungen ist § 7 Abs. 3 UWG. \n\nZweck der Datenverarbeitung\n\nDie Erhebung der E-Mail-Adresse des Nutzers dient dazu, den Newsletter zuzustellen. \n\nDauer der Speicherung\n\nDie Daten werden gelöscht, sobald sie für die Erreichung des Zweckes ihrer Erhebung nicht mehr erforderlich sind. Die E-Mail-Adresse des Nutzers wird demnach solange gespeichert, wie das Abonnement des Newsletters aktiv ist. \n\nWiderspruchs-und Beseitigungsmöglichkeit \n\nDas Abonnement des Newsletters kann durch den betroffenen Nutzer jederzeit gekündigt werden. Zu diesem Zweck findet sich in jedem Newsletter ein entsprechender Link.\n\n12.	Rechte des Nutzers\n\nSie haben als Nutzer das Recht, auf Antrag eine kostenlose Auskunft darüber zu erhalten, welche personenbezogenen Daten über Sie gespeichert wurden. Sie haben außerdem das Recht auf Berichtigung falscher Daten und auf die Verarbeitungseinschränkung oder Löschung Ihrer personenbezogenen Daten. Falls zutreffend, können Sie auch Ihr Recht auf Datenportabilität geltend machen. Sollten Sie annehmen, dass Ihre Daten unrechtmäßig verarbeitet wurden, können Sie eine Beschwerde bei der zuständigen Aufsichtsbehörde einreichen.\n\nLöschung von Daten\n\nSofern Ihr Wunsch nicht mit einer gesetzlichen Pflicht zur Aufbewahrung von Daten (z. B. Vorratsdatenspeicherung) kollidiert, haben Sie ein Anrecht auf Löschung Ihrer Daten. Von uns gespeicherte Daten werden, sollten sie für ihre Zweckbestimmung nicht mehr vonnöten sein und es keine gesetzlichen Aufbewahrungsfristen geben, gelöscht. Falls eine Löschung nicht durchgeführt werden kann, da die Daten für zulässige gesetzliche Zwecke erforderlich sind, erfolgt eine Einschränkung der Datenverarbeitung. In diesem Fall werden die Daten gesperrt und nicht für andere Zwecke verarbeitet.\n\n13.	Widerspruchsrecht\n\nNutzer dieser Webseite können von ihrem Widerspruchsrecht Gebrauch machen und der Verarbeitung ihrer personenbezogenen Daten zu jeder Zeit widersprechen. \n\nWenn Sie eine Berichtigung, Sperrung, Löschung oder Auskunft über die zu Ihrer Person gespeicherten personenbezogenen Daten wünschen oder Fragen bzgl. der Erhebung, Verarbeitung oder Verwendung Ihrer personenbezogenen Daten haben oder erteilte Einwilligungen widerrufen möchten, wenden Sie sich bitte an folgende E-Mail-Adresse: [E-Mail-Adresse einfügen]\n\nHinweis: Je nachdem welche personenbezogenen Daten, Cookies, Plugins etc. du auf deiner Webseite verwendest, musst du in deiner Datenschutzerklärung weitere Informationen aufführen. \n\nDazu gehören beispielsweise Informationen über:\n\n•	Die Weitergabe von Daten an Dritte und Drittanbieter\n•	Einbindungen von Diensten und Inhalten Dritter (z. B. Google-Fonts oder YouTube-Videos)\n•	Erbringung vertraglicher Leistungen\n•	Kontaktaufnahme über das Kontaktformular\n•	Verwendung von Session-Cookies\n•	Einsatz von datenverarbeitenden Anti-Spam-Plugins\n•	Nutzung des Google Remarketing-Tags\n•	Verwendung von Google+ oder Twitter-Schaltflächen\n•	Und weitere\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nGeschäftsunterlagen, die mit Word oder Excel erstellt werden, sind nicht GoBD-konform.\nMehr zum GoBD Zertifikat von sevDesk.\n\nErledige deine Büroarbeit und Buchhaltung jetzt einfach und schnell mit sevDesk – der professionellen online Buchhaltungssoftware!\nMehr über sevDesk erfahren.\n\n\n	\n',
                    style: AppTextStyles.darkMainText,
                  ),
                ),
              ),
              )],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          elevation: 0,
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage('assets/images/darkJomaLogo.png',
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenHome()),);
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (value) {
            if (value == 0) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenJobListSearch()),
              );
            }
            if (value == 1) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilLoader()),
              );
            }
            //if (value == 2) Navigator.of(context).push(...);
          },
          backgroundColor: AppColors().darkPrimaryColor,
          selectedItemColor: AppColors().white,
          unselectedItemColor: AppColors().white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AppIcons().searchGlass,
              label: 'Suchen',
            ),
            BottomNavigationBarItem(
              icon: AppIcons().profile,
              label: 'Profil',
            ),
          ]
      ),
    );
  }
}
