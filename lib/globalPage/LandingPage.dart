// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tenang/globalPage/Login.dart';
import 'package:tenang/user/NavBarUser.dart';

class Landing extends StatelessWidget {
  final _controller = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  Center(
                    child: Image.asset("assets/images/LandingPage(1).png"),
                  ),
                  Center(
                    child: Image.asset("assets/images/LandingPage(2).png"),
                  ),
                  Center(
                    child: Image.asset("assets/images/LandingPage(3).png"),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              axisDirection: Axis.horizontal,
              effect: SlideEffect(
                  activeDotColor: Color.fromARGB(255, 40, 53, 75),
                  dotColor: Color.fromARGB(255, 11, 29, 44),
                  dotHeight: 10,
                  dotWidth: 10),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginPage()));
        },
        //icon: Icon(Icons.navigate_next),
        label: Text("Mulai"),
      ),
    );
  }
}
