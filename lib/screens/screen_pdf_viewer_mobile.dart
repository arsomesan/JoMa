import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joma/materials/appbar_job.dart';
import 'package:joma/materials/assets.dart';
import 'package:joma/materials/navbar.dart';
import 'package:joma/model/job_model.dart';
import 'package:joma/screens/pdf_viewer.dart';
import 'package:joma/screens/screen_home.dart';
import 'package:joma/screens/screen_joblist_search.dart';
import 'package:joma/screens/screen_settings.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

PDFViewer getPDFViewer() => ScreenPDFViewerMobile();

class ScreenPDFViewerMobile extends StatefulWidget with PDFViewer {
  ScreenPDFViewerMobile({Key? key}) : super(key: key);

  @override
  _ScreenPDFViewerMobile createState() => _ScreenPDFViewerMobile();
}

class _ScreenPDFViewerMobile extends State<ScreenPDFViewerMobile> {
  final _pics = [
    "assets/icons/hammer-solid.svg",
    "assets/icons/tractor-solid.svg",
    "assets/icons/hands-helping-solid.svg",
    "assets/icons/hamburger-solid.svg"
  ];

  final Job job = data.jobs.elementAt(data.getCurrentJob());
  late Color currentColor = Color(int.parse(
      data.jobCategories.elementAt(job.category as int).colorHex.toString()));
  bool _isLoading = true;
  late PdfController pdf;

  @override
  void initState() {
    super.initState();
    loadDocument(PDFViewer().generatePDF());
  }

  void loadDocument(pw.Document doc) async {
    final dir = await getApplicationSupportDirectory();
    final jobTitle = job.title.toString().replaceAll('/', '').replaceAll('\\', '').replaceAll(' ', '-');
    final filename = "Bewerbung_" + jobTitle + "_" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf";
    final file = File("${dir.path}/$filename");
    await file.writeAsBytes(await doc.save());

    pdf = PdfController(
      document: PdfDocument.openFile("${dir.path}/$filename"),
      viewportFraction: 2.0,
    );

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().white,
      appBar: AppBarJobArea(
        blocked: 0,
        bgColor: AppColors().white,
        bgColorBar: currentColor,
        circleColor: currentColor,
        color: currentColor,
        title: "BEWERBUNG",
        hoehe: 230,
        imageUrl: _pics[job.category as int],
        onPressed1: () {
          Navigator.of(context).pop();
        },
      ),
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
        backgroundColor: currentColor,
        selectedItemColor: AppColors().white,
        unselectedItemColor: AppColors().white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : PdfView(
              controller: pdf,
              scrollDirection: Axis.vertical,
              pageBuilder: (
                Future<PdfPageImage> pageImage,
                int index,
                PdfDocument document,
              ) =>
                  PhotoViewGalleryPageOptions(
                imageProvider: PdfPageImageProvider(
                  pageImage,
                  index,
                  document.id,
                ),
                minScale: PhotoViewComputedScale.contained * 1,
                maxScale: PhotoViewComputedScale.contained * 3.0,
                initialScale: PhotoViewComputedScale.contained * 2.0,
                heroAttributes:
                    PhotoViewHeroAttributes(tag: '${document.id}-$index'),
              ),
            ),
    );
  }
}
