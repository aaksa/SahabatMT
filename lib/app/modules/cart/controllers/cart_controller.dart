import 'package:get/get.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  var dropdownValue = '1'.obs;
  void changeDropdownValue(String value) => dropdownValue.value = value;
  var basketValue = 0.obs;
  List<Map<String, dynamic>> shoppingCards = [
    {
      "body": "Discover What's New In Beauty And\nRec ...",
      "stock": true,
      "price": "10000",
      "img":
          "https://images.unsplash.com/photo-1466150036782-869a824aeb25?fit=crop&w=1350&q=80",
    },
    {
      "body": "Carry the charm of New Orlean\nwith you ...",
      "stock": false,
      "price": "1000",
      "img":
          "https://images.unsplash.com/photo-1464375117522-1311d6a5b81f?fit=crop&w=1050&q=80",
    },
    {
      "body": "Make the most of what you wear today with ...",
      "stock": false,
      "price": "10000",
      "img":
          "https://images.unsplash.com/photo-1485120750507-a3bf477acd63?fit=crop&w=1050&q=80"
    }
  ].obs;

  // void calculateBasketValue() {
  //   basketValue.value = 0;
  //   for (int i = 0; i < shoppingCards.length; i++) {
  //     basketValue.value += int.parse(shoppingCards[i]["price"]);
  //   }
  // }
  void calculateBasketValue() {
    basketValue.value = 0;
    for (int i = 0; i < shoppingCards.length; i++) {
      var card = shoppingCards[i];
      if (card["price"] is String) {
        basketValue.value += int.parse(card["price"] as String);
      }
    }
  }

  void removeCard(int index) {
    shoppingCards.removeAt(index);
    calculateBasketValue();
  }
}
