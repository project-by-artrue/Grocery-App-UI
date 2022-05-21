// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Category/category_bloc.dart';
import 'package:grocery/Bloc/SubCategory/subcategory_bloc.dart';
import 'package:grocery/model/model.dart';
import 'package:grocery/widget/CategoryCard.dart';

class ViewAllCategories extends StatefulWidget {
  const ViewAllCategories({Key? key}) : super(key: key);

  @override
  State<ViewAllCategories> createState() => _ViewAllCategoriesState();
}

class _ViewAllCategoriesState extends State<ViewAllCategories> {
  @override
  Widget build(BuildContext context) {
    SubcategoryBloc b = BlocProvider.of<SubcategoryBloc>(context);
    return Scaffold(
      appBar: AppBar(
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
          child: BlocConsumer<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is ShowCategory) {
                  return GridView.builder(
                    itemCount: state.catedgoryList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          b.add(ExploreSelectedCategory(
                              state.catedgoryList[index].categoryId));
                          Navigator.pushNamed(context, 'ShowCategoriesItem',
                              arguments: state.catedgoryList[index].categoryId);
                        },
                        child: CategoryCard(state.catedgoryList[index].image,
                            state.catedgoryList[index].categoryName),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
              listener: (context, state) {})),
    );
  }
}
