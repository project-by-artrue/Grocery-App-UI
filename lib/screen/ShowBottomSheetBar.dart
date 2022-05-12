// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery/model/model.dart';

class ShowBottomSheetBar extends StatelessWidget {
  List<String> navList = [
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * .5,
      margin: EdgeInsets.only(top: 20),
      child: GridView.builder(
        itemCount: model().icon.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: GridTile(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 50,
                  width: 100,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        model().icon[index],
                        height: 40,
                        width: 40,
                        color: Colors.white,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    // image: DecorationImage(
                    //   image: AssetImage(model().icon[index]),
                    // ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                footer: GridTileBar(
                  title: Container(
                    width: 1,
                    alignment: Alignment.center,
                    child: Text(
                      model().iconname[index],
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 10),
      ),
    );
  }
}
