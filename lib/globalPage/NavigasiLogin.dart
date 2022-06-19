import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tenang/admin/NavBarAdmin.dart';
import 'package:tenang/globalPage/LoginModel.dart';
import 'package:tenang/user/NavBarUser.dart';
import 'Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    return control();
  }
}

class control extends StatefulWidget {
  control();

  @override
  _controlState createState() => _controlState();
}

class _controlState extends State<control> {
  _controlState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var role;
  var email;
  var id;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        email = loggedInUser.email.toString();
        role = loggedInUser.role.toString();
        id = loggedInUser.uid.toString();
        print(
            "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
        print(id);
        print(
            "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
      });
    });
  }

  routing() {
    if (role == 'Pasien') {
      return NavbarUser(
        id: id,
      );
    } else {
      return NavbarAdmin(
        id: id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    CircularProgressIndicator();
    return routing();
  }
}
