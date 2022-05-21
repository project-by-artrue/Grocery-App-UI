// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/model/product.dart';

class ShowButtomSheet extends StatelessWidget {
  Product? product;
  ShowButtomSheet(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsBloc p = BlocProvider.of<ProductsBloc>(context);
    p.add(ProductCount(product!.productId));
    // product!.price = "900";
    return BlocConsumer<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ShowProduct) {
            return Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(product!.displayImage),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product!.title, //product tital
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            product!.storeId, // Store Name
                            style: TextStyle(color: Colors.green),
                          ),
                          Text(
                            "★★☆☆☆(0)",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 12),
                          ),
                          Text(
                            "\$${product!.price}", //Product Price
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Discription",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product!.discription, //Product Discprition
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Quantity",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          if ((state.count[product!.productId] ?? 1) > 1) {
                            p.add(ProductCount(product!.productId,
                                isincrement: false));
                          }
                        },
                        icon: Icon(
                          Icons.remove_circle_outlined,
                          color: (state.count[product!.productId] ?? 1) > 1
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                      Text(
                        "${state.count[product!.productId] ?? 1}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          p.add(ProductCount(product!.productId,
                              isincrement: true));
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Tottal Ammount :\$ ${(state.count[product!.productId] ?? 1) * (double.parse(product!.price))}", //total Amount
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.store_sharp,
                          size: 40,
                          color: Colors.green,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.green,
                                width: 2,
                                style: BorderStyle.solid)),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.5,
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Order Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
          return Container();
        },
        listener: (context, state) {});
  }
}
