import 'package:flutter/material.dart';
import 'package:grocery/model/model.dart';
import 'package:grocery/widget/Store.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before_outlined,
            color: Colors.black,
            size: 35,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Popular Store",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: model().store.length,
        itemBuilder: (context, index) {
          if (model().store[index].isPopular) {
            return StoreCard(model().store[index]);
          } else {
            return SizedBox(
              height: 0,
            );
          }
        },
      ),
    );
  }
}
