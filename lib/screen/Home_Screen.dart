// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace, void_checks

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Category/category_bloc.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/Bloc/Store/store_bloc.dart';
import 'package:grocery/Bloc/SubCategory/subcategory_bloc.dart';
import 'package:grocery/Bloc/location/location_bloc.dart';

import 'package:grocery/model/model.dart';
import 'package:grocery/widget/BestReviewedItem.dart';
import 'package:grocery/widget/Campaigns.dart';
import 'package:grocery/widget/Carousel.dart';
import 'package:grocery/widget/Categories.dart';
import 'package:grocery/widget/CategoriesName.dart';
import 'package:grocery/widget/Newon6amMart.dart';
import 'package:grocery/widget/PopularItemsNearby.dart';
import 'package:grocery/widget/PopularStores.dart';
import 'package:grocery/widget/ShowButtomSheet.dart';
import 'package:grocery/widget/Store.dart';

import '../Bloc/Slider/slider_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LocationBloc l = BlocProvider.of<LocationBloc>(context);
    SliderBloc s = BlocProvider.of<SliderBloc>(context);
    CategoryBloc g = BlocProvider.of<CategoryBloc>(context);
    ProductsBloc p = BlocProvider.of<ProductsBloc>(context);
    SubcategoryBloc b = BlocProvider.of<SubcategoryBloc>(context);
    StoreBloc store = BlocProvider.of<StoreBloc>(context);
    s.add(ShowSider());
    l.add(Update());
    g.add(GetCategory());
    p.add(FectchProduct());
    store.add(GetStore());
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
            BlocConsumer<SliderBloc, SliderState>(
                builder: (context, state) {
                  if (state is DisplaySliderData) {
                    return Carousel(state.carousel);
                  } else {
                    return Crousel_Shimmer();
                  }
                },
                listener: (context, state) {}),
            SizedBox(
              height: 10,
            ),
            CategoriesName("Categories", "View All", "ViewAllCategories"),
            Container(
              height: 100,
              child: BlocConsumer<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  // g.add(GetCategory());
                  if (state is ShowCategory) {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: state.catedgoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              b.add(ExploreSelectedCategory(
                                  state.catedgoryList[index].categoryId));
                              Navigator.pushNamed(context, 'ShowCategoriesItem',
                                  arguments:
                                      state.catedgoryList[index].categoryId);
                            },
                            child: Categories(state.catedgoryList[index].image,
                                state.catedgoryList[index].categoryName));
                      },
                    );
                  }
                  return Categories_Shimmer();
                },
                listener: (context, state) {},
              ),
            ),
            CategoriesName("Popular Stores", "View All", "Store"),
            Container(
                height: MediaQuery.of(context).size.height / 5.2,
                child: BlocConsumer<StoreBloc, StoreState>(
                    builder: (context, state) {
                      if (state is ShowStore) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.showStore.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            String key = state.showStore.keys.elementAt(index);
                            return PopularStores(state.showStore[key]);
                            // return StoreShimmer();
                          },
                        );
                      }
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return StoreShimmer();
                        },
                      );
                    },
                    listener: (context, state) {})),
            CategoriesName(
              "Campaigns",
              "View All",
              "Product",
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // model.bottomsheet(context,p);
                    },
                    child: Campaigns(model().popularStorImg[index]),
                  );
                },
              ),
            ),
            CategoriesName("Popular Items Nearby", "View All", "Product",
                argumen: "Popular Items Nearby"),
            Container(
                height: MediaQuery.of(context).size.height / 7.5,
                child: BlocConsumer<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state is ShowProduct) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          // shrinkWrap: true,R
                          itemCount: state.popularProduct.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            // String key = state.product.keys.elementAt(index);
                            return InkWell(
                              onTap: () {
                                model.bottomsheet(
                                  context,
                                  state.popularProduct[index],
                                  ShowButtomSheet(
                                    state.popularProduct[index],
                                    navigtorName: "ShwoStoreDetails",
                                    argumentsName:
                                        state.popularProduct[index].storeName,
                                  ),
                                );
                              },
                              child: BestRevieweditem(
                                state.popularProduct[index],
                              ),
                            );
                            // return PopularItemsNearby(model().popularStorImg[index]);
                          },
                        );
                      }
                      return BestRevieweditem_Shimmer();
                    },
                    listener: (context, state) {})),
            CategoriesName("New on 6amMart", "View All", "Store"),
            Container(
                height: MediaQuery.of(context).size.height / 5.2,
                child: BlocConsumer<StoreBloc, StoreState>(
                    builder: (context, state) {
                      if (state is ShowStore) {
                        return ListView.builder(
                          itemCount: state.showStore.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            String key = state.showStore.keys.elementAt(index);
                            return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, 'ShwoStoreDetails');
                                },
                                child: PopularStores(state.showStore[key]));
                          },
                        );
                      }
                      return Container();
                    },
                    listener: (context, state) {})),
            CategoriesName("Best Reviewed item", "View All", "Product",
                argumen: "Best Reviewed item"),
            Container(
                height: MediaQuery.of(context).size.height / 7.5,
                child: BlocConsumer<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state is ShowProduct) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.product.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            String key = state.product.keys.elementAt(index);
                            return InkWell(
                                onTap: () {
                                  model.bottomsheet(
                                      context,
                                      state.product[key],
                                      ShowButtomSheet(state.product[key],
                                          navigtorName: "ShwoStoreDetails",
                                          argumentsName:
                                              state.product[key]!.storeName));
                                },
                                child: BestRevieweditem(state.product[key]));
                          },
                        );
                      }
                      return Container();
                    },
                    listener: (context, state) {})),
            BlocConsumer<StoreBloc, StoreState>(
                builder: (context, state) {
                  if (state is ShowStore) {
                    return Column(
                      children: [
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
                          itemCount: state.showStore.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            String key = state.showStore.keys.elementAt(index);
                            return StoreCard(state.showStore[key]);
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    );
                  }
                  return Container(
                    color: Colors.red,
                  );
                },
                listener: (context, state) {})
          ],
        ),
      ),
    );
  }
}
