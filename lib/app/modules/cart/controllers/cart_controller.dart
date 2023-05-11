import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:sahabatmt/app/data/models/order.dart';

import '../../../data/models/cart.dart';
import 'package:sahabatmt/app/data/models/produk.dart';
import '../../../data/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

class CartController extends GetxController {
  var cartItemsList = RxList<Cart>([]).obs;

  final _storage = GetStorage();
  var totalItem = RxInt(0).obs;

  var selectedValues = 1.obs; // Create RxInt to hold dropdown value
  var dropdownValues = RxList([1, 2, 3, 4, 5, 6, 7, 8, 9]);

  void addToCart(Produk produk, int quantity) {
    Cart cartItem = Cart(
      produk: produk,
      quantity: quantity,
    );

    var cartItems = cartItemsList.value;
    Cart? existingCartItem = cartItems.firstWhereOrNull(
      (item) => item.produk!.id == produk.id,
      // set nullable to true to allow returning null
    );

    if (existingCartItem != null) {
      existingCartItem.quantity = existingCartItem.quantity! + quantity;
    } else {
      // create new cart item if none exists
      cartItems.add(cartItem);
    }

    cartItemsList.value = cartItems;
    // _storage.write('cartItems', cartItemsList.value.toJson());
    _storage.write(
        'cartItems', cartItemsList.value.map((item) => item.toJson()).toList());
  }

  void _loadCartItemsFromStorage() {
    final List<dynamic>? cartData = _storage.read('cartItems');
    if (cartData != null) {
      final cartItems = cartData.map((item) => Cart.fromJson(item)).toList();
      cartItemsList.value = RxList<Cart>.from(cartItems);

      getTotalItemCount();
    }
  }

  void savethecurrentItemsToStorage() {
    _storage.write(
        'cartItems', cartItemsList.value.map((item) => item.toJson()).toList());
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in cartItemsList.value) {
      total += item.getTotalPrice();
    }
    return total;
  }

  int getTotalItemCount() {
    int totalCount = 0;
    for (var cartItem in cartItemsList.value) {
      totalCount += cartItem.quantity ?? 0;
    }
    // totalItem.value = totalCount;
    return totalCount;
  }

  String formatPrice(double price) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      decimalDigits: 0,
      symbol: 'Rp.',
    );
    return formatter.format(price);
  }

  // void getTotalItemCount() {
  //   // RxInt totalCount = RxInt(0);
  //   for (var cartItem in cartItemsList.value) {
  //     totalItem.value += cartItem.quantity ?? 0;
  //   }
  //   print('totalCount');
  //   print(totalItem.value);
  //   // totalItem.value = totalCount;
  // }

  void removeFromCart(Cart item) {
    cartItemsList.value.remove(item);
    print(cartItemsList.value.asMap());
    _storage.write(
      'cartItems',
      cartItemsList.value.map((item) => item.toJson()).toList(),
    );
  }

  void setProduk(Cart cart) {}

  void updateCartItemQuantity(Cart item, int quantity) {
    item.quantity = quantity;
    cartItemsList.refresh();
    print(item.quantity);
    _storage.write(
      'cartItems',
      cartItemsList.value.map((item) => item.toJson()).toList(),
    );
  }

  void clearCart() {
    cartItemsList.value.clear();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    _loadCartItemsFromStorage();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    _loadCartItemsFromStorage();
    super.onReady();
  }
}
