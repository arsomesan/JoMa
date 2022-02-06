import 'dart:html';

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class ScreenPDFViewer extends StatelessWidget{
  final String pathPDF;

  ScreenPDFViewer({Key? key, required this.pathPDF}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(),
        );
  }

}