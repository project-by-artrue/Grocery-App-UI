// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery/model/model.dart';

class ShowBottomSheetBar extends StatelessWidget {
  const ShowBottomSheetBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * .5,
      margin: EdgeInsets.only(top: 20),
      child: GridView.builder(
        itemCount: model().icon.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GridTile(
              child: Container(
                margin: EdgeInsets.all(5),
                height: 80,
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
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(
                    model().iconname[index],
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ));

          // Container(
          //   height: 150,
          //   child: Column(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.all(5),
          //         height: 80,
          //         width: 100,
          //         decoration: BoxDecoration(
          //           color: Colors.green,
          //           borderRadius: BorderRadius.circular(5),
          //         ),
          //       ),
          //       // Container(
          //       //   height: 20,
          //       //   width: 100,
          //       //   alignment: Alignment.center,
          //       //   child: Flexible(
          //       //     child: Text(""),
          //       //   ),
          //       // )
          //     ],
          //   ),
          // );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 10),
      ),
    );
  }
}
