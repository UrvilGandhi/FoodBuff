import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Assets.dart';
import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 10),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ));
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
