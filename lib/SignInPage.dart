import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getdrool/preference.dart';

import 'Assets.dart';
import 'Constant.dart';
import 'SignUpPage.dart';
import 'api_presenter.dart';
import 'homePage.dart';
import 'toats_message.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> implements ApiViewContract {
  ApiPresenter _presenter;
  @override
  BuildContext context;

  // ignore: sort_constructors_first
  _SignInPageState() {
    _presenter = ApiPresenter(this);
  }

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      body: Builder(builder: (context) {
        this.context = context;
        return Stack(
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
                color: Color(0xffBF000000),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(left: 45.0, bottom: 75.0, right: 45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      right: 25.0,
                      left: 25.0,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 36.0,
                              color: Color(0xff00AF41),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 25.0),
                      child: Text(
                        'Enter your credentials',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Color(0xff00AF41),
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    controller: _usernameController,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color(0xff00AF41),
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    obscureText: true,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    controller: _passwordController,
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      right: 25.0,
                      bottom: 25.0,
                      left: 25.0,
                    ),
                    child: RaisedButton(
                      color: Color(0xff00AF41),
                      onPressed: () {
                        if(_usernameController.text == ""){
                          Toast.makeText(context, 'Enter valid username');
                        }else if(_passwordController.text == ''){
                          Toast.makeText(context, 'Enter valid password');
                        }else{
                          loginApi();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15.0,
                    ),
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
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
                      child: Text(
                        'New to FoodBuff ? Goto Sign-Up',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Color(0xff00AF41),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  void loginApi() {
    Map<String, Object> map = HashMap();
    map['password'] = _passwordController.text;
    map['username'] = _usernameController.text;

    _presenter.loadData(
        context, Constant.loginApiName, map, Constant.loginApiReq);
  }

  @override
  void onApiResponseComplete(BuildContext mContext, Object items, int index) {
    print(items);
    Map map = items;
    if (map['response'] == "true") {
      PreferenceManager()
          .setPref(Constant.userID, map["loggeduser"]["id"].toString());
      PreferenceManager()
          .setPref(Constant.name, map["loggeduser"]["name"].toString());
      PreferenceManager()
          .setPref(Constant.email, map["loggeduser"]["email_id"].toString());
      PreferenceManager()
          .setPref(Constant.mobileNo, map["loggeduser"]["mobilenumber"].toString());
      PreferenceManager().setPref(
          Constant.address, map["loggeduser"]["address"].toString());
      Route route = MaterialPageRoute(builder: (context) => HomePage());
      Navigator.pushReplacement(this.context, route);
      Toast.makeText(this.context, map['message']);
    } else {
      Toast.makeText(this.context, map['message']);
    }
    /*Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(map['message']),
    ));*/
    // TODO: implement onLoadLoginComplete
  }

  @override
  void onApiResponseError(BuildContext mContext, String error, int index) {
    print(error);
    // TODO: implement onLoadLoginError
  }
}
