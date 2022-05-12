// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery/model/model.dart';

class ShowBottomSheetBar extends StatelessWidget {
  const ShowBottomSheetBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: GridView.builder(
        itemCount: model().icon.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 70,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(
                height: 30,
                width: double.infinity,
                child: Text(
                  model().iconname[index],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 100,
          crossAxisSpacing: 10,
          crossAxisCount: 4,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }
}
