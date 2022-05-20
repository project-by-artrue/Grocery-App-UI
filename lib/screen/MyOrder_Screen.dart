import 'package:flutter/material.dart';
import 'package:grocery/widget/MyOrderCart.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'My Order',
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            tabs: [
              Tab(text: "Running"),
              Tab(text: "History"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyOrderListTileCard(),
            Container(),
          ],
        ),
      ),
    );
  }
}
