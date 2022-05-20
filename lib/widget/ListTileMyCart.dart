// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyCartListtile extends StatelessWidget {
  const MyCartListtile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/fish.jpg"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              "Orbit Fresh Mint",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
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
            // TextButton(
            //   style: TextButton.styleFrom(
            //       primary: Colors.black, backgroundColor: Colors.green),
            //   onPressed: () {},
            //   child: Text(
            //     "Pack",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
          ],
        ),
        subtitle: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text("★★☆☆☆(0)"),
            ),
            Row(
              children: [
                Text("\$300.00"),
                Spacer(),
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.remove_circle_outlined,
                //     color: Colors.grey,
                //   ),
                // ),
                Icon(
                  Icons.remove_circle_outlined,
                  color: Colors.grey,
                ),
                Text(
                  "1",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.add_circle,
                //     color: Colors.green,
                //   ),
                // ),
                Icon(
                  Icons.add_circle,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
