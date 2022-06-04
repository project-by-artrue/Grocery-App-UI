import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Store/store_bloc.dart';
import 'package:grocery/model/model.dart';
import 'package:grocery/widget/Store.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreBloc, StoreState>(
        builder: (context, state) {
          if (state is ShowStore) {
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
                backgroundColor: Colors.white,
                title: Text(
                  "Popular Store",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300),
                ),
                elevation: 0,
                centerTitle: true,
              ),
              body: ListView.builder(
                itemCount: state.showStore.length,
                itemBuilder: (context, index) {
                  String key = state.showStore.keys.elementAt(index);

                  return StoreCard(state.showStore[key]);
                },
              ),
            );
          } else {
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
                backgroundColor: Colors.white,
                title: Text(
                  "Popular Store",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300),
                ),
                elevation: 0,
                centerTitle: true,
              ),
              body: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return StoreCard_Shimmer();
                },
              ),
            );
          }
        },
        listener: (context, state) {});
  }
}
