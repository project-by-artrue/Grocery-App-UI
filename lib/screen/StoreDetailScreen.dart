// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery/widget/ProductCard.dart';

class StoreDetailsScreen extends StatefulWidget {
  StoreDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.green,
              elevation: 0,
              expandedHeight: size.height * 0.3,
              flexibleSpace: FlexibleSpaceBar(background: FlutterLogo()),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                ListTile(
                  leading: Image.network(
                      "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
                  title: Text("Eorange"),
                  subtitle: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Address ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 152, 152, 152))),
                        TextSpan(
                            text: "\$0.0",
                            style: TextStyle(color: Colors.green))
                      ],
                    ),
                  ),
                  trailing: Icon(Icons.favorite_border_outlined),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_sharp,
                              color: Colors.green,
                            ),
                            Text("0.0")
                          ],
                        ),
                        Text("0.0 review")
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.green,
                            ),
                            // Text("0.0")
                          ],
                        ),
                        Text("0.0 review")
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.alarm,
                              color: Colors.green,
                            ),
                            Text("2-3 Hours")
                          ],
                        ),
                        Text("Delivary Time")
                      ],
                    )
                  ],
                )
              ],
            )),
            SliverAppBar(
              pinned: true,
              expandedHeight: size.height * 0.05,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Container(
                width: double.infinity,
                height: 40,
                padding: EdgeInsets.all(3),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    // physics: NeverScrollableScrollPhysics(),
                    onTap: (value) {},
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator:
                        CircleTabIndicator(color: Colors.green, radius: 4),
                    isScrollable: true,
                    labelColor: Colors.black,
                    tabs: <Widget>[
                      Tab(
                        text: 'All',
                      ),
                      Tab(
                        text: 'Organizers',
                      ),
                      Tab(
                        text: 'Writing & printing',
                      ),
                      Tab(
                        text: 'Arts & Crafts',
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 205, 236, 206),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ProductCard();
              }, childCount: 3),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color? color, @required double? radius})
      : _painter = _CirclePainter(
          color!,
          radius!,
        );

  @override
  BoxPainter createBoxPainter([void onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
