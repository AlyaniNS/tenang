import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'CardKonsul.dart';

class MainPage extends StatelessWidget {
  final TextEditingController nama = TextEditingController();
  final TextEditingController keluhan = TextEditingController();
  final TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference konsultasi = firestore.collection("konsultasi");

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
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 15),
              child: Text(
                "Riwayat \nKonsultasi",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Poppins",
                  color: Color.fromARGB(255, 19, 42, 76),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView(
              children: [
                SizedBox(
                  height: 120,
                ),
                // VIEW DATA HERE
                StreamBuilder<QuerySnapshot>(
                  stream: konsultasi.snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            children: snapshot.data!.docs
                                .map(
                                  (e) => ItemCard(
                                    e.get('nama'),
                                    e.get('namaDokter'),
                                    e.get('tanggal'),
                                    e.get('keluhan'),
                                    e.get('jenisKonsul'),
                                    onUpdate: () {},
                                    onDelete: () {
                                      konsultasi.doc(e.id).delete();
                                    },
                                  ),
                                )
                                .toList(),
                          )
                        : Text('Loading...');
                  },
                ),
                SizedBox(height: 150)
              ],
            ),
          ],
        ));
  }
}
