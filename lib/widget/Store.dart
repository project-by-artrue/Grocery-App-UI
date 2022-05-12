import 'package:flutter/material.dart';
import 'package:grocery/model/model.dart';

class StoreCard extends StatelessWidget {
  StoreDetails store;
  StoreCard(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'ShwoStoreDetails');
      },
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(store.storeImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            title: Text(
              store.storeName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    store.address,
                    style: TextStyle(color: Colors.black26, fontSize: 12),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    store.review,
                    style: TextStyle(color: Colors.black26, fontSize: 12),
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.favorite_border,
              color: Colors.black26,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(),
        ],
      ),
    );
  }
}
