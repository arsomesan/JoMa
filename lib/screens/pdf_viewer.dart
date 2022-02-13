import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/model/job_model.dart';
import 'package:joma/model/profil_model.dart';
import 'package:joma/utils/user_simple_preferences.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:joma/screens/pdf_viewer_stub.dart'
    if (dart.library.io) 'package:joma/screens/screen_pdf_viewer_mobile.dart'
    if (dart.library.html) 'package:joma/screens/screen_pdf_viewer_web.dart';

abstract class PDFViewer implements StatefulWidget {
  final DataController data = Get.find();

  factory PDFViewer() => getPDFViewer();

  pw.Document generatePDF() {
    var remoteUser = profilToJson(data.profile);
    var tmpUser = profilFromJson(
        UserSimplePreferences.getUser() ?? remoteUser.toString());
    Profil user = tmpUser[0];

    Job job = data.jobs.elementAt(data.getCurrentJob());
    final doc = pw.Document();

    doc.addPage(
      pw.MultiPage(
        build: (pw.Context context) => [
          pw.Partitions(
            children: [
              pw.Partition(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: <pw.Widget>[
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 30)),
                        pw.Text(user.vorname.toString() +
                            ' ' +
                            user.name.toString() +
                            ' - ' +
                            user.adresse!.strasse.toString() +
                            ' ' +
                            user.adresse!.hausnummer.toString() +
                            ', ' +
                            user.adresse!.plz.toString() +
                            ' ' +
                            user.adresse!.ort.toString()),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                        pw.Text(job.company.toString(),
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(fontWeight: pw.FontWeight.bold)),
                        pw.Text('z.H. ' + job.contactPerson!.firstname.toString() + ' ' + job.contactPerson!.lastname.toString()),
                        pw.Text(job.address!.street.toString()),
                        pw.Text(job.address!.zip.toString() +
                            ' ' +
                            job.address!.city.toString()),
                      ],
                    ),
                    pw.Container(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 50)),
                          pw.Text(
                              'Bewerbung auf Ihr Stellenangebot "' +
                                  job.title.toString() +
                                  '"',
                              textScaleFactor: 1.5,
                              style: pw.Theme.of(context)
                                  .defaultTextStyle
                                  .copyWith(fontWeight: pw.FontWeight.bold)),
                        ],
                      ),
                    ),
                    pw.Container(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 50)),
                          pw.Text('Sehr geehrte Damen und Herren,'),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 15)),
                          pw.Text(
                              'mit großem Interesse bin ich in der App JOMA auf die ausgeschriebene Stelle aufmerksam geworden.'),
                          pw.Text(
                              'Die beschriebenen Aufgabenstellungen entsprechen genau meinen Wünschen und passen sehr gut zu meinem Anforderungsprofil.'),
                        ],
                      ),
                    ),
                    pw.Container(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 10)),
                          pw.Text(
                              'In die neuen Aufgaben bei Ihnen kann ich mich mit meinen verschiedenen Stärken einbringen.'
                              ' Meine Fähigkeiten liegen verstärkt in den folgenden Bereichen:'),
                          pw.Padding(padding: const pw.EdgeInsets.only(bottom: 10)),
                          for (int i = 0; i < user.skills!.length; i++)
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Padding(
                                    padding: const pw.EdgeInsets.only(left: 10)),
                                pw.Text('- ' +
                                    data.skills
                                        .elementAt(data.skills.indexWhere(
                                            (skill) =>
                                                skill.id == user.skills![i]))
                                        .title
                                        .toString()),
                              ],
                            ),
                        ],
                      ),
                    ),
                    pw.Container(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 10)),
                          pw.Text(
                              'Mit mir gewinnt Ihr Unternehmen eine Person, die motiviert und begeisterungsfähig ist.'),
                          pw.Text(
                              'Konnte ich Sie mit dieser Bewerbung überzeugen?'),
                          pw.Text(
                              'Einen vertiefenden Eindruck gebe ich Ihnen gerne in einem ersten Gespräch.'),
                        ],
                      ),
                    ),
                    pw.Container(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 10)),
                          pw.Text('Ich freue mich über Ihre Einladung!'),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 15)),
                          pw.Text('Mit freundlichen Grüßen'),
                          pw.Text(user.vorname.toString() +
                              ' ' +
                              user.name.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return doc;
  }
}
