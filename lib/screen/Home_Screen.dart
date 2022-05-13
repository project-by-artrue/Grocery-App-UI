// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:grocery/Bloc/location/location_bloc.dart';

import 'package:grocery/model/model.dart';
import 'package:grocery/widget/BestReviewedItem.dart';
import 'package:grocery/widget/Campaigns.dart';
import 'package:grocery/widget/Categories.dart';
import 'package:grocery/widget/CategoriesName.dart';
import 'package:grocery/widget/Newon6amMart.dart';
import 'package:grocery/widget/PopularItemsNearby.dart';
import 'package:grocery/widget/PopularStores.dart';
import 'package:grocery/widget/ShowButtomSheet.dart';
import 'package:grocery/widget/Store.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LocationBloc l = BlocProvider.of<LocationBloc>(context);
    l.add(Update());
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'SetLocation');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.location_on_sharp,
                color: Colors.black,
              ),
              BlocConsumer<LocationBloc, LocationState>(
                  builder: (context, state) {
                    if (state is ShowLocation) {
                      return Text(
                        "Choos Location",
                        style: TextStyle(color: Colors.black),
                      );
                    } else {
                      return Container(
                        height: 10,
                        color: Colors.black,
                      );
                    }
                  },
                  listener: (context, state) {}),
              Spacer(),
              Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        leading: Icon(
          Icons.widgets_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.white24,
        elevation: 0,
        centerTitle: true,
      ),
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                controller: search,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(color: Colors.black, width: 2),
                    // ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.green,
                    ),
                    hintText: "Search"),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GFCarousel(
              height: 150,
              autoPlay: true,
              autoPlayCurve: Curves.linearToEaseOut,
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayInterval: Duration(seconds: 4),
              hasPagination: true,
              items: model().imageList.map(
                (asset) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(
                        asset,
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            CategoriesName("Categories", "View All", "ViewAllCategories"),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'ShowCategoriesItem');
                      },
                      child:
                          Categories(model().img[index], model().name[index]));
                },
              ),
            ),
            CategoriesName("Popular Stores", "View All", "Store"),
            Container(
              height: MediaQuery.of(context).size.height / 5.2,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PopularStores(model().popularStorImg[index]);
                },
              ),
            ),
            CategoriesName("Campaigns", "View All", "Product"),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      model.bottomsheet(context);
                    },
                    child: Campaigns(model().popularStorImg[index]),
                  );
                },
              ),
            ),
            CategoriesName("Popular Items Nearby", "View All", "Product"),
            Container(
              height: MediaQuery.of(context).size.height / 7.5,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        model.bottomsheet(context);
                      },
                      child: BestRevieweditem(model().popularStorImg[index]));
                  // return PopularItemsNearby(model().popularStorImg[index]);
                },
              ),
            ),
            CategoriesName("New on 6amMart", "View All", "Store"),
            Container(
              height: MediaQuery.of(context).size.height / 5.2,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'ShwoStoreDetails');
                      },
                      child: Newon6amMart(model().popularStorImg[index]));
                },
              ),
            ),
            CategoriesName("Best Reviewed item", "View All", "Product"),
            Container(
              height: MediaQuery.of(context).size.height / 7.5,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        model.bottomsheet(context);
                      },
                      child: BestRevieweditem(model().popularStorImg[index]));
                },
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "All Stores",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Spacer(),
                // Icon(Icons.filter_list),
                PopupMenuButton(
                  icon: Icon(Icons.filter_list),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("All"),
                    ),
                    PopupMenuItem(
                      child: Text("Take Away"),
                    ),
                    PopupMenuItem(
                      child: Text("Delivery"),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            ListView.builder(
              itemCount: model().store.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'ShwoStoreDetails');
                    },
                    child: StoreCard(model().store[index]));
              },
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
