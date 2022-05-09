// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Demo extends StatefulWidget {
//   Demo({Key? key}) : super(key: key);

//   @override
//   State<Demo> createState() => _DemoState();
// }

// class _DemoState extends State<Demo> {
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               Map<String, dynamic> user = <String, dynamic>{
//                 "first": "Alan",
//                 "middle": "Mathison",
//                 "last": "Turing",
//                 "born": 1912
//               };
//               db.collection("users").add(user).then((DocumentReference doc) {
//                 user = <String, dynamic>{
//                   "first": "Alan",
//                   "middle": "Mathison",
//                   "last": "Turing",
//                   "born": 1912,
//                   'userID': doc.id
//                 };
//                 db.collection("users").doc(doc.id).set(user);
//               });
//             },
//             child: Text("Add data")),
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: CircleTabIndicator(color: Colors.green, radius: 4),
            isScrollable: true,
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(text: 'Week 1'),
              Tab(text: 'Week 2'),
              Tab(text: 'Week 3'),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color? color, @required double? radius})
      : _painter = _CirclePainter(
          color!,
          radius!,
        );

  @override
  BoxPainter createBoxPainter([void onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
