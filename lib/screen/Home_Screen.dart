// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:grocery/model/model.dart';
import 'package:grocery/widget/BestReviewedItem.dart';
import 'package:grocery/widget/Campaigns.dart';
import 'package:grocery/widget/Categories.dart';
import 'package:grocery/widget/CategoriesName.dart';
import 'package:grocery/widget/Newon6amMart.dart';
import 'package:grocery/widget/PopularItemsNearby.dart';
import 'package:grocery/widget/PopularStores.dart';
import 'package:grocery/widget/ShowButtomSheet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    return Categories(model().img[index], model().name[index]);
                  },
                ),
              ),
              CategoriesName("Popular Stores", "View All", ""),
              Container(
                height: MediaQuery.of(context).size.height / 5.2,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PopularStores(model().PopularStorImg[index]);
                  },
                ),
              ),
              CategoriesName("Campaigns", "View All", ""),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2.3,
                                  child: ShowButtomSheet());
                            });
                      },
                      child: Campaigns(model().PopularStorImg[index]),
                    );
                  },
                ),
              ),
              CategoriesName("Popular Items Nearby", "View All", ""),
              Container(
                height: MediaQuery.of(context).size.height / 7.5,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PopularItemsNearby(model().PopularStorImg[index]);
                  },
                ),
              ),
              CategoriesName("New on 6amMart", "View All", ""),
              Container(
                height: MediaQuery.of(context).size.height / 5.2,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Newon6amMart(model().PopularStorImg[index]);
                  },
                ),
              ),
              CategoriesName("Best Reviewed item", "View All", ""),
              Container(
                height: MediaQuery.of(context).size.height / 7.5,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return BestRevieweditem(model().PopularStorImg[index]);
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
                  Icon(Icons.filter_list),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              ListView.builder(
                itemCount: model().StoresName.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(model().PopularStorImg[index]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        title: Text(
                          model().StoresName[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "House:00,Road:00,city:00,Country",
                                style: TextStyle(
                                    color: Colors.black26, fontSize: 12),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "★★☆☆☆(0)",
                                style: TextStyle(
                                    color: Colors.black26, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.favorite_border,
                          color: Colors.black26,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
