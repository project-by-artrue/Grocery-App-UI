import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/model/model.dart';
import 'package:grocery/widget/ProductCard.dart';
import 'package:grocery/widget/ShowButtomSheet.dart';
import 'package:grocery/widget/Store.dart';

class ProductScreen extends StatefulWidget {
  String appbarname;
  ProductScreen(this.appbarname, {Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    print(
        "lllllllllllllllllllllllllllllllllllllllll#################################${widget.appbarname}");
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Badge(
                alignment: Alignment.center,
                padding: EdgeInsets.all(2),
                badgeContent: Text("12"),
                position: BadgePosition.topEnd(top: 3),
                badgeColor: Colors.green,
                child: Icon(
                  Icons.shopping_cart_sharp,
                  color: Colors.black,
                ),
              ),
            )
          ],
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
          backgroundColor: Colors.white,
          title: Text(
            widget.appbarname,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocConsumer<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ShowProduct) {
                bool isPopular = (widget.appbarname == "Popular Items Nearby");
                return ListView.builder(
                  itemCount: isPopular
                      ? state.popularProduct.length
                      : state.product.length,
                  itemBuilder: (context, index) {
                    String key = "";
                    if (!isPopular) {
                      key = state.product.keys.elementAt(index);
                    }
                    return InkWell(
                      onTap: () {
                        if (isPopular) {
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
                        } else {
                          model.bottomsheet(
                              context,
                              state.product[key],
                              ShowButtomSheet(state.product[key],
                                  navigtorName: "ShwoStoreDetails",
                                  argumentsName:
                                      state.product[key]!.storeName));
                        }
                      },
                      child: ProductCard(isPopular
                          ? state.popularProduct[index]
                          : state.product[key]!),
                    );
                  },
                );
              }

              return ProductSimer();
            },
            listener: (context, state) {}));
  }
}
