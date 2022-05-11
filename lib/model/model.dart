import 'package:flutter/material.dart';
import 'package:grocery/widget/ShowButtomSheet.dart';

class model {
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  List<StoreDetails> store = [
    StoreDetails("asset/FreshLocalFish.jpg", "Eorange",
        "House:00,Road:00,city:00,Country", "★★☆☆☆(2)", true, false),
    StoreDetails("asset/stationary.jpg", "Family superMarket",
        "House:00,Road:00,city:00,Country", "★★☆☆☆(2)", true, false),
    StoreDetails("asset/Lemon.jpg", "Fresh local",
        "House:00,Road:00,city:00,Country", "★★☆☆☆(2)", true, false),
    StoreDetails("asset/FreshLocalFish.jpg", "Online market",
        "House:00,Road:00,city:00,Country", "★★☆☆☆(2)", false, false),
    StoreDetails("asset/fish.jpg", "Sk General Store",
        "House:00,Road:00,city:00,Country", "★★☆☆☆(2)", true, false),
    StoreDetails("asset/FreshLocalFish.jpg", "Veggie Market",
        "House:00,Road:00,city:00,Country", "★★☆☆☆(2)", true, false),
  ];

  List StoresName = [
    "Eorange",
    "Family superMarket",
    "Fresh local",
    "Fresh superMarket",
    "Online market",
    "Sk General Store",
    "Organic Shop",
    "Vegan Market",
    "Veggie Market",
    "Eorange",
    "Family superMarket",
    "Fresh local",
    "Fresh superMarket",
    "Online market",
    "Sk General Store",
  ];

  List name = [
    "office Stationery",
    "Skin care",
    "Fish meat",
    "office Stationery",
    "Skin care",
    "Fish meat",
    "office Stationery",
    "Skin care",
    "Fish meat",
    "office Stationery",
    "Skin care",
    "Fish meat",
    "office Stationery",
    "Skin care",
    "Fish meat"
  ];

 

  List img = [
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
    "asset/stationary.jpg",
    "asset/fish.jpg",
  ];

  List popularStorImg = [
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
    "asset/ShopingCart.jpg",
    "asset/FreshLocalFish.jpg",
    "asset/Lemon.jpg",
  ];


   static void bottomsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height / 2.3,
              child: ShowButtomSheet());
        });
  }

  
}

class StoreDetails {
  String storeImage;
  String storeName;
  String address;
  String review;
  bool isPopular;
  bool isclose;
  StoreDetails(this.storeImage, this.storeName, this.address, this.review,
      this.isPopular, this.isclose);
}
