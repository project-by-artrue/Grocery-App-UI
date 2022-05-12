import 'package:flutter/material.dart';

class PopularItemsNearby extends StatelessWidget {
  String popularItemsImg;
 PopularItemsNearby(this.popularItemsImg,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7.5,
      width: MediaQuery.of(context).size.width / 1.4,
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(popularItemsImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          "Avocado",
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
                "Fresh SupreMarket",
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
            Row(
              children: [
                Text(
                  "\$240.00",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.add)
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
    );
  }
}
