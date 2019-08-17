import 'package:flutter/material.dart';
import 'Assets.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPage createState() => _PaymentPage();
}

class _PaymentPage extends State<PaymentPage> {
  bool isLiked = false;
  bool isAdded = false;
  String radiovalue;

  TextEditingController _cvvController;
  int quantity = 0;
  int selectedMenu = 20;

  // ignore: always_declare_return_types
  setRadioValue(String value) {
    radiovalue = value;
    print(radiovalue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 30.0,
                    right: 15.0,
                    bottom: 15.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 28.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.crop_square,
                              size: 28.0,
                            ),
                            Icon(
                              Icons.location_on,
                              size: 28.0,
                            ),
                            Icon(
                              Icons.filter_list,
                              size: 28.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 74,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(
                              left: 25.0,
                              top: 10.0,
                              bottom: 10.0,
                            ),
                            child: Text(
                              'CARD',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 75.0,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Radio(
                                            value: '0',
                                            groupValue: radiovalue,
                                            onChanged: (String value) {
                                              setRadioValue(value);
                                            },
                                            activeColor: Color(0xff00AF41),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0, left: 10.0),
                                        child: Image.network(
                                          'https://logos-download.com/wp-content/uploads/2016/06/Yes_Bank_logo.png',
                                          height: 50.0,
                                          width: 75.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0, left: 25.0, bottom: 8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Yes Bank',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              '**** **** 3525 ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 15.0,left: 90.0),
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: Colors.grey[300],
                                            width: 1.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: TextFormField(
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: false,
                                                  signed: false),
                                          textInputAction: TextInputAction.done,
                                          controller: _cvvController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'CVV',
                                            hintStyle: TextStyle(
                                              color: Colors.grey[300],
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 1.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: 15.0,
                              left: 25.0,
                              top: 15.0,
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 20,
                                      child: Text(
                                        'YOUR PAYMENT METHOD',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 15.0),
                                color: Colors.white,
                                height: 75.0,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8.0, left: 10.0),
                                                child: Image.asset(
                                                  Assets.DEBITCARD,
                                                  height: 30.0,
                                                  width: 30.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0, left: 25.0, bottom: 8.0),
                                                child: Text(
                                                  'Debit Card',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Radio(
                                            value: '1',
                                            groupValue: radiovalue,
                                            onChanged: (String value) {
                                              setRadioValue(value);
                                            },
                                            activeColor: Color(0xff00AF41),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: 75.0,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8.0, left: 10.0),
                                                child: Image.asset(Assets.CREDITCARD,
                                                  height: 30.0,
                                                  width: 30.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25.0, left: 25.0, bottom: 8.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'Credit Card',
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.black,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Radio(
                                            value: '2',
                                            groupValue: radiovalue,
                                            onChanged: (String value) {
                                              setRadioValue(value);
                                            },
                                            activeColor: Color(0xff00AF41),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: 75.0,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8.0, left: 10.0),
                                                child: Image.asset(Assets.PAYPAL,
                                                  height: 30.0,
                                                  width: 30.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30.0, left: 25.0, bottom: 8.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'PayPal',
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.black,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Radio(
                                            value: '3',
                                            groupValue: radiovalue,
                                            onChanged: (String value) {
                                              setRadioValue(value);
                                            },
                                            activeColor: Color(0xff00AF41),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: 75.0,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8.0, left: 10.0),
                                                child: Image.asset(
                                                  Assets.CASHONDELIVERY,
                                                  height: 30.0,
                                                  width: 30.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30.0, left: 25.0, bottom: 8.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'Cash On Delivery',
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.black,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Radio(
                                            value: '4',
                                            groupValue: radiovalue,
                                            onChanged: (String value) {
                                              setRadioValue(value);
                                            },
                                            activeColor: Color(0xff00AF41),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              height: 55.0,
              color: Color(0xff00AF41),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 25.0, top: 10.0),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: <Widget>[
                          Text(
                            '6 Items',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '\$ 1500.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50.0,
                        padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
                        margin: EdgeInsets.only(
                            bottom: 8.0, top: 8.0, right: 25.0, left: 25.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.yellow[700],
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
