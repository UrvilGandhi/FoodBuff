import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'Assets.dart';
import 'CartPage.dart';
import 'homePage.dart';
import 'menu_page.dart';
import 'Constant.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  bool isLiked = false;
  bool isAdded = false;

  int quantity = 0;
  int selectedMenu = 20;

  void add() {
    setState(() {
      quantity++;
    });
  }

  void minus() {
    setState(() {
      if (quantity != 0) {
        quantity--;
      }
    });
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
                  padding:
                      EdgeInsets.only(top: 30.0, right: 15.0, bottom: 15.0),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
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
                          'Ochre Restuarant',
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
                            margin: EdgeInsets.only(top: 3.0),
                            child: CarouselSlider(
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              initialPage: 1,
                              enableInfiniteScroll: true,
                              items: imgList.map(
                                (url) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Image.network(
                                          url,
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ).toList(),
                            ),
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
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 15.0,
                                      left: 15.0,
                                      top: 15.0,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 20,
                                          child: Text(
                                            'Ochre Restuarant',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Icon(
                                            Icons.star,
                                            size: 15.0,
                                            color: Colors.yellow[800],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            color: Colors.green,
                                            padding: EdgeInsets.all(2.0),
                                            child: Text(
                                              '4.0',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Thai,Vegeterian Friendly,Healthy',
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 15.0, right: 15.0, top: 10.0),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 10.0,
                                      right: 15.0,
                                      left: 15.0,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              size: 18.0,
                                              color: Colors.yellow[700],
                                            ),
                                            Text(
                                              ' 2314, Parker Street, Queens, NYC',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 15.0,
                                      left: 15.0,
                                    ),
                                    width: 375.0,
                                    height: 50.0,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Sitting in natures lap,have your favourite dish with your \npartner & enjoy lavish taste of food.',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                          ),
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                      border: Border(
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.access_time,
                                              size: 18.0,
                                              color: Colors.black,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 3.0, top: 3.0),
                                              child: Text(
                                                ' Open 10AM-10PM ',
                                                style: TextStyle(
                                                  color: Color(0xff00AF41),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 1.0,
                                          height: 36.0,
                                          color: Colors.grey,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Image.asset(
                                              Assets.HOMEPAGE_SCOOTER,
                                              color: Colors.black,
                                              height: 18.0,
                                              width: 18.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0, bottom: 3.0),
                                              child: Text(
                                                ' ETA 20-30 min.',
                                                style: TextStyle(
                                                  color: Color(0xff00AF41),
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
                          ),
                          Container(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: options.map(
                                  (item) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedMenu = item.id;
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 15.0,
                                              right: 15.0,
                                              left: 15.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        item.title,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: selectedMenu ==
                                                                  item.id
                                                              ? Colors.green
                                                              : Colors.black,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    selectedMenu == item.id
                                                        ? Container(
                                                            height: 2.0,
                                                            width: (options
                                                                    .length) *
                                                                15.0,
                                                            color: Colors.green,
                                                          )
                                                        : Container(),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: ListView.builder(
                              padding: EdgeInsets.all(0.0),
                              itemCount: 10,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  color: Colors.white,
                                  height: 175.0,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 4,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          Assets.HOMEPAGE_13),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                              right: 8.0,
                                                              top: 8.0,
                                                            ),
                                                            child: Text(
                                                              'Fried Rice',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
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
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 8.0,
                                                              right: 8.0,
                                                            ),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                setState(
                                                                  () {
                                                                    if (isLiked ==
                                                                        false) {
                                                                      isLiked =
                                                                          true;
                                                                    } else {
                                                                      isLiked =
                                                                          false;
                                                                    }
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(
                                                                isLiked == true
                                                                    ? Icons
                                                                        .favorite
                                                                    : Icons
                                                                        .favorite_border,
                                                                size: 18.0,
                                                                color: Colors
                                                                    .redAccent,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            child: Text(
                                                              'Rice stir-fried in a wok with various vegetables like green peas,french beans,capsicum,etc.Garnished with cloves and coriander and tint of Kesar(On special request)',
                                                              style: TextStyle(
                                                                fontSize: 10.0,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                              maxLines: 6,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                            ),
                                                            width: 225.0,
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
                                                          Image.network(
                                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAaMDarjrwn37a-_5aFImCgg7ZLnG3vlN0TrDmZ08Xnk0p7E6w9w',
                                                            width: 25.0,
                                                            height: 25.0,
                                                          ),
                                                          Text(
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
                                                          Visibility(
                                                            visible:
                                                                isAdded == true
                                                                    ? false
                                                                    : true,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                setState(
                                                                  () {
                                                                    if (isAdded ==
                                                                        false) {
                                                                      isAdded =
                                                                          true;
                                                                    } else {
                                                                      isAdded =
                                                                          false;
                                                                    }
                                                                  },
                                                                );
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                                width: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xff00AF41),
                                                                    width: 1.0,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  'ADD',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff00AF41),
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
                                                              ),
                                                            ),
                                                          ),
                                                          Visibility(
                                                            visible:
                                                                isAdded == true
                                                                    ? true
                                                                    : false,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          8.0),
                                                              width: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
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
                                                                    onTap:
                                                                        minus,
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size:
                                                                          15.0,
                                                                      color: Color(
                                                                          0xff00AF41),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '$quantity',
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
                                                                      size:
                                                                          15.0,
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 4.0,
                                        color: Colors.grey[800],
                                      ),
                                    ],
                                  ),
                                );
                              },
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
              height: 50.0,
              color: Color(0xff00AF41),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.0, top: 10.0),
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
                            builder: (context) => CartPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50.0,
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        margin: EdgeInsets.only(
                            bottom: 8.0, top: 8.0, right: 25.0, left: 25.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff008c34),
                        ),
                        child: Text(
                          'View Basket',
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

// ignore: must_be_immutable
