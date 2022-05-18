import 'package:flutter/material.dart';

class MyOrderListTileCard extends StatelessWidget {
  const MyOrderListTileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/fish.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Row(
        children: [
          Text(
            "Order ID: #100023",
            style: TextStyle(color: Colors.black),
          ),
          Spacer(),
          Container(
            height: 20,
            width: 50,
            alignment: Alignment.center,
            child: Text(
              'Pack',
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5)),
          )
        ],
      ),
      subtitle: Row(
        children: [
          Text("16 May 2022 01:06 PM"),
          Spacer(),
          Container(
            height: 20,
            width: 80,
            alignment: Alignment.center,
            margin: EdgeInsets.all(5),
            child: Text(
              'Track Order',
              style: TextStyle(fontSize: 10, color: Colors.green),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(5)),
          )
        ],
      ),
    );
  }
}
