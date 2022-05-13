import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("add location"),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },child: Icon(Icons.add),),
    );
  }
}
