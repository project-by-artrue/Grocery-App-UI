// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery/model/model.dart';

class ViewAllCategories extends StatefulWidget {
  const ViewAllCategories({Key? key}) : super(key: key);

  @override
  State<ViewAllCategories> createState() => _ViewAllCategoriesState();
}

class _ViewAllCategoriesState extends State<ViewAllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'Home');
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 40,
            )),
        // Icon(
        //   Icons.keyboard_arrow_left,
        //   color: Colors.black,
        //   size: 40,
        // ),
        title: Text(
          "Categories",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          itemCount: model().img.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(model().img[index]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(model().name[index])
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
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
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
      ),
    );
  }
}
