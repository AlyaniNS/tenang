// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:tenang/user/CardKonsul.dart';
import 'package:tenang/user/Form.dart';
import 'package:tenang/user/RiwayatKonsul.dart';

class HomeUser extends StatelessWidget {
  GlobalKey<ScaffoldState> homePage = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 19, 42, 76),
          centerTitle: true,
          title: Image.asset(
            "assets/images/logo(krem).png",
            height: 80,
            fit: BoxFit.fitHeight,
          )),
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      body: ListView(
        children: [
          SizedBox(height: 50),
          Container(
              width: 100,
              height: 50,
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Text("Daftar Konselor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "Poppins",
                    color: Color.fromARGB(255, 19, 42, 76),
                  ))),
          SizedBox(height: 50),
          CarouselSlider(
            items: [
              Card1(context),
              Card2(context),
              Card3(context),
              Card4(context)
            ],
            options: CarouselOptions(
              height: 400,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              aspectRatio: 4 / 3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget Card1(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 300,
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color.fromARGB(255, 19, 42, 76),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://res.cloudinary.com/dk0z4ums3/image/upload/w_100,h_100,c_thumb,dpr_2.0/v1582184342/image_doctor/dr.%20Jiemi%20Ardian%2C%20Sp.KJ.jpg.jpg")),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            SizedBox(height: 20),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                    iconColor: Color.fromARGB(255, 255, 250, 237)),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "dr. Jiemi Ardian, Sp.KJ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 250, 237),
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                collapsed: Text(
                  "Spesialis Kedokteran Jiwa",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 250, 237), fontSize: 30),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "\nPraktik : Siloam Hospitals Bogor",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 250, 237)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Biaya Konsultasi: Rp360.000",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 250, 237)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => FormKonsul()));
                      },
                      child: Text("Daftar",
                          style: TextStyle(
                            color: Color.fromARGB(255, 19, 42, 76),
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 250, 237),
                      ),
                    )
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget Card2(BuildContext context) {
  return ExpandableNotifier(
      child: Container(
    width: MediaQuery.of(context).size.width / 2,
    height: 300,
    padding: const EdgeInsets.all(10),
    child: Card(
      color: Color.fromARGB(255, 19, 42, 76),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://res.cloudinary.com/dk0z4ums3/image/upload/w_100,h_100,c_thumb,dpr_2.0/v1581993909/image_doctor/dr.%20Chandra%20Irawan%2C%20Sp.KJ.jpg.jpg")),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          SizedBox(height: 20),
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                  iconColor: Color.fromARGB(255, 255, 250, 237)),
              header: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "dr. Chandra Irawan, Sp.KJ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 250, 237),
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
              collapsed: Text(
                "Spesialis Kedokteran Jiwa",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 250, 237), fontSize: 30),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "\nPraktik : RS Mulia Pajajaran",
                    style: TextStyle(color: Color.fromARGB(255, 255, 250, 237)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Biaya Konsultasi: Rp160.000",
                    style: TextStyle(color: Color.fromARGB(255, 255, 250, 237)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FormKonsul()));
                    },
                    child: Text("Daftar",
                        style: TextStyle(
                          color: Color.fromARGB(255, 19, 42, 76),
                        )),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 250, 237),
                    ),
                  )
                ],
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  ));
}

Widget Card3(BuildContext context) {
  return ExpandableNotifier(
      child: Container(
    width: MediaQuery.of(context).size.width / 2,
    height: 300,
    padding: const EdgeInsets.all(10),
    child: Card(
      color: Color.fromARGB(255, 19, 42, 76),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://res.cloudinary.com/dk0z4ums3/image/upload/w_100,h_100,c_thumb,dpr_2.0/v1581496127/image_doctor/dr.%20Irna%20Permanasari%20Gani%2C%20Sp.KJ1.jpg.jpg")),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          SizedBox(height: 20),
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                  iconColor: Color.fromARGB(255, 255, 250, 237)),
              header: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "dr. Irna Permanasari Gani, Sp.KJ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 250, 237),
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
              collapsed: Text(
                "Spesialis Kedokteran Jiwa",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 250, 237), fontSize: 30),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "\nPraktik : Rumah Sakit Immanuel",
                    style: TextStyle(color: Color.fromARGB(255, 255, 250, 237)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Biaya Konsultasi: Rp180.000",
                    style: TextStyle(color: Color.fromARGB(255, 255, 250, 237)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FormKonsul()));
                    },
                    child: Text("Daftar",
                        style: TextStyle(
                          color: Color.fromARGB(255, 19, 42, 76),
                        )),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 250, 237),
                    ),
                  )
                ],
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  ));
}

Widget Card4(BuildContext context) {
  return ExpandableNotifier(
      child: Container(
    width: MediaQuery.of(context).size.width / 2,
    height: 300,
    padding: const EdgeInsets.all(10),
    child: Card(
      color: Color.fromARGB(255, 19, 42, 76),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://res.cloudinary.com/dk0z4ums3/image/upload/w_100,h_100,c_thumb,dpr_2.0/v1533519074/image_doctor/Endah%20Ronawulan.jpg.jpg")),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          SizedBox(height: 20),
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                  iconColor: Color.fromARGB(255, 255, 250, 237)),
              header: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "dr. Endah Ronawulan, Sp.KJ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 250, 237),
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
              collapsed: Text(
                "Spesialis Kedokteran Jiwa",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 250, 237), fontSize: 30),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "\nPraktik : dr. Endah Ronawulan, Sp.KJ",
                    style: TextStyle(color: Color.fromARGB(255, 255, 250, 237)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Biaya Konsultasi: Rp500.000",
                    style: TextStyle(color: Color.fromARGB(255, 255, 250, 237)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FormKonsul()));
                    },
                    child: Text("Daftar",
                        style: TextStyle(
                          color: Color.fromARGB(255, 19, 42, 76),
                        )),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 250, 237),
                    ),
                  )
                ],
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  ));
}
