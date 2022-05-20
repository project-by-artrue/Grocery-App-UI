// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Category/category_bloc.dart';
import 'package:grocery/widget/ProductCard.dart';

class ShowCategoriesItem extends StatefulWidget {
  final String id;
  ShowCategoriesItem(this.id);

  @override
  State<ShowCategoriesItem> createState() => _ShowCategoriesItemState();
}

class _ShowCategoriesItemState extends State<ShowCategoriesItem>
    with SingleTickerProviderStateMixin {
  String tabValue = 'All';
  TabController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    CategoryBloc c = BlocProvider.of<CategoryBloc>(context);
    c.add(ExploreSelectedCategory(widget.id));
    Size size = MediaQuery.of(context).size;
    // print(widget.value);
    // @override
    // void dispose() {
    //   // TODO: implement dispose

    //   super.dispose();
    // }

    return WillPopScope(
      onWillPop: () async {
        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        Navigator.pushReplacementNamed(context, "Dashbord");
        return false;
      },
      child: BlocConsumer<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is ExploarCategory) {
              // print(
              //     "................................${state.subCategoryMap['4AjS5nizxNCb9VbuV3s9']}");
              // print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb${state.subCategoryMap}");

              // print(state.subCategoryMap['4AjS5nizxNCb9VbuV3s9']!.keys);
              return DefaultTabController(
                length: state.subCategoryMap[widget.id]!.length,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    centerTitle: true,
                    title: Text(
                      state.catedgoryName,
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "Dashbord");
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
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(size.height * 0.05),
                      child: Container(
                        // width: double.infinity,
                        height: 40,
                        padding: EdgeInsets.all(3),
                        child: DefaultTabController(
                          length: state.subCategoryMap[widget.id]!.keys.length,
                          child: TabBar(
                            // physics: NeverScrollableScrollPhysics(),
                            onTap: (value) {
                              tabValue = state.subCategoryMap[widget.id]!.keys
                                  .toList()[value];
                              setState(() {});
                              print("object" + value.toString());
                            },
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: CircleTabIndicator(
                                color: Colors.green, radius: 4),
                            isScrollable: true,
                            labelColor: Colors.black,
                            tabs: <Widget>[
                              for (int i = 0;
                                  i <
                                      state.subCategoryMap[widget.id]!.keys
                                          .length;
                                  i++)
                                Tab(
                                    text: state.subCategoryMap[widget.id]!.keys
                                        .toList()[i])
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 205, 236, 206),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  body: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: TabBar(
                              controller: controller,
                              indicatorColor: Colors.green,
                              labelColor: Colors.green,
                              tabs: [
                                Tab(text: "Products"),
                                Tab(text: "Store"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: TabBarView(
                            controller: controller,
                            children: [
                              ListView.builder(
                                itemCount: state
                                    .subCategoryMap[widget.id]![tabValue]!
                                    .length,
                                itemBuilder: (context, index) {
                                  return ProductCard(state.subCategoryMap[
                                      widget.id]![tabValue]![0]);
                                },
                              ),
                              Center(
                                child: Text("bye"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          },
          listener: (context, state) {}),
    );
  }

  // Future<bool> getBack() {
  //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //    return
  //  },));
  //   return Future.value();
  // }
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
