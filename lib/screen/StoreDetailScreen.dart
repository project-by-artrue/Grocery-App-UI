// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, void_checks

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Store/store_bloc.dart';
import 'package:grocery/model/model.dart';
import 'package:grocery/widget/ProductCard.dart';
import 'package:grocery/widget/ShowButtomSheet.dart';

class StoreDetailsScreen extends StatefulWidget {
  String storeName;
  StoreDetailsScreen(this.storeName, {Key? key}) : super(key: key);

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  String tabvalue = "All";
  @override
  Widget build(BuildContext context) {
    StoreBloc s = BlocProvider.of<StoreBloc>(context);
    s.add(GetStore());
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<StoreBloc, StoreState>(
        builder: (context, state) {
          print("aaaaaaaaaaaaaaaaaaaaaaaaa${state}");
          if (state is ShowStore) {
            // print(
            //     "qqqqqqqqqqqqqqqqqqqqqqqqqqqq  ${state.storeProduct}7777${state.showStore}");
            return Scaffold(
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leading: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(9),
                          height: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: Icon(Icons.navigate_before_rounded),
                        ),
                      ),
                      actions: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: Icon(Icons.shopping_cart_outlined),
                          ),
                        ),
                      ],
                      pinned: true,
                      backgroundColor: Colors.green,
                      elevation: 0,
                      expandedHeight: size.height * 0.3,
                      flexibleSpace: FlexibleSpaceBar(
                          background: CachedNetworkImage(
                        imageUrl: state.showStore[widget.storeName]!.storeImage,
                        fit: BoxFit.fill,
                      )),
                    ),
                    SliverToBoxAdapter(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Image.network(
                              state.showStore[widget.storeName]!.storeLogo),
                          title: Text(
                              state.showStore[widget.storeName]!.storeName),
                          subtitle: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: state
                                        .showStore[widget.storeName]!.location,
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 152, 152, 152))),
                                TextSpan(
                                    text: "min order \$0.0",
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
                            GestureDetector(
                              onTap: () {},
                              child: Column(
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
                                  Text("Location")
                                ],
                              ),
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
                                    Text(state.showStore[widget.storeName]!
                                        .deliveryTime)
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
                      automaticallyImplyLeading: false,
                      pinned: true,
                      expandedHeight: size.height * 0.05,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Container(
                        // width: double.infinity,
                        height: 40,
                        padding: EdgeInsets.all(3),
                        alignment: Alignment.center,
                        child: DefaultTabController(
                          length:
                              state.storeProduct[widget.storeName]?.length ?? 0,
                          child: TabBar(
                            // physics: NeverScrollableScrollPhysics(),
                            onTap: (value) {
                              tabvalue = state
                                  .storeProduct[widget.storeName]!.keys
                                  .toList()[value];
                              setState(() {});
                            },
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: CircleTabIndicator(
                                color: Colors.green, radius: 4),
                            isScrollable: true,
                            labelColor: Colors.black,
                            tabs: <Widget>[
                              for (int i = 0;
                                  i <
                                      (state.storeProduct[widget.storeName]
                                              ?.keys.length ??
                                          0);
                                  i++)
                                Tab(
                                  text: state
                                      .storeProduct[widget.storeName]?.keys
                                      .toList()[i],
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
                        return InkWell(
                          onTap: () {
                            model.bottomsheet(
                                context,
                                state.storeProduct[widget.storeName]![
                                    tabvalue]![index],
                                ShowButtomSheet(
                                  state.storeProduct[widget.storeName]![
                                      tabvalue]![index],
                                ));
                          },
                          child: ProductCard(state.storeProduct[
                              widget.storeName]![tabvalue]![index]),
                        );
                      },
                          childCount: state
                              .storeProduct[widget.storeName]![tabvalue]!
                              .length),
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Container(
              color: Colors.red,
            ),
          );
        },
        listener: (context, state) {});
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
