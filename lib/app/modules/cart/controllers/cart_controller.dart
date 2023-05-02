import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:sahabatmt/app/data/models/order.dart';

import '../../../data/models/produk.dart';
import '../../../data/models/transaction.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

class CartController extends GetxController {
  final _storage = GetStorage();
  MidtransSDK? _midtrans;

  Rx<Produk> _product = Produk().obs;
  final RxInt jumlahpesan = 1.obs;
  Rx<Order> _order = Order().obs;

  @override
  void onInit() {
    // Initialize the _product with the stored data
    initSDK();
    final hasData = _product.value != null;
    final storedData = _storage.read('product');
    final storedemail = _storage.read('email');
    final storedname = _storage.read('nama');

    if (storedData != null) {
      _product.value = Produk.fromJson2(storedData);
    }
    jumlahpesan.value = 1;
    _order.value.kuantitas = jumlahpesan.value.toString();
    _order.value.email = storedemail;
    _order.value.nama = storedname;
    _order.value.phone = '';
    _order.value.address = '';
    super.onInit();
  }

  void updatepesanan(int pesan) {
    jumlahpesan.value = pesan;
    _order.value.kuantitas = pesan.toString();
    print(jumlahpesan.value);
    print("HAHAHHA");
  }

// Adds a product to the cart
  void addToCart(Produk product) {
    if (product.nama == _product.value.nama) {
      Get.snackbar(
        "Barang sudah ada",
        "Silahkan checkout terlebih dahulu",
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      _product.value = product;
      _storage.write('product', _product.value.toJson());
      _order.value.namaBarang = product.nama;
      _order.value.harga = product.harga.toString();
      Get.snackbar(
        "Barang sudah ditambahkan",
        "Silahkan checkout di keranjang",
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

// Removes a product from the cart
  void removeFromCart() {
    _product.value = Produk(nama: 'none', id: 0);
    // Remove the data from local storage
    _storage.remove('product');
  }

// Gets the product in the cart
  Produk get product => _product.value;

  // Gets the total price of all products in the cart
  double get totalPrice {
    double total = 0.0;
    total += (jumlahpesan.value * (_product.value.harga ?? 0).toDouble());
    _order.value.grossAmount = total.toString();
    return total;
  }

  // Gets the number of products in the cart
  int? get itemCount => jumlahpesan.value;

  // Gets the list of products in the cart
  Produk get products => _product.value;

  Order get orderan => _order.value;

  // void makepay() async {
  //   Transaction transaction = Transaction(
  //     id: "ORDER-ID",
  //     amount: 100000,
  //     customerName: "aksa",
  //     customerEmail: "aksa@gmail.com",
  //     customerPhone: "082192571080",
  //   );
  //
  //   // String snapToken = await _midtrans? getSnapToken(transaction);
  // }

  void initSDK() async {
    _midtrans = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: dot_env.dotenv.env['SB-Mid-client-dLSL_UUQIwVliBDR'] ?? "",
        merchantBaseUrl:
            dot_env.dotenv.env['SB-Mid-server-CQL5NRb_IwzlkRKI-6FNPc1_'] ?? "",
      ),
    );
    _midtrans?.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );

    _midtrans!.setTransactionFinishedCallback((result) {
      print(result.toJson());
    });
  }
}
