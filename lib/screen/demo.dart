import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () {
              Map<String, dynamic> user = <String, dynamic>{
                "first": "Alan",
                "middle": "Mathison",
                "last": "Turing",
                "born": 1912
              };
              db.collection("users").add(user).then((DocumentReference doc) {
                user = <String, dynamic>{
                  "first": "Alan",
                  "middle": "Mathison",
                  "last": "Turing",
                  "born": 1912,
                  'userID': doc.id
                };
                db.collection("users").doc(doc.id).set(user);
              });
            },
            child: Text("Add data")),
      )),
    );
  }
}
