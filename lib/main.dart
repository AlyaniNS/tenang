// @dart=2.9

// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang/cubit/navigatorUser.dart';
import 'package:tenang/globalPage/Register.dart';
import 'package:tenang/globalPage/Splashscreen.dart';
import 'package:tenang/globalPage/Login.dart';
import 'package:tenang/globalPage/Register.dart';
import 'package:tenang/user/HomeUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BottomNavCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'tenang',
          home: Splash(),
        ));
  }
}
