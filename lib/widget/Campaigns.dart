import 'package:flutter/material.dart';

class Campaigns extends StatelessWidget {
  String compaignsimg;
     Campaigns(this.compaignsimg,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.7,
      width: MediaQuery.of(context).size.width / 2.8,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 6.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  compaignsimg,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 5),
            child: Text(
              "offer Campaign",
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
              "Orgenic Shop",
              style: TextStyle(color: Colors.black26, fontSize: 12),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 5),
            // child: Text(
            //   "★★☆☆☆(0)",
            //   style: TextStyle(
            //       color: Colors.black26, fontSize: 12),
            // ),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  "\$560.20",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "★0.0",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ],
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
