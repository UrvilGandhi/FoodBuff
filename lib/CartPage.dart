import 'package:flutter/material.dart';
import 'Assets.dart';
import 'PaymentPage.dart';
import 'homePage.dart';
import 'menu_page.dart';
import 'Constant.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  bool isLiked = false;
  bool isAdded = false;

  List<String> _locations = ['Small', 'Medium', 'Large', 'Jumbo']; // Option 2
  String _selectedLocation;

  int quantity = 0;
  int selectedMenu = 20;

  void add() {
    setState(
      () {
        quantity++;
      },
    );
  }

  void minus() {
    setState(
      () {
        if (quantity != 0) {
          quantity--;
        }
      },
    );
  }

  final List<MenuItem> options = [
    MenuItem(Constant.Recommended, null, 'Recommended'),
    MenuItem(Constant.Popular, null, 'Popular'),
    MenuItem(Constant.Soup, null, 'Soups'),
    MenuItem(Constant.Starters, null, 'Starters'),
    MenuItem(Constant.Mains, null, 'Mains'),
    MenuItem(Constant.Beverages, null, 'Beverages'),
    MenuItem(Constant.Desserts, null, 'Desserts'),
  ];

  final List<String> imgList = [
    'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?cs=srgb&dl=burrito-chicken-close-up-461198.jpg&fm=jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT43GN3ZTwveusFop2eLUPqsbb5NmlsD9ZmSvOMLBpq0lPLy5OS',
    'http://img1.wsimg.com/isteam/stock/2999',
    'http://www.indian-by-nature.com/wp-content/uploads/2018/06/862638.jpg',
    'https://cdn-image.foodandwine.com/sites/default/files/1510583448/paper-dosa-2-south-indian-food-FT-BLOG1117.jpg',
    'https://www.newyorkminutemag.com/wp-content/uploads/2012/10/35094182543_f52a0ec1c5_b.jpg'
  ];

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
                          'Cart',
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
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: <Widget>[
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(0.0),
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: Colors.white,
                                height: 75.0,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 7,
                                            child: Column(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 5.0,
                                                                left: 10.0,
                                                                right: 10.0),
                                                        child: Text(
                                                          'Fried Rice',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontStyle:
                                                                FontStyle
                                                                    .normal,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(
                                                            () {

                                                            },
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0,
                                                                  left: 10.0,
                                                                  right:
                                                                      10.0),
                                                          child: Icon(
                                                            Icons.cancel,
                                                            size: 22.0,
                                                            color:
                                                                Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 8.0,
                                                                bottom: 8.0,
                                                                left: 10.0),
                                                            child: Image.network(
                                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAaMDarjrwn37a-_5aFImCgg7ZLnG3vlN0TrDmZ08Xnk0p7E6w9w',
                                                              width: 20.0,
                                                              height: 20.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                              left: 8.0,
                                                                top: 8.0,
                                                                bottom: 8.0,
                                                                right: 10.0),
                                                            child:
                                                            DropdownButtonHideUnderline(
                                                              child:
                                                              DropdownButton(
                                                                hint: Text(
                                                                    'Select Qty'),
                                                                value:
                                                                _selectedLocation,
                                                                onChanged:
                                                                    (newValue) {
                                                                  setState(
                                                                        () {
                                                                      _selectedLocation =
                                                                          newValue;
                                                                    },
                                                                  );
                                                                },
                                                                items: _locations
                                                                    .map(
                                                                      (location) {
                                                                    return DropdownMenuItem(
                                                                      child: Text(
                                                                          location),
                                                                      value:
                                                                      location,
                                                                    );
                                                                  },
                                                                ).toList(),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 8.0,
                                                                bottom: 8.0,
                                                                left: 10.0,),
                                                            child: Text(
                                                              ' \$50.00',
                                                              textAlign:
                                                              TextAlign.start,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                color:
                                                                Colors.black,
                                                                fontStyle:
                                                                FontStyle
                                                                    .normal,
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 8.0,
                                                                left: 10.0,
                                                                top: 8.0),
                                                            child: Container(
                                                              padding:
                                                              EdgeInsets.all(
                                                                  3.0),
                                                              margin:
                                                              EdgeInsets.only(
                                                                  right: 8.0),
                                                              width: 60.0,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5.0),
                                                                border:
                                                                Border.all(
                                                                  color: Color(
                                                                      0xff00AF41),
                                                                  width: 1.0,
                                                                  style:
                                                                  BorderStyle
                                                                      .solid,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  GestureDetector(
                                                                    onTap: minus,
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 15.0,
                                                                      color: Color(
                                                                          0xff00AF41),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    quantity == 0 ? '1' : '$quantity',
                                                                    style:
                                                                    TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                      12.0,
                                                                      fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                    ),
                                                                    textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                    maxLines: 1,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: add,
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 15.0,
                                                                      color: Color(
                                                                          0xff00AF41),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
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
                              );
                            },
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: 15.0,
                                        left: 15.0,
                                        top: 15.0,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 20,
                                                child: Text(
                                                  'Alfred Pennyworth',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Address:- 2314, Parker Street, Queens, NYC',
                                                style: TextStyle(
                                                  fontSize: 13.0,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(3.0),
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(8.0),
                                                  border: Border.all(
                                                    color: Color(0xff00AF41),
                                                    width: 1.0,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                child: Text(
                                                  'HOME',
                                                  style: TextStyle(
                                                    color: Color(0xff00AF41),
                                                    fontSize: 12.0,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Contact Number :- (+91) 910-493-6913',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14.0,
                                                ),
                                                maxLines: 3,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey,
                                            width: 1.0,
                                            style: BorderStyle.solid,
                                          ),
                                          top: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3.0, top: 3.0),
                                            child: Text(
                                              'Edit/Change Address',
                                              style: TextStyle(
                                                color: Color(0xff00AF41),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.0,
                                            height: 36.0,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3.0, bottom: 3.0),
                                            child: Text(
                                              'Add New Address',
                                              style: TextStyle(
                                                color: Color(0xff00AF41),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey,
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Instructions for ordering food ? Tap here ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey,
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Image.asset(
                                              Assets.COUPON,
                                              width: 30.0,
                                              height: 30.0,
                                              color: Colors.black,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              'Apply Coupon',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              alignment: Alignment.bottomRight,
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.black,
                                                size: 28.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 15.0,top: 15.0,left: 5.0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    'Payment Details :',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 5.0,top: 3.0,right: 10.0,left: 10.0,),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    'Subtotal :-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.bottomRight,
                                                    child: Text(
                                                      '\$ 156.00',
                                                      style: TextStyle(
                                                        color: Color(0xff00AF41),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 3.0,bottom: 5.0,),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    'Delivery :-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.bottomRight,
                                                    child: Text(
                                                      '\$ 10.00',
                                                      style: TextStyle(
                                                        color: Color(0xff00AF41),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 2.0,top: 3.0,right: 10.0,left: 10.0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 10,
                                                  child: Text(
                                                    'Coupon Discount :-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment: Alignment.bottomRight,
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.yellow[700],
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.bottomRight,
                                                    child: Text(
                                                      '\$ 10.00',
                                                      style: TextStyle(
                                                        color: Color(0xff00AF41),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey[800],
                                            height: 2.0,
                                            indent: 5.0,
                                            endIndent: 5.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 3.0,bottom: 2.0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    'Total :-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.bottomRight,
                                                    child: Text(
                                                      '\$ 156.00',
                                                      style: TextStyle(
                                                          color: Color(0xff00AF41)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50.0,
                        padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
                        margin: EdgeInsets.only(
                            bottom: 8.0, top: 8.0, right: 25.0, left: 25.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff008c34),
                        ),
                        child: Text(
                          'Checkout',
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
