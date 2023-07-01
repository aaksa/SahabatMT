import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/data/models/transaction.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sahabatmt/app/modules/payment/controllers/payment_controller.dart';

class RiwayatTransaksiController extends GetxController {
  //TODO: Implement RiwayatTransaksiController

  final count = 0.obs;
  RxBool isLoading = true.obs;

  GetStorage loginState = GetStorage();

  var transaksiData = <Transaction>[].obs;

  @override
  void onInit() {
    getTransaction();
    ever(transaksiData, (_) => update());
    super.onInit();
  }

  void getTransaction() async {
    isLoading.value = true;

    String email = loginState.read('email');
    try {
      var transaction = await fetchTransaction(email);
      // transaksiData.value = List<Transaction>.from([transaction]);
      transaksiData.assignAll(transaction);
      isLoading.value = false;
    } catch (e) {
      print(e.toString());
      isLoading.value = false;
    }
  }

  Future fetchTransaction(String email) async {
    String token = loginState.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/transaction/$email'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      // print('HAHAHAHAA');
      // var anu = jsonDecode(response.body);
      // print(anu);
      // // var asu = Transaction.fromJson(anu);
      // // print(asu);
      var jsonResponse = jsonDecode(response.body);
      var transactionList = jsonResponse['data']['data'] as List;

      try {
        var transactions = transactionList
            .map((transactionJson) => Transaction.fromJson(transactionJson))
            .toList();
        return transactions;
      } catch (e) {
        print('Error occurred while mapping transactions: $e');
      }

      // transaksiData.value = transactions;
    } else {
      throw Exception('Failed to fetch transaction');
    }
  }

  @override
  void onReady() {
    super.onReady();
    getTransaction();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
