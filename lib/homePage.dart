import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

import 'DetailPage.dart';
import 'Constant.dart';
import 'LocationPage.dart';
import 'menu_page.dart';
import 'Assets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int selectedMenu = 10;

  final List<MenuItem> options = [
    MenuItem(Constant.Home, Assets.MENU_HOME, 'Home'),
    MenuItem(Constant.Search, Assets.MENU_SEARCH, 'Search'),
    MenuItem(Constant.Order, Assets.MENU_ORDER, 'Order'),
    MenuItem(Constant.Profile, Assets.MENU_PROFILE, 'Profile'),
  ];

  final List<String> imgList = [
    'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?cs=srgb&dl=burrito-chicken-close-up-461198.jpg&fm=jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT43GN3ZTwveusFop2eLUPqsbb5NmlsD9ZmSvOMLBpq0lPLy5OS',
    'http://img1.wsimg.com/isteam/stock/2999',
    'http://www.indian-by-nature.com/wp-content/uploads/2018/06/862638.jpg',
    'https://www.newyorkminutemag.com/wp-content/uploads/2012/10/35094182543_f52a0ec1c5_b.jpg'
  ];

  final List<String> extraImageList = [
    Assets.HOMEPAGE_1,
    Assets.HOMEPAGE_2,
    Assets.HOMEPAGE_3,
    Assets.HOMEPAGE_4,
    Assets.HOMEPAGE_5,
    Assets.HOMEPAGE_6,
    Assets.HOMEPAGE_7,
    Assets.HOMEPAGE_8,
    Assets.HOMEPAGE_9,
    Assets.HOMEPAGE_10,
    Assets.HOMEPAGE_11,
    Assets.HOMEPAGE_12,
    Assets.HOMEPAGE_13,
    Assets.HOMEPAGE_14,
    Assets.HOMEPAGE_15,
  ];

  bool isLiked = false;
  bool isHistory = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 30.0, left: 25.0, right: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Text(
                        'Restuarant List',
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LocationPage(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.location_on,
                              size: 28.0,
                            ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options.map(
                    (item) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMenu = item.id;
                          });
                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          item.icon,
                                          width: 20.0,
                                          height: 20.0,
                                          color: selectedMenu == item.id
                                              ? Colors.green
                                              : Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        item.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: selectedMenu == item.id
                                              ? Colors.green
                                              : Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: <Widget>[
                                    selectedMenu == item.id
                                        ? Container(
                                            height: 2.0,
                                            width: 50.0,
                                            color: Colors.green,
                                          )
                                        : Container(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Visibility(
                visible: selectedMenu == Constant.Home ? true : false,
                child: Container(
                  height: MediaQuery.of(context).size.height - 140,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15.0, right: 15.0),
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
                                      width: MediaQuery.of(context).size.width +
                                          50,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.0),
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
                        Container(
                          height: 320.0,
                          margin: EdgeInsets.only(
                              top: 15.0, bottom: 15.0, left: 5.0, right: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'NEARBY RESTUARANT (10)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 8.0, bottom: 5.0),
                              ),
                              Container(
                                child: Expanded(
                                  flex: 2,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 8,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          child: Card(
                                            elevation: 5.0,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10.0,
                                                      left: 10.0,
                                                      top: 15.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 20,
                                                        child: Text(
                                                          'Ochre Restuarant',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Icon(
                                                          Icons.star,
                                                          size: 15.0,
                                                          color: Colors
                                                              .yellow[800],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          color: Colors.green,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: Text(
                                                            '4.0',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0, left: 10.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Thai,Vegeterian Friendly,Healthy',
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                          color:
                                                              Colors.grey[400],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: EdgeInsets.only(
                                                    top: 5.0,
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 1,
                                                        child: Icon(
                                                          Icons.access_time,
                                                          size: 18.0,
                                                          color:
                                                              Colors.grey[400],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          'Open 10AM-10PM |',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Image.asset(
                                                          Assets
                                                              .HOMEPAGE_SCOOTER,
                                                          color:
                                                              Colors.grey[400],
                                                          height: 18.0,
                                                          width: 18.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          ' ETA 20-30 min.',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (isLiked ==
                                                                    false) {
                                                                  isLiked =
                                                                      true;
                                                                } else {
                                                                  isLiked =
                                                                      false;
                                                                }
                                                              });
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 200.0,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 15.0),
                                                                child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                  elevation: 5.0,
                                                                  child: Stack(
                                                                    children: <Widget>[
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          shape: BoxShape.rectangle,
                                                                          borderRadius:
                                                                          BorderRadius.circular(10.0),
                                                                          image: DecorationImage(
                                                                            fit: BoxFit.fill,
                                                                            image: AssetImage(
                                                                              "images/13.jpg",
                                                                            ),
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
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Expanded(
                                                              flex: 4,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(top: 15.0,),
                                                                      child: Card(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                        elevation: 5.0,
                                                                        child: Stack(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.rectangle,
                                                                                borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.fill,
                                                                                  image: AssetImage(
                                                                                    "images/13.jpg",
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(top: 15.0,),
                                                                      child: Card(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                        elevation: 5.0,
                                                                        child: Stack(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.rectangle,
                                                                                borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.fill,
                                                                                  image: AssetImage(
                                                                                    "images/13.jpg",
                                                                                  ),
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
                                                            Expanded(
                                                              flex: 3,
                                                              child: Stack(
                                                                children: <Widget>[
                                                                      Container(
                                                                        child: Card(
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                          ),
                                                                          elevation: 5.0,
                                                                          child: Stack(
                                                                            children: <Widget>[
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.rectangle,
                                                                                  borderRadius:
                                                                                  BorderRadius.circular(10.0),
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.fill,
                                                                                    image: AssetImage(
                                                                                      "images/13.jpg",
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(8.0),color: Color(0xff99000000)),
                                                                      ),
                                                                      Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Text(
                                                                          '15 photos',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontStyle:
                                                                                FontStyle.normal,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                24.0,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 320.0,
                          margin: EdgeInsets.only(
                              bottom: 15.0, left: 5.0, right: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'POPULAR RESTUARANT (10)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 8.0, bottom: 5.0),
                              ),
                              Container(
                                child: Expanded(
                                  flex: 2,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 8,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width -
                                              50,
                                          child: Card(
                                            elevation: 5.0,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10.0,
                                                      left: 10.0,
                                                      top: 15.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 20,
                                                        child: Text(
                                                          'Ochre Restuarant',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Icon(
                                                          Icons.star,
                                                          size: 15.0,
                                                          color: Colors
                                                              .yellow[800],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          color: Colors.green,
                                                          padding:
                                                          EdgeInsets.all(
                                                              2.0),
                                                          child: Text(
                                                            '4.0',
                                                            style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 5.0, left: 10.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Thai,Vegeterian Friendly,Healthy',
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                          color:
                                                          Colors.grey[400],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: EdgeInsets.only(
                                                    top: 5.0,
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 1,
                                                        child: Icon(
                                                          Icons.access_time,
                                                          size: 18.0,
                                                          color:
                                                          Colors.grey[400],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          'Open 10AM-10PM |',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Image.asset(
                                                          Assets
                                                              .HOMEPAGE_SCOOTER,
                                                          color:
                                                          Colors.grey[400],
                                                          height: 18.0,
                                                          width: 18.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          ' ETA 20-30 min.',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          child:
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (isLiked ==
                                                                    false) {
                                                                  isLiked =
                                                                  true;
                                                                } else {
                                                                  isLiked =
                                                                  false;
                                                                }
                                                              });
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 200.0,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 15.0),
                                                                child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                  elevation: 5.0,
                                                                  child: Stack(
                                                                    children: <Widget>[
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          shape: BoxShape.rectangle,
                                                                          borderRadius:
                                                                          BorderRadius.circular(10.0),
                                                                          image: DecorationImage(
                                                                            fit: BoxFit.fill,
                                                                            image: AssetImage(
                                                                              "images/13.jpg",
                                                                            ),
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
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Expanded(
                                                              flex: 4,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(top: 15.0,),
                                                                      child: Card(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                        elevation: 5.0,
                                                                        child: Stack(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.rectangle,
                                                                                borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.fill,
                                                                                  image: AssetImage(
                                                                                    "images/13.jpg",
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(top: 15.0,),
                                                                      child: Card(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                        elevation: 5.0,
                                                                        child: Stack(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.rectangle,
                                                                                borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.fill,
                                                                                  image: AssetImage(
                                                                                    "images/13.jpg",
                                                                                  ),
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
                                                            Expanded(
                                                              flex: 3,
                                                              child: Stack(
                                                                children: <Widget>[
                                                                  Container(
                                                                    child: Card(
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                      ),
                                                                      elevation: 5.0,
                                                                      child: Stack(
                                                                        children: <Widget>[
                                                                          Container(
                                                                            decoration: BoxDecoration(
                                                                              shape: BoxShape.rectangle,
                                                                              borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.fill,
                                                                                image: AssetImage(
                                                                                  "images/13.jpg",
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(8.0),color: Color(0xff99000000)),
                                                                  ),
                                                                  Container(
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                    child:
                                                                    Text(
                                                                      '15 photos',
                                                                      style:
                                                                      TextStyle(
                                                                        color:
                                                                        Colors.white,
                                                                        fontStyle:
                                                                        FontStyle.normal,
                                                                        fontWeight:
                                                                        FontWeight.w400,
                                                                        fontSize:
                                                                        24.0,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign.center,
                                                                    ),
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 320.0,
                          margin: EdgeInsets.only(
                              bottom: 15.0, left: 5.0, right: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'POPULAR RESTUARANT (10)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 8.0, bottom: 5.0),
                              ),
                              Container(
                                child: Expanded(
                                  flex: 2,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 8,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width -
                                              50,
                                          child: Card(
                                            elevation: 5.0,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10.0,
                                                      left: 10.0,
                                                      top: 15.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 20,
                                                        child: Text(
                                                          'Ochre Restuarant',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Icon(
                                                          Icons.star,
                                                          size: 15.0,
                                                          color: Colors
                                                              .yellow[800],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          color: Colors.green,
                                                          padding:
                                                          EdgeInsets.all(
                                                              2.0),
                                                          child: Text(
                                                            '4.0',
                                                            style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 5.0, left: 10.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Thai,Vegeterian Friendly,Healthy',
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                          color:
                                                          Colors.grey[400],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: EdgeInsets.only(
                                                    top: 5.0,
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 1,
                                                        child: Icon(
                                                          Icons.access_time,
                                                          size: 18.0,
                                                          color:
                                                          Colors.grey[400],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          'Open 10AM-10PM |',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Image.asset(
                                                          Assets
                                                              .HOMEPAGE_SCOOTER,
                                                          color:
                                                          Colors.grey[400],
                                                          height: 18.0,
                                                          width: 18.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          ' ETA 20-30 min.',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          child:
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (isLiked ==
                                                                    false) {
                                                                  isLiked =
                                                                  true;
                                                                } else {
                                                                  isLiked =
                                                                  false;
                                                                }
                                                              });
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 200.0,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 15.0),
                                                                child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                  elevation: 5.0,
                                                                  child: Stack(
                                                                    children: <Widget>[
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          shape: BoxShape.rectangle,
                                                                          borderRadius:
                                                                          BorderRadius.circular(10.0),
                                                                          image: DecorationImage(
                                                                            fit: BoxFit.fill,
                                                                            image: AssetImage(
                                                                              "images/13.jpg",
                                                                            ),
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
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Expanded(
                                                              flex: 4,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(top: 15.0,),
                                                                      child: Card(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                        elevation: 5.0,
                                                                        child: Stack(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.rectangle,
                                                                                borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.fill,
                                                                                  image: AssetImage(
                                                                                    "images/13.jpg",
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(top: 15.0,),
                                                                      child: Card(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                        elevation: 5.0,
                                                                        child: Stack(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.rectangle,
                                                                                borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.fill,
                                                                                  image: AssetImage(
                                                                                    "images/13.jpg",
                                                                                  ),
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
                                                            Expanded(
                                                              flex: 3,
                                                              child: Stack(
                                                                children: <Widget>[
                                                                  Container(
                                                                    child: Card(
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                      ),
                                                                      elevation: 5.0,
                                                                      child: Stack(
                                                                        children: <Widget>[
                                                                          Container(
                                                                            decoration: BoxDecoration(
                                                                              shape: BoxShape.rectangle,
                                                                              borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.fill,
                                                                                image: AssetImage(
                                                                                  "images/13.jpg",
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(8.0),color: Color(0xff99000000)),
                                                                  ),
                                                                  Container(
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                    child:
                                                                    Text(
                                                                      '15 photos',
                                                                      style:
                                                                      TextStyle(
                                                                        color:
                                                                        Colors.white,
                                                                        fontStyle:
                                                                        FontStyle.normal,
                                                                        fontWeight:
                                                                        FontWeight.w400,
                                                                        fontSize:
                                                                        24.0,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign.center,
                                                                    ),
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 320.0,
                          margin: EdgeInsets.only(
                              bottom: 15.0, left: 5.0, right: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'POPULAR RESTUARANT (10)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 8.0, bottom: 5.0),
                              ),
                              Container(
                                child: Expanded(
                                  flex: 2,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 8,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width -
                                              50,
                                          child: Card(
                                            elevation: 5.0,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10.0,
                                                      left: 10.0,
                                                      top: 15.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 20,
                                                        child: Text(
                                                          'Ochre Restuarant',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Icon(
                                                          Icons.star,
                                                          size: 15.0,
                                                          color: Colors
                                                              .yellow[800],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          color: Colors.green,
                                                          padding:
                                                          EdgeInsets.all(
                                                              2.0),
                                                          child: Text(
                                                            '4.0',
                                                            style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 5.0, left: 10.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Thai,Vegeterian Friendly,Healthy',
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                          color:
                                                          Colors.grey[400],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: EdgeInsets.only(
                                                    top: 5.0,
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 1,
                                                        child: Icon(
                                                          Icons.access_time,
                                                          size: 18.0,
                                                          color:
                                                          Colors.grey[400],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          'Open 10AM-10PM |',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Image.asset(
                                                          Assets
                                                              .HOMEPAGE_SCOOTER,
                                                          color:
                                                          Colors.grey[400],
                                                          height: 18.0,
                                                          width: 18.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          ' ETA 20-30 min.',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          child:
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (isLiked ==
                                                                    false) {
                                                                  isLiked =
                                                                  true;
                                                                } else {
                                                                  isLiked =
                                                                  false;
                                                                }
                                                              });
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 200.0,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 15.0),
                                                                child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                  elevation: 5.0,
                                                                  child: Stack(
                                                                    children: <Widget>[
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          shape: BoxShape.rectangle,
                                                                          borderRadius:
                                                                          BorderRadius.circular(10.0),
                                                                          image: DecorationImage(
                                                                            fit: BoxFit.fill,
                                                                            image: AssetImage(
                                                                              "images/13.jpg",
                                                                            ),
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
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Expanded(
                                                              flex: 4,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(top: 15.0,),
                                                                      child: Card(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                        elevation: 5.0,
                                                                        child: Stack(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.rectangle,
                                                                                borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.fill,
                                                                                  image: AssetImage(
                                                                                    "images/13.jpg",
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(top: 15.0,),
                                                                      child: Card(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                        elevation: 5.0,
                                                                        child: Stack(
                                                                          children: <Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.rectangle,
                                                                                borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.fill,
                                                                                  image: AssetImage(
                                                                                    "images/13.jpg",
                                                                                  ),
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
                                                            Expanded(
                                                              flex: 3,
                                                              child: Stack(
                                                                children: <Widget>[
                                                                  Container(
                                                                    child: Card(
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                      ),
                                                                      elevation: 5.0,
                                                                      child: Stack(
                                                                        children: <Widget>[
                                                                          Container(
                                                                            decoration: BoxDecoration(
                                                                              shape: BoxShape.rectangle,
                                                                              borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.fill,
                                                                                image: AssetImage(
                                                                                  "images/13.jpg",
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(8.0),color: Color(0xff99000000)),
                                                                  ),
                                                                  Container(
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                    child:
                                                                    Text(
                                                                      '15 photos',
                                                                      style:
                                                                      TextStyle(
                                                                        color:
                                                                        Colors.white,
                                                                        fontStyle:
                                                                        FontStyle.normal,
                                                                        fontWeight:
                                                                        FontWeight.w400,
                                                                        fontSize:
                                                                        24.0,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign.center,
                                                                    ),
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
              ),
              Visibility(
                visible: selectedMenu == Constant.Search,
                child: Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey[200],
                          ),
                          padding: EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(left: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.grey[400],
                                    size: 20.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Text(
                                    'Search for a restuarant or dish',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, left: 15.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'BROWSE BY DISHES',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 15,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    elevation: 5.0,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                "images/13.jpg",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          alignment: Alignment.bottomCenter,
                                          child: ClipRect(
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 10.0,
                                                sigmaY: 10.0,
                                              ),
                                              child: Container(
                                                width: 180.0,
                                                height: 35.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent
                                                        .withOpacity(0.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: Center(
                                                  child: Text('Arrabbiata',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: selectedMenu == Constant.Profile,
                child: Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          top: 25.0, left: 10.0),
                                      width: 150.0,
                                      height: 150.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.tealAccent,
                                        image: new DecorationImage(
                                          image: NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX8ju5ci5Km7jn2D9l_l9OVOA_vWOj5YMCJKXiqLGAZzQpO44Z'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(75.0),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 80.0, left: 140.0),
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff00AF41),
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 22.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            'Neal Caffrey',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                          margin: EdgeInsets.only(top: 15.0),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
                                            child: Icon(
                                              Icons.email,
                                              color: Color(0xff00AF41),
                                              size: 14.0,
                                            ),
                                          ),
                                          Text(
                                            'neal.caffrey@fbicheater.us | ',
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
                                            child: Icon(
                                              Icons.phone_in_talk,
                                              color: Color(0xff00AF41),
                                              size: 14.0,
                                            ),
                                          ),
                                          Text(
                                            ' +1/415-123-6681',
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
                                            child: Icon(
                                              Icons.location_on,
                                              size: 14.0,
                                              color: Color(0xff00AF41),
                                            ),
                                          ),
                                          Text(
                                            '87, Riverside Drive, Manhattan, NYC',
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
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
                        Container(
                          height: 200.0,
                          child: Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(15.0),
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8.0, top: 8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0,
                                                    top: 8.0,
                                                    left: 8.0),
                                                child: Icon(
                                                  Icons.payment,
                                                  color: Colors.lightBlue,
                                                  size: 30.0,
                                                ),
                                              ),
                                              Text(
                                                'Payment',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0,
                                                    top: 8.0,
                                                    left: 8.0),
                                                child: Icon(
                                                  Icons.insert_emoticon,
                                                  color: Color(0xff00AF41),
                                                  size: 30.0,
                                                ),
                                              ),
                                              Text(
                                                'Help',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0,
                                                    top: 8.0,
                                                    left: 8.0),
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.red[300],
                                                  size: 30.0,
                                                ),
                                              ),
                                              Text(
                                                'Favourite',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  endIndent: 20.0,
                                  indent: 20.0,
                                  color: Colors.grey[500],
                                  height: 1.0,
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0, bottom: 8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0,
                                                    top: 10.0,
                                                    left: 8.0),
                                                child: Icon(
                                                  Icons.notifications_none,
                                                  color: Colors.yellow[600],
                                                  size: 30.0,
                                                ),
                                              ),
                                              Text(
                                                'Notification',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0,
                                                    top: 10.0,
                                                    left: 8.0),
                                                child: Icon(
                                                  Icons.settings,
                                                  color: Colors.lightBlue,
                                                  size: 30.0,
                                                ),
                                              ),
                                              Text(
                                                'Settings',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0,
                                                    top: 10.0,
                                                    left: 8.0),
                                                child: Icon(
                                                  Icons.mobile_screen_share,
                                                  color: Color(0xff00AF41),
                                                  size: 30.0,
                                                ),
                                              ),
                                              Text(
                                                'Logout',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.normal,
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
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 134.0),
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: <Widget>[
                              Image.network(
                                'https://thumbs.dreamstime.com/b/food-delivery-scooter-image-61419800.jpg',
                                height: 100.0,
                                width: 60.0,
                                alignment: Alignment.bottomLeft,
                              ),
                              Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ1-pOW9NYM7RL10ttFcjStdTeJ_7El_ttnsganeoD8xJgh5Pc',
                                height: 100.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: selectedMenu == Constant.Order,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey[300],
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHistory = false;
                                    print(isHistory);
                                  });
                                },
                                child: Text(
                                  'Your Orders',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isHistory == false ? 20.0 : 18.0,
                                    fontWeight: isHistory == false
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: isHistory == false
                                        ? Colors.black
                                        : Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30.0,
                              color: Color(0xff00AF41),
                              width: 1.0,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHistory = true;
                                    print(isHistory);
                                  });
                                },
                                child: Text(
                                  'Order History',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isHistory == true ? 20.0 : 18.0,
                                    fontWeight: isHistory == true
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: isHistory == true
                                        ? Colors.black
                                        : Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            padding: EdgeInsets.all(10.0),
                            itemCount: 15,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 150.0,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  elevation: 5.0,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 6,
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                      left: 10.0,
                                                      right: 10.0,
                                                      top: isHistory == true
                                                          ? 25.0
                                                          : 15.0,
                                                      bottom: 5.0,
                                                    ),
                                                    child: Text(
                                                      'Ochre Restuarant',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 18.0,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                    alignment:
                                                        Alignment.topLeft,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                      left: 10.0,
                                                      right: 10.0,
                                                      bottom: 5.0,
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Visibility(
                                                          child: Icon(
                                                            Icons.access_time,
                                                            color: Colors.black,
                                                            size: 18.0,
                                                          ),
                                                          visible:
                                                              isHistory == true
                                                                  ? false
                                                                  : true,
                                                        ),
                                                        Text(
                                                          isHistory == true
                                                              ? 'Delivered on 08:45am, Aug 08,2019'
                                                              : ' 08:30am, Aug 08,2019',
                                                          style: TextStyle(
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.0,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: isHistory == true
                                                        ? false
                                                        : true,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10.0,
                                                        bottom: 5.0,
                                                      ),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons
                                                                .directions_bike,
                                                            color: Colors.black,
                                                            size: 18.0,
                                                          ),
                                                          Text(
                                                            ' ETA :- 10 min',
                                                            style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 15.0,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Column(children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    top: 15.0,
                                                    left: 10.0,
                                                    right: 10.0,
                                                    bottom: 5.0,
                                                  ),
                                                  child: Image.asset(
                                                    'images/13.jpg',
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: isHistory == true
                                                      ? false
                                                      : true,
                                                  child: Text(
                                                    'Track your order',
                                                    style: TextStyle(
                                                      color: Color(0xff00AF41),
                                                      fontSize: 14.0,
                                                      decoration: TextDecoration
                                                          .combine(
                                                        [
                                                          TextDecoration
                                                              .underline
                                                        ],
                                                      ),
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      decorationColor:
                                                          Color(0xff00AF41),
                                                      decorationStyle:
                                                          TextDecorationStyle
                                                              .solid,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 8,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Text(
                                                    'Total',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  '6 Items',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 6,
                                                child: Text(
                                                  '\$ 11.0',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
    );
  }
}
