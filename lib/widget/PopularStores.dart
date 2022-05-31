// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/store.dart';
import 'package:shimmer/shimmer.dart';

class PopularStores extends StatelessWidget {
  Store? showStore;

  PopularStores(this.showStore, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // showStore!.storeCloseTime.split(" ");
    int closehourse =
        int.parse(showStore!.storeCloseTime.split(" ")[0].split(":")[0]);
    int closeminite =
        int.parse(showStore!.storeCloseTime.split(" ")[0].split(":")[1]);
    TimeOfDay closeTime = TimeOfDay(hour: closehourse, minute: closeminite);
    print("kkkkkkkkkkkkkkkkkkkkkk${closeTime}");
    int starthourse =
        int.parse(showStore!.storeCloseTime.split(" ")[0].split(":")[0]);
    int startminite =
        int.parse(showStore!.storeCloseTime.split(" ")[0].split(":")[1]);
    TimeOfDay startTime = TimeOfDay(hour: starthourse, minute: startminite);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'ShwoStoreDetails',
            arguments: showStore?.storeName.toString() ?? "");
      },
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5.5,
            width: MediaQuery.of(context).size.width / 1.8,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.height / 9.9,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: NetworkImage(showStore!.storeImage),
                    //   fit: BoxFit.cover,
                    // ),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          showStore!.storeImage,
                        ),
                        fit: BoxFit.cover),
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
                    showStore!.storeName,
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
                    showStore!.location,
                    style: TextStyle(color: Colors.black26, fontSize: 12),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "★★☆☆☆(0)",
                    style: TextStyle(color: Colors.black26, fontSize: 12),
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
                  height: MediaQuery.of(context).size.height / 9.9,
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
          )
        ],
      ),
    );
  }

  placeholderimage(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(137, 220, 218, 218),
      highlightColor: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height / 9.9,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class StoreShimmer extends StatelessWidget {
  const StoreShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 5.5,
          width: MediaQuery.of(context).size.width / 1.8,
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Color.fromARGB(137, 220, 218, 218),
                highlightColor: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height / 9.9,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    // image: DecorationImage(
                    //   image: NetworkImage(showStore!.storeImage),
                    //   fit: BoxFit.cover,
                    // ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: Color.fromARGB(137, 220, 218, 218),
                highlightColor: Colors.white,
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5),
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Color.fromARGB(255, 255, 255, 255),
                  // child: Text(
                  //   showStore!.storeName,
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: Color.fromARGB(137, 220, 218, 218),
                highlightColor: Colors.white,
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5),
                  height: 10,

                  width: MediaQuery.of(context).size.width * 0.5,
                  // child: Text(
                  //   showStore!.location,
                  //   style: TextStyle(color: Colors.black26, fontSize: 12),
                  // ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 5),
                color: Color.fromARGB(255, 255, 255, 255),
                width: 30,
                // child: Text(
                //   "★★☆☆☆(0)",
                //   style: TextStyle(color: Colors.black26, fontSize: 12),
                // ),
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
  }
}
