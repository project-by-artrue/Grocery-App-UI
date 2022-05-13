import 'package:flutter/material.dart';
import 'package:grocery/model/model.dart';

class Categories extends StatelessWidget {
  String img;
  String name;
  Categories(this.img, this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'ShowCategoriesItem');
      },
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // height: 120,
              width: 50,
              // margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              width: 65,
              child: Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
