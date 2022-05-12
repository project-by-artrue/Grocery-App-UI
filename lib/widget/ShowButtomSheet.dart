import 'package:flutter/material.dart';

class ShowButtomSheet extends StatelessWidget {
  const ShowButtomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("asset/ShopingCart.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "offer campaign",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Organic Shop",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    "★★☆☆☆(0)",
                    style: TextStyle(color: Colors.black26, fontSize: 12),
                  ),
                  Text(
                    "\$520.99",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Discription",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "This is test campaign",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                "Quantity",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_circle_outlined,
                  color: Colors.grey,
                ),
              ),
              Text(
                "1",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Text(
            "Tottal Ammount :\$ 520.99",
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                child: Icon(
                  Icons.store_sharp,
                  size: 40,
                  color: Colors.green,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.5,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Order Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
