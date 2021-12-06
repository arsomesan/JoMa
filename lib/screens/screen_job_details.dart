import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joma/screens/screen_home.dart';

import 'joblist_search_screen.dart';

class ScreenJobDetails extends StatelessWidget {
  const ScreenJobDetails({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Soziales & Hauswirtschaft'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            onTap: (value) {
              if (value == 0) Navigator.push(context, MaterialPageRoute(builder: (context) => const JobListSearchScreen()),
              );
              //if (value == 1) Navigator.of(context).push(...);
              //if (value == 2) Navigator.of(context).push(...);
            },
            backgroundColor: Colors.grey,
            selectedItemColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Suchen',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ]
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        body: ListView(
          children: [
            Image.network(
              'https://www.rose-galabau.de/wp-content/uploads/2021/10/Rose-landschaftsbau-gruenflaechenpflege-gewerbliche-landschaftsgaertner-pflasterarbeiten.jp_.jpg',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(44, 10, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pflege der Grünflächen",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                //onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin:
                      EdgeInsets.symmetric(horizontal: 3.0, vertical: 15.0),
                      decoration: BoxDecoration(color: Colors.black),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            'Tätigkeit $i',
                            style:
                            TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(44, 10, 44, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.blueGrey,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(27, 10, 15, 15),
                      child: Column(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                image: AssetImage('icons/comments-solid.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "Fähigkeit 1",
                              style: TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                      child: Column(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                image: AssetImage('icons/walking-solid.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "Fähigkeit 2",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                      child: Column(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                image: AssetImage(
                                    'icons/assistive-listening-systems-solid.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "Fähigkeit 3",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 17, 15),
                      child: Column(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                image: AssetImage('icons/swimmer-solid.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "Fähigkeit 4",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 30, 0, 0),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Schulabschluss",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(65, 0, 40, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      minRadius: 50,
                      maxRadius: 50,
                      child: Image(
                        image: AssetImage('icons/user-graduate-solid.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*FlutterMap(
                options: MapOptions(
                  center: LatLng(50.5647222222, 9.6875),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return Text("© OpenStreetMap contributors");
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(51.5, -0.09),
                        builder: (ctx) =>
                            Container(
                              child: FlutterLogo(),
                            ),
                      ),
                    ],
                  ),
                ],
            ),*/
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Image(
                image: AssetImage('images/maps.PNG'),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(115, 30, 0, 0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    minRadius: 25,
                    maxRadius: 25,
                    child: Image(image: AssetImage('icons/google-brands.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                  child: Column(
                    children: [
                      Text("Hochschule Fulda",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                      Text("Leipziger Str. 123",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                      Text("36037 Fulda",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                    "Bewerben"
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ));
  }
}
