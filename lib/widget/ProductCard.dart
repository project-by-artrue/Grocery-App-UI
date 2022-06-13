// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/Bloc/Store/store_bloc.dart';

import 'package:grocery/model/product.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:grocery/globals.dart' as globals;

typedef void onTapcallF();
typedef void onTapcall();

class ProductCard extends StatefulWidget {
  Product p;
  onTapcall? onTap;
  onTapcallF? ontapf;
  ProductCard(this.p, {this.onTap, this.ontapf});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    ProductsBloc p = BlocProvider.of<ProductsBloc>(context);
    StoreBloc a = BlocProvider.of<StoreBloc>(context);
    // var counter = Provider.of<IsFavProduct>(context).getCounter;
    print("kkkkkkkkkkkkkkkkkkkkkkk${widget.p.ifFavrite}");
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        // color: Colors.yellow,
                        ),
                    child: CachedNetworkImage(imageUrl: widget.p.displayImage),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    right: 19,
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(9),
                          bottomRight: Radius.circular(9),
                        ),
                      ),
                      child: Text(
                        "20%OFF",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.p.title,
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  widget.p.storeName,
                  style: TextStyle(color: Colors.grey[109]),
                ),
                GFRating(
                    allowHalfRating: true,
                    borderColor: Colors.grey,
                    color: Colors.grey,
                    showTextForm: false,
                    size: 19,
                    onChanged: (Raiting) => null,
                    value: 4.5),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "\$${widget.p.price} ",
                    style: TextStyle(color: Color.fromARGB(255, 86, 86, 86)),
                  ),
                  TextSpan(
                      text: "\$${widget.p.marketValue}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Color.fromARGB(255, 86, 86, 86)))
                ]))
              ],
            ),
          ),
          Spacer(),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.add),
                globals.isLoggedIn
                    ? IconButton(
                        onPressed: () => widget.onTap,
                        icon: widget.p.ifFavrite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.favorite_border,
                              ))
                    : IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "Sign_In");
                        },
                        icon: Icon(
                          Icons.favorite_border,
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductSimer extends StatelessWidget {
  const ProductSimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(137, 220, 218, 218),
        highlightColor: Colors.white,
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 70,
                      width: 70,
                      color: Colors.white,

                      // child: CachedNetworkImage(imageUrl: p.displayImage),
                    ),
                  ],
                )),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Icon(Icons.add), Icon(Icons.favorite_border)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
