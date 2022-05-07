// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  List StoresName = [
    "Eorange",
    "Family superMarket",
    "Fresh local",
    "Fresh superMarket",
    "Online market",
    "Sk General Store",
    "Organic Shop",
    "Vegan Market",
    "Veggie Market",
    "Eorange",
    "Family superMarket",
    "Fresh local",
    "Fresh superMarket",
    "Online market",
    "Sk General Store",
  ];

  List name = [
    "office Stationery",
    "Skin care",
    "Fish meat",
    "office Stationery",
    "Skin care",
    "Fish meat",
    "office Stationery",
    "Skin care",
    "Fish meat",
    "office Stationery",
    "Skin care",
    "Fish meat",
    "office Stationery",
    "Skin care",
    "Fish meat"
  ];

  List img = [
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
  ];

  List PopularStorImg = [
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
  ];

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
                items: imageList.map(
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
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            // height: 120,
                            width: 50,
                            // margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(img[index]),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: Container(
                            width: 65,
                            child: Text(
                              name[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  // overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Popular Stores",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 5.2,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 5.5,
                          width: MediaQuery.of(context).size.width / 1.8,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 9.9,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      PopularStorImg[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Eorange",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 5),
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: const Offset(2.0, 2.0),
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10.0,
                          right: 10.0,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                child: Icon(Icons.favorite_border),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: const Offset(2.0, 2.0),
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Campaigns",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 3.7,
                      width: MediaQuery.of(context).size.width / 2.8,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 6.9,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  PopularStorImg[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "offer Campaign",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Orgenic Shop",
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 12),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 5),
                            // child: Text(
                            //   "★★☆☆☆(0)",
                            //   style: TextStyle(
                            //       color: Colors.black26, fontSize: 12),
                            // ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "\$560.20",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "★0.0",
                                  style: TextStyle(color: Colors.green),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Popular Items Nearby",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 7.5,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: MediaQuery.of(context).size.width / 1.4,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(PopularStorImg[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          "Avocado",
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
                                "Fresh SupreMarket",
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
                            Row(
                              children: [
                                Text(
                                  "\$240.00",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.add)
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "New on 6amMart",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 5.2,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 5.5,
                          width: MediaQuery.of(context).size.width / 1.8,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 9.9,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        PopularStorImg[index],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Country Fire",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 5),
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: const Offset(2.0, 2.0),
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                // margin: EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height / 9.9,
                                width: MediaQuery.of(context).size.width / 1.8,
                                alignment: Alignment.center,
                                child: Text(
                                  "Closed Now",
                                  style: TextStyle(color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black45,
                                ),
                              )),
                        ),
                        Positioned(
                          top: 10.0,
                          right: 10.0,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                child: Icon(Icons.favorite_border),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: const Offset(2.0, 2.0),
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Best Reviewed item",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 7.5,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: MediaQuery.of(context).size.width / 1.4,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(PopularStorImg[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          "Avocado",
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
                                "Fresh SupreMarket",
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
                            Row(
                              children: [
                                Text(
                                  "\$240.00",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.add)
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                    );
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
                itemCount: StoresName.length,
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
                                image: AssetImage(PopularStorImg[index]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        title: Text(
                          StoresName[index],
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
 