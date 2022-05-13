// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ChackOut extends StatefulWidget {
  const ChackOut({Key? key}) : super(key: key);

  @override
  State<ChackOut> createState() => _ChackOutState();
}

class _ChackOutState extends State<ChackOut> {
  bool isChecked = false;
  bool isToChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(
        //   Icons.navigate_before_outlined,
        //   color: Colors.black,
        //   size: 35,
        // ),
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
        title: Text(
          "Chackout",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Delivery Option",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Row(
              children: [
                Radio(
                  onChanged: (value) {},
                  value: 1,
                  groupValue: 1,
                ),
                Text(
                  "Home Delivery(\$7850.11)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Deliver To",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "+ Add",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: ListTile(
                    leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "asset/MyAddress.png",
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Other",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("Location"),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                "Preference Time",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 60,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 60,
                  width: 120,
                  alignment: Alignment.center,
                  child: Text(
                    "Tommorow",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Store is closed",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: TextField(
                    cursorColor: Colors.green,
                    cursorHeight: 22,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter Promo Code"),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 90,
                  alignment: Alignment.center,
                  child: Text(
                    "Apply",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                "Choose Payment Method",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            GFCheckboxListTile(
              titleText: 'Cash on Delivery',
              subTitleText: 'Pay your payment after gettting item',
              avatar: GFAvatar(
                backgroundImage: AssetImage(
                  '',
                ),
              ),
              size: 25,
              activeBgColor: Colors.green,
              type: GFCheckboxType.circle,
              activeIcon: Icon(
                Icons.check,
                size: 15,
                color: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  isChecked = value;
                });
              },
              value: isChecked,
              inactiveIcon: null,
            ),
            GFCheckboxListTile(
              titleText: 'Digital Payment',
              subTitleText: 'Faster and safer way to send money',
              avatar: GFAvatar(
                backgroundImage: AssetImage(
                  '',
                ),
              ),
              size: 25,
              activeBgColor: Colors.green,
              type: GFCheckboxType.circle,
              activeIcon: Icon(
                Icons.check,
                size: 15,
                color: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  isToChecked = value;
                });
              },
              value: isToChecked,
              inactiveIcon: null,
            ),
            Container(
              height: 100,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              child: Text("Additionl note"),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "item Price",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "\$560.20",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Discount",
                ),
                Spacer(),
                Text(
                  "(-)\$29.21",
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Vat/Tax",
                ),
                Spacer(),
                Text(
                  "(+)\$52.10",
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Delivery Free",
                ),
                Spacer(),
                Text(
                  "Free",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Tottal Ammount",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "\$579.08",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                "Conform Order",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
