import 'package:alroya/Screens/alray/AlrayView.dart';
import 'package:alroya/Screens/video/videoView.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

import 'Home/Home.dart';
import 'categories/CategorieView1.dart';
import 'categories/CategorieView2.dart';
import 'more.dart';

import '../Tools/globals.dart' as g;

class MyTabBar extends StatefulWidget {
  MyTabBar({Key key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int _currentIndex = 0;
  List<Widget> pageList = List<Widget>();

  final tabs = [
    Home(),
    CategorieView1(title: 'أخبار', catId: 65),
    // BreakNews(),
    CategorieView2(title: 'اقتصاد', catId: 67),
    // AlrayView(),
    AlrayView(),
    // CustomScrollViewTestRoute(),
    More()
  ];

  @override
  void initState() {
    pageList.add(Home());
    pageList.add(CategorieView1(title: 'أخبار', catId: 65));
    pageList.add(CategorieView2(title: 'اقتصاد', catId: 67));
    pageList.add(AlrayView());
    pageList.add(More());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: CupertinoTabBar(
          activeColor: g.dark,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          iconSize: 18,
          items: [
            BottomNavigationBarItem(
                icon: Icon(SFSymbols.house),
                title: Text(
                  "الرئيسية",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(SFSymbols.flame),
                title: Text(
                  "أخبار",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(SFSymbols.money_dollar_circle),
                title: Text(
                  "اقتصاد",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(SFSymbols.person_2),
                title: Text(
                  "أراء",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(SFSymbols.ellipsis),
                title: Text(
                  "المزيد",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: IndexedStack(
          children: pageList,
          index: _currentIndex,
        ),
      ),
    );
  }
}
