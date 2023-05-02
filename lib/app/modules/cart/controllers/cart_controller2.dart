import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/produk.dart';

class CartController extends GetxController {
  // var dropdownValue = '1'.obs;
  // void changeDropdownValue(String value) => dropdownValue.value = value;
  // var basketValue = 0.obs;
  // List<Map<String, dynamic>> shoppingCards = [
  //   {
  //     "body": "Discover What's New In Beauty And\nRec ...",
  //     "stock": true,
  //     "price": "10000",
  //     "img":
  //         "https://images.unsplash.com/photo-1466150036782-869a824aeb25?fit=crop&w=1350&q=80",
  //   },
  //   {
  //     "body": "Carry the charm of New Orlean\nwith you ...",
  //     "stock": false,
  //     "price": "1000",
  //     "img":
  //         "https://images.unsplash.com/photo-1464375117522-1311d6a5b81f?fit=crop&w=1050&q=80",
  //   },
  //   {
  //     "body": "Make the most of what you wear today with ...",
  //     "stock": false,
  //     "price": "10000",
  //     "img":
  //         "https://images.unsplash.com/photo-1485120750507-a3bf477acd63?fit=crop&w=1050&q=80"
  //   }
  // ].obs;
  //
  // // void calculateBasketValue() {
  // //   basketValue.value = 0;
  // //   for (int i = 0; i < shoppingCards.length; i++) {
  // //     basketValue.value += int.parse(shoppingCards[i]["price"]);
  // //   }
  // // }
  // void calculateBasketValue() {
  //   basketValue.value = 0;
  //   for (int i = 0; i < shoppingCards.length; i++) {
  //     var card = shoppingCards[i];
  //     if (card["price"] is String) {
  //       basketValue.value += int.parse(card["price"] as String);
  //     }
  //   }
  // }
  //
  // void removeCard(int index) {
  //   shoppingCards.removeAt(index);
  //   calculateBasketValue();
  // }

  // List of products in the cart
  final _storage = GetStorage();
  RxList<Produk> _products = <Produk>[].obs;

  @override
  void onInit() {
    // Initialize the _products list with the stored data
    final storedData = _storage.read('products');
    if (storedData != null) {
      _products.value = storedData.map((e) => Produk.fromJson(e)).toList();
    }
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }

  // Add a product to the list and store the updated data in GetStorage
  // void addProduct(Produk product) {
  //   _products.add(product);
  // }

  // Adds a product to the cart
  void addToCart(Produk product) {
    _products.add(product);
    _storage.write('products', _products.toList());
  }

  // Removes a product from the cart
  // void removeFromCart(Produk product) {
  //   _products.remove(product);
  // }

  void removeFromCart(Produk product) {
    _products.remove(product);
    // Store the updated data in local storage
    _storage.write('products', _products.toList());
  }

  // Gets the total price of all products in the cart
  double get totalPrice {
    double total = 0.0;
    for (var product in _products) {
      total += product.harga!;
    }
    return total;
  }

  // Gets the number of products in the cart
  int get itemCount => _products.length;

  // Gets the list of products in the cart
  List<Produk> get products => _products.toList();
}
