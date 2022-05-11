// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({Key? key}) : super(key: key);

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  //  LatLng _center;

  // late Position currentLocation;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUserLocation();
  // }

  // Future<Position> locateUser() async {
  //   return Geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // }

  // getUserLocation() async {
  //   currentLocation = await locateUser();
  //   setState(() {
  //     _center = LatLng(currentLocation.latitude, currentLocation.longitude);
  //   });
  //   print('center $center');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'Home');
          },
          icon: Icon(
            Icons.navigate_before_outlined,
            color: Colors.black,
            size: 35,
          ),
        ),
        title: Text(
          "Set Location",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/location.png"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "FIND STORES AND ITEMS NEAR YOU",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            child: Flexible(
              flex: 1,
              child: Text(
                "By allowing location access,you can search for stores and items near you and receive more accurate delivery",
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.gps_fixed,
                    color: Colors.white,
                  ),
                  Text(
                    "Use Current Location",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map_rounded,
                    color: Colors.green,
                  ),
                  Text(
                    "Set From Map",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                // color: Colors.green,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.green, width: 2)),
          ),
        ],
      ),
    );
  }
}
