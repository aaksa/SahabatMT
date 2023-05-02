import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../constants/constants.dart';
import '../../../data/models/order.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController

  final count = 0.obs;

  final http.Client _client = http.Client();
  GetStorage loginState = GetStorage();
  RxString snapToken = ''.obs;
  RxString snapUrl = ''.obs;

  RxBool isLoading = false.obs;

  Future<void> payProduk(Order order) async {
    String _token = loginState.read('token');
    isLoading.value = true;
    var response = await _client.post(
      Uri.parse(baseUrl3),
      headers: {
        'Authorization': 'Bearer $_token',
      },
      body: {
        'nama': order.nama,
        'email': order.email,
        'phone': order.phone,
        'address': order.address,
        'gross_amount': order.grossAmount,
        'nama_barang': order.namaBarang,
        'kuantitas': order.kuantitas,
        'harga': order.harga
      },
    );
    var body = json.decode(response.body);

    // Call the payProduk API endpoint to get the snapToken
    // and update the snapToken variable with the response
    // from the API endpoint.
    // You can use the http package or any other package
    // to make the API call.
    // Once you receive the snapToken, set the isLoading
    // variable to false to stop the loader.
    snapToken.value = body['snap_token'];
    snapUrl.value = body['redirect_url'];
    isLoading.value = false;
    print(body);
    return body;
  }

  // Future<String> payProdukAndGetSnapToken() async {
  //   var body = await payProduk();
  //   var snapToken = body['snap_token'];
  //   return snapToken;
  // }
  //
  // Future<String> payProdukAndRedirect() async {
  //   var body = await payProduk();
  //   var redirectUrl = ;
  //   return redirectUrl;
  // }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
