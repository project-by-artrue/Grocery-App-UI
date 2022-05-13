// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ShowCategoriesItem extends StatefulWidget {
  const ShowCategoriesItem({Key? key}) : super(key: key);

  @override
  State<ShowCategoriesItem> createState() => _ShowCategoriesItemState();
}

class _ShowCategoriesItemState extends State<ShowCategoriesItem> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'office Stationery',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 40,
            ),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
          ],
          bottom: TabBar(
            physics: NeverScrollableScrollPhysics(),
            onTap: (value) {},
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: CircleTabIndicator(color: Colors.green, radius: 4),
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
        body: Column(
          children: [
            DefaultTabController(
                length: 2,
                child: SafeArea(
                  child: TabBar(
                    indicatorColor: Colors.green,
                    labelColor: Colors.green,
                    tabs: [
                      Tab(text: "Running"),
                      Tab(text: "History"),
                    ],
                  ),
                ))
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
