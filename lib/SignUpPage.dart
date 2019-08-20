import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_getdrool/toats_message.dart';

import 'Assets.dart';
import 'Constant.dart';
import 'SignInPage.dart';
import 'StarterPage.dart';
import 'api_presenter.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> implements ApiViewContract {
  ApiPresenter _presenter;
  @override
  BuildContext context;

  // ignore: sort_constructors_first
  _SignUpPageState() {
    _presenter = ApiPresenter(this);
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
              margin: EdgeInsets.only(left: 15.0, top: 50.0),
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StarterPage(),
                      ),
                    );
                  });
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 28.0,
                ),
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
                          'Sign Up',
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
                        'Mention your credentials',
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
                      labelText: 'Name',
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
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Mobile',
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
                    controller: _mobileController,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Email',
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
                    controller: _emailController,
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
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Address',
                      labelStyle: TextStyle(
                        color: Color(0xff00AF41),
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    controller: _addressController,
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
                        if (_nameController.text == "") {
                          Toast.makeText(context, 'Enter name');
                        } else if (_mobileController.text == "") {
                          Toast.makeText(context, 'Enter mobile number');
                        } else if (_mobileController.text.length != 10) {
                          Toast.makeText(context, 'Invalid mobile number');
                        } else if (_emailController.text == "") {
                          Toast.makeText(context, 'Enter email');
                        } else if (EmailValidator.validate(
                                _emailController.text) ==
                            false) {
                          Toast.makeText(context, 'Enter valid email');
                        } else if (_passwordController.text == "") {
                          Toast.makeText(context, 'Enter password');
                        } else if (_passwordController.text.length < 8 ||
                            _passwordController.text.length > 12) {
                          Toast.makeText(context,
                              'Enter password of minimum 8 characters and maximum 12 characters with one letter in Uppercase and one Numeral');
                        } else if (_addressController.text == "") {
                          Toast.makeText(context, 'Enter address');
                        } else if (_addressController.text.length < 40) {
                          Toast.makeText(context, 'Enter valid address');
                        } else {
                          registerApi();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
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
                              builder: (context) => SignInPage(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Already Registered ? Goto Sign-In',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Color(0xff00AF41),
                          fontSize: 14.0,
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

  void registerApi() {
    Map<String, Object> map = HashMap();
    map['userid'] = "";
    map['email_id'] = _emailController.text;
    map['name'] = _nameController.text;
    map['address'] = _addressController.text;
    map['password'] = _passwordController.text;
    map['mobilenumber'] = _mobileController.text;
    map['username'] = "";

    _presenter.loadData(
        context, Constant.registerApiName, map, Constant.registerApiReq);
    /*Route route = MaterialPageRoute(builder: (context) => HomePage());
    Navigator.pushReplacement(context, route);*/
  }

  @override
  void onApiResponseComplete(BuildContext mContext, Object items, int index) {
    print(items);
    Map map = items;
    if (map['response'] == "true") {
      Route route = MaterialPageRoute(builder: (context) => SignInPage());
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
