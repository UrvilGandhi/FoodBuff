import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Assets.dart';
import 'StarterPage.dart';
import 'homePage.dart';



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff00Af41),
      body: Container(
        padding: EdgeInsets.all(15.0),
        color: Color(0xff00AF41),
        alignment: Alignment.center,
        child: Image.asset(
          Assets.LOGO,
          color: Colors.white,
        ),
      ),
    );
  }
}
