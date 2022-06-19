import 'package:flutter/material.dart';
import 'package:tenang/globalPage/Login.dart';

class ProfilUser extends StatelessWidget {
  const ProfilUser({Key? key}) : super(key: key);

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
      body: Center(
        child: FloatingActionButton.extended(
          backgroundColor: Color.fromARGB(255, 19, 42, 76),
          label: Column(
            children: [Icon(Icons.logout), Text("Logout")],
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => LoginPage()));
          },
        ),
      ),
    );
  }
}
