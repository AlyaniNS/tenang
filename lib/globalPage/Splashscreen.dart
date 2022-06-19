// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tenang/globalPage/LandingPage.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      splash: Center(
        child: Image.asset("assets/images/logoSplash.png"),
      ),
      duration: 5000,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: Landing(),
    );
  }
}
