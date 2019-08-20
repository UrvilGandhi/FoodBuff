import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Assets.dart';
import 'SignInPage.dart';
import 'SignUpPage.dart';
import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StarterPage(),
    );
  }
}

class StarterPage extends StatefulWidget {
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
//  @override
//  void initState() {
//    super.initState();
//    Future.delayed(
//        const Duration(seconds: 5),
//            () => Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => HomePage()),
//        ));
//  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  Assets.STARTER,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xff99000000)),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    Assets.LOGO,
                    color: Colors.white,
                    height: 250.0,
                    width: 300.0,
                  ),
                ),
                Container(
                  height: 75.0,
                  width: 300.0,
                  child: Text(
                    'No matter where you are : whether you are at home or in the office or on the beach- we will find you and feed you.',
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 200.0, left: 25.0),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff00Af41),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0,
                        color: Color(0xff00Af41),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
