import 'package:flutter/material.dart';
import 'package:joma/screens/screen_home.dart';

class SelectView extends StatefulWidget {
  const SelectView({Key? key}) : super(key: key);

  @override
  State<SelectView> createState() => _UserViewState();
}

class _UserViewState extends State<SelectView> {
  var _state1 = false;
  var _state2 = false;
  var _state3 = false;

  void _handleTap1(){
    setState(() {
      _state1 = true;
      _state2 = false;
      _state3 = false;
    });
  }

  void _handleTap2(){
    setState(() {
      _state1 = false;
      _state2 = true;
      _state3 = false;
    });
  }

  void _handleTap3(){
    setState(() {
      _state1 = false;
      _state2 = false;
      _state3 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BEREICH WÄHLEN',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Marcellus', fontSize: 20),
          ),
        ),
        backgroundColor: const Color.fromRGBO(129, 129, 129, 1),
      ),
      body: Center(
        child: Column(
          children: [

            Flexible(
              child: GestureDetector(
                onTap: _handleTap1,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Flexible(
                        child: Ink.image(
                          image: const NetworkImage(
                              'https://source.unsplash.com/random/800x600?house'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: const Text("Nur Bilder"),
                      ),
                    ],
                  ),
                  color: ((){
                    if(_state1) {
                      return const Color.fromRGBO(184, 219, 255, 1.0);
                    } else {
                      return Colors.white;
                    }
                  }()),
                  shape: Border.all(
                    color: ((){
                      if(_state1) {
                        return Colors.blue;
                      } else {
                        return Colors.black;
                      }
                    }()),
                  ),

                ),
              ),
              flex: 1,
            ),

            const SizedBox(height: 15), // Für Abstand zwischen boxen
            Flexible(
              child: GestureDetector(
                onTap: _handleTap2,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Flexible(
                        child: Ink.image(
                          image: const NetworkImage(
                              'https://source.unsplash.com/random/800x600?house'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(

                        padding: EdgeInsets.all(16.0),
                        child: const Text("Leichte Sprache"),
                      ),
                    ],
                  ),
                  color: ((){
                    if(_state2) {
                      return const Color.fromRGBO(184, 219, 255, 1.0);
                    } else {
                      return Colors.white;
                    }
                  }()),
                  shape: Border.all(
                    color: ((){
                      if(_state2) {
                        return Colors.blue;
                      } else {
                        return Colors.black;
                      }
                    }()),
                  ),

                ),
              ),
              flex: 1,
            ),


            const SizedBox(height: 15),
            Flexible(
              child: GestureDetector(
                onTap: _handleTap3,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Flexible(
                        child: Ink.image(
                          image: const NetworkImage(
                              'https://source.unsplash.com/random/800x600?house'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: const Center(child: Text("Volltext",)),
                      ),
                    ],
                  ),
                  color: ((){
                    if(_state3) {
                      return const Color.fromRGBO(184, 219, 255, 1.0);
                    } else {
                      return Colors.white;
                    }
                  }()),
                  shape: Border.all(
                    color: ((){
                      if(_state3) {
                        return Colors.blue;
                      } else {
                        return Colors.black;
                      }
                    }()),
                  ),

                ),
              ),
              flex: 1,
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black12,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Weiter",
                style: TextStyle(fontFamily: 'Marcellus', fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}