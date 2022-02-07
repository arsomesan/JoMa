import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joma/materials/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenCredits extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:110,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Credits'.toUpperCase(),
          textAlign: TextAlign.center,
          style: AppTextStyles.darkH1,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppBackgroundColors().darkBackground,

      body: ListView(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
        children: <Widget> [
          Container(
            height: 50,
            child: Text(
                'Diese App ist im Rahmen eines Projekts der Hochschule Fulda entstanden.',
                textAlign: TextAlign.center,
                style: AppTextStyles.darkCardTextWhite
            ),
          ),
          Container(
            height: 100,
            child: Text(
                'Wir sind ein junges Team, bestehend aus 14 Digitale Medien Studierenden, das in Begleitung von Prof. Dr. Jan-Torsten Milde und in Kooperation mit Startbahn/Perspektiva Fulda eine Jobbörsen-App, zugeschnitten auf die Schüler des Antoniusheim Fulda, entwickelt.',
                textAlign: TextAlign.center,
                style: AppTextStyles.darkCardTextWhite
            ),
          ),
          Container(
            height: 50,
            child: Text(
                'Das sind wir:',
                textAlign: TextAlign.center,
                style: AppTextStyles.darkH4White
            ),
          ),
          Container(
            height: 200,
            child: Text(
                'Adrian Somesan \n'
                    'Benny Niepoth \n'
                    'Christin Göb \n'
                    'Denis Zengerle \n'
                    'Elian Storck \n'
                    'Friederike Fenske \n'
                    'Jendrik Ludwig \n'
                    'Juliane Demir \n'
                    'Malte Schellhardt \n'
                    'Marie Hergenröder \n'
                    'Roman Herold \n'
                    'Siri Achtmann \n'
                    'Theresa Kremer \n'
                    'Tristan Grobasch \n',
                textAlign: TextAlign.center,
                style: AppTextStyles.darkCardTextWhite
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: GestureDetector(
              //onTap: 'https://www.hs-fulda.de/',
              onTap: _launchURL,
              child: Image(
                  image: AssetImage(
                    'assets/images/Hochschule_Fulda.png',
                  ),
                  height: 100,
                  width: 100
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              'Hochschule Fulda\n'
                  'University of Applied Sciences',
              textAlign: TextAlign.center,
              style: AppTextStyles.darkH4White,
            ),
          )
        ],
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.hs-fulda.de/';
  if (!await launch(url)) throw 'Could not launch $url';
}