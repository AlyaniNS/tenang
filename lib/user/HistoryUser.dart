// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tenang/user/CardKonsul.dart';
import 'package:tenang/user/RiwayatBayar.dart';
import 'package:tenang/user/RiwayatKonsul.dart';

class HistoryUser extends StatelessWidget {
  const HistoryUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 19, 42, 76),
          centerTitle: true,
          title: Image.asset(
            "assets/images/logo(krem).png",
            height: 80,
            fit: BoxFit.fitHeight,
          )),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: 150,
            color: Color.fromARGB(255, 19, 42, 76),
            child: Column(
              children: [
                SizedBox(height: 80),
                IconButton(
                    icon: Icon(Icons.medical_information),
                    color: Color.fromARGB(255, 255, 250, 237),
                    iconSize: 50,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MainPage()));
                    }),
                SizedBox(height: 50),
                Text("Konsultasi",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromARGB(255, 255, 250, 237),
                        fontSize: 20))
              ],
            ),
          ),
          SizedBox(width: 50),
          Container(
              height: 250,
              width: 150,
              color: Color.fromARGB(255, 19, 42, 76),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  IconButton(
                      icon: Icon(Icons.payments_rounded),
                      color: Color.fromARGB(255, 255, 250, 237),
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RiwayatBayar()));
                      }),
                  SizedBox(height: 50),
                  Text("Pembayaran",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 255, 250, 237),
                          fontSize: 20))
                ],
              ))
        ],
      )),
    );
  }
}
