import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:joma/controllers/data_controller.dart';
import 'package:joma/model/job_model.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:joma/screens/pdf_viewer_stub.dart'
  if (dart.library.io) 'package:joma/screens/screen_pdf_viewer_mobile.dart'
  if (dart.library.html) 'package:joma/screens/screen_pdf_viewer_web.dart';


abstract class PDFViewer implements StatefulWidget {
  final DataController data = Get.find();

  factory PDFViewer() => getPDFViewer();

  pw.Document generatePDF() {
    Job job = data.jobs.elementAt(data.getCurrentJob());
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        build: (pw.Context context) =>
            pw.Center(
              child: pw.Text('Bewerbung für Job: ' + data.jobs.elementAt(data.getCurrentJob()).title.toString()),
            ),
      ),
    );
    doc.addPage(
      pw.Page(
        build: (pw.Context context) =>
            pw.Center(
              child: pw.Text('Zweite Seite'),
            ),
      ),
    );

    return doc;
  }

}