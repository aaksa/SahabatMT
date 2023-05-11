import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:sahabatmt/app/modules/shipping_address/controllers/shipping_address_controller.dart';

import '../../../constants/constants.dart';
import 'package:sahabatmt/app/data/models/order.dart';
import '../../../data/models/cart.dart';
import '../../cart/controllers/cart_controller.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController
  MidtransSDK? _midtrans;

  final count = 0.obs;
  // final myOrder = Get.arguments as Order;
  // late final Order myOrder;
  final myDress = Get.arguments as Addresum;
  Rx<Order> _order = Order().obs;
  var cartItemsList = RxList<Cart>([]).obs;

  final _storage = GetStorage();

  // orderan
  // void addToItems() {
  //   var cartController = Get.find<CartController>();
  //   var orderan = cartController.orderan;
  //   _order.value = orderan;
  // }

  Order get orderanbosku => _order.value;

  void addmoreinfo() {
    // var cartController = Get.find<ShippingAddressController>();
    // String add = cartController.shipadres;
    // String nomor_hp = cartController.nomor;

    _order.value.address = 'myDress.adress';
    _order.value.phone = ' myDress.number';
    _order.value.nama = 'aksa';
    _order.value.address = 'asdfasdf';
    _order.value.email = 'aa@gmail.com';
    _order.value.phone = '0000';
    _order.value.grossAmount = '3000';
    _order.value.namaBarang = 'sabu';
    _order.value.kuantitas = '10';
  }

  final http.Client _client = http.Client();
  GetStorage loginState = GetStorage();
  RxString snapToken = ''.obs;
  RxString snapUrl = ''.obs;

  RxBool isLoading = false.obs;

  // Future<void> payProduk() async {
  //   String _token = loginState.read('token');
  //   isLoading.value = true;
  //   var response = await _client.post(
  //     Uri.parse(baseUrl3),
  //     headers: {
  //       'Authorization': 'Bearer $_token',
  //     },
  //     body: {
  //       'nama': 'anu baru 2',
  //       'email': 'order@gmail.com',
  //       'phone': '082192',
  //       'address': 'order.address',
  //       'gross_amount': '1000',
  //       'nama_barang': 'order.namaBarang',
  //       'kuantitas': '3',
  //       'harga': '2',
  //       'items': jsonEncode(cartItemsList.value)
  //     },
  //   );
  //   print(json.decode(response.body));
  //   var body = json.decode(response.body);
  //   print('HAHAHAA');
  //   print(body);
  //
  //   // Call the payProduk API endpoint to get the snapToken
  //   // and update the snapToken variable with the response
  //   // from the API endpoint.
  //   // You can use the http package or any other package
  //   // to make the API call.
  //   // Once you receive the snapToken, set the isLoading
  //   // variable to false to stop the loader.
  //   snapToken.value = body['snap_token'];
  //   snapUrl.value = body['redirect_url'];
  //   isLoading.value = false;
  //   print(body);
  //   return body;
  // }

  Future payProduk(
    List items,
    String grossAmount,
    String name,
    String email,
    String phone,
    String address,
    String city,
    String ongkir,
  ) async {
    String _token = loginState.read('token');
    isLoading.value = true;

    var url = Uri.parse(baseUrl3);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode({
        'items': items,
        'gross_amount': grossAmount,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'city': city,
        'ongkir': ongkir,
      }),
    );
    var body = json.decode(response.body);
    if (response.statusCode == 200) {
      snapToken.value = body['snap_token'];
      snapUrl.value = body['redirect_url'];
      isLoading.value = false;
      print(body);
      return body;
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to pay for products.');
    }
  }

  // Future<String> payProdukAndGetSnapToken() async {
  //   var body = await payProduk();
  //   var snapToken = body['snap_token'];
  //   return snapToken;
  // }

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
    // addToItems();
    _loadCartItemsFromStorage();
    addmoreinfo();
    initSDK();
    super.onInit();
  }

  @override
  void onReady() {
    addmoreinfo();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void _loadCartItemsFromStorage() {
    final List<dynamic>? cartData = _storage.read('cartItems');
    if (cartData != null) {
      final cartItems = cartData.map((item) => Cart.fromJson(item)).toList();
      cartItemsList.value = RxList<Cart>.from(cartItems);
    }
  }

  int getTotalItemCount() {
    int totalCount = 0;
    for (var cartItem in cartItemsList.value) {
      totalCount += cartItem.quantity ?? 0;
    }
    // totalItem.value = totalCount;
    return totalCount;
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in cartItemsList.value) {
      total += item.getTotalPrice();
    }
    total + 100000;
    return total;
  }
}
