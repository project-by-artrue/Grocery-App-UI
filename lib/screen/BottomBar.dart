// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:grocery/model/model.dart';
import 'package:grocery/screen/Favourite_Screen.dart';
import 'package:grocery/screen/Home_Screen.dart';
import 'package:grocery/screen/MyCart_Screen.dart';
import 'package:grocery/screen/MyOrder_Screen.dart';
import 'package:grocery/widget/ShowButtomSheet.dart';

import 'ShowBottomSheetBar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int getindex = 0;
  final iconList = <IconData>[
    Icons.home,

    Icons.favorite,
    // Icons.shopping_cart,
    Icons.shopping_bag_sharp,
    Icons.menu,
  ];
  int _bottomNavIndex = 0;

  List<Widget> page = [Home(), Favourite(), MyOrder(), Container(), MyCart()];

  @override
  Widget build(BuildContext context) {
    // Navigator.pushReplacement(context, MaterialPageRoute(
    //   builder: (context) {

    //     return Home();
    //   },
    // ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: _bottomNavIndex == 3 ? page[getindex] : page[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_bottomNavIndex == 3) {
            _bottomNavIndex = 4;
            showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  _bottomNavIndex = getindex;

                  // return Container(
                  //   height: MediaQuery.of(context).size.height / 2.2,
                  //   child: ShowBottomSheetBar(),
                  // );
                  return ShowBottomSheetBar();
                });
          } else {
            _bottomNavIndex = 4;
            getindex = _bottomNavIndex;
          }
          setState(() {});
        },
        child: Icon(
          Icons.shopping_cart,
          color: _bottomNavIndex == 4 ? Colors.white : Colors.black26,
        ),
        backgroundColor: _bottomNavIndex == 4 ? Colors.green : Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        onTap: (index) => setState(() {
          _bottomNavIndex = index;

          if (index == 3) {
            showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  _bottomNavIndex = getindex;

                  // return Container(
                  //   height: MediaQuery.of(context).size.height / 2.2,
                  //   child: ShowBottomSheetBar(),
                  // );
                  return ShowBottomSheetBar();
                });
          } else {
            getindex = _bottomNavIndex;
          }
          setState(() {});
        }),
        splashColor: Colors.green,
        activeColor: Colors.green,
      ),
    );
  }
}
