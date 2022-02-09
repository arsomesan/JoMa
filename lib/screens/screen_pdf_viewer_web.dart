import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:joma/screens/pdf_viewer.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;

PDFViewer getPDFViewer() => ScreenPDFViewerWeb();

class ScreenPDFViewerWeb extends StatefulWidget with PDFViewer {
   ScreenPDFViewerWeb({Key? key}) : super(key: key);

  @override
  _ScreenPDFViewerWeb createState() => _ScreenPDFViewerWeb();
}

class _ScreenPDFViewerWeb extends State<ScreenPDFViewerWeb> {
  @override
  void initState() {
    super.initState();
    loadDocument(PDFViewer().generatePDF());
  }

  void loadDocument(pw.Document doc) async {
    final bytes = await doc.save();
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.window.open(url, '_blank');
    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    Navigator.pop(context);
    return const Text("Deine Bewerbung wurde als PDF im neuen Tab geöffnet. Diese Seite kann nun geschlossen werden.");
  }

}