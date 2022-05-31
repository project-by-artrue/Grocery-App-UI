// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/model.dart';
import 'package:grocery/model/store.dart';
import 'package:shimmer/shimmer.dart';

class StoreCard extends StatelessWidget {
  Store? showStore;
  StoreCard(this.showStore, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'ShwoStoreDetails',
            arguments: showStore!.storeName);
      },
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage(store.storeImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5),
              ),
              child: CachedNetworkImage(imageUrl: showStore!.storeLogo),
            ),
            title: Text(
              showStore!.storeName,
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
                    showStore!.location,
                    style: TextStyle(color: Colors.black26, fontSize: 12),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "store.review",
                    style: TextStyle(color: Colors.black26, fontSize: 12),
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
      ),
    );
  }
}

class StoreCard_Shimmer extends StatelessWidget {
  const StoreCard_Shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Color.fromARGB(255, 231, 227, 227),
                          direction: ShimmerDirection.ltr,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: AssetImage(store.storeImage),
                              //     fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        title: Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Color.fromARGB(255, 231, 227, 227),
                          direction: ShimmerDirection.ltr,
                          child: Container(
                            height: 18,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor:
                                  Color.fromARGB(255, 231, 227, 227),
                              direction: ShimmerDirection.ltr,
                              child: Container(
                                margin: EdgeInsets.only(left: 5, top: 5),
                                alignment: Alignment.topLeft,
                                color: Colors.white,
                                height: 12,
                                // child: Text(
                                //   store.address,
                                //   style: TextStyle(
                                //       color: Colors.black26, fontSize: 12),
                                // ),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor:
                                  Color.fromARGB(255, 231, 227, 227),
                              direction: ShimmerDirection.ltr,
                              child: Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 5, top: 5),
                                color: Colors.white,
                                height: 12,
                                // child: Text(
                                //   store.review,
                                //   style: TextStyle(
                                //       color: Colors.black26, fontSize: 12),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
