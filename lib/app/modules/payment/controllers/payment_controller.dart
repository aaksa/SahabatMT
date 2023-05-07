import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:sahabatmt/app/modules/shipping_address/controllers/shipping_address_controller.dart';

import '../../../constants/constants.dart';
import 'package:sahabatmt/app/data/models/order.dart';
import '../../cart/controllers/cart_controller.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController
  MidtransSDK? _midtrans;

  final count = 0.obs;
  // final myOrder = Get.arguments as Order;
  // late final Order myOrder;
  Rx<Order> _order = Order().obs;

  // orderan
  void addToItems() {
    var cartController = Get.find<CartController>();
    var orderan = cartController.orderan;
    _order.value = orderan;
  }

  Order get orderanbosku => _order.value;

  void addmoreinfo() {
    var cartController = Get.find<ShippingAddressController>();
    String add = cartController.shipadres;
    String nomor_hp = cartController.nomor;

    _order.value.address = add;
    _order.value.phone = nomor_hp;
  }

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

  @override
  void onInit() {
    addToItems();
    addmoreinfo();
    initSDK();
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
