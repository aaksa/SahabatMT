import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sahabatmt/app/modules/shipping_address/controllers/shipping_address_controller.dart';

import '../../../constants/constants.dart';
import 'package:sahabatmt/app/data/models/order.dart';
import '../../../data/models/cart.dart';
import '../../../routes/app_pages.dart';
import '../../cart/controllers/cart_controller.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController
  MidtransSDK? _midtrans;

  final count = 0.obs;
  Timer? timer;
  bool isTransactionCreated =
      false; // Flag to track if the transaction is already created

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
  RxInt idOrder = 0.obs;

  RxBool isLoading = false.obs;

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
      idOrder.value = body['order_id'];
      isLoading.value = false;
      print(body);
      return body;
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to pay for products.');
    }
  }

  Future createTransaksi(
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

    var url = Uri.parse(baseUrl4);
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
      isLoading.value = false;
      print(body);
      return body;
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to pay for products.');
    }
  }

  void initSDK() async {
    _midtrans!.setTransactionFinishedCallback((result) {
      // Payment failed or canceled, handle error case here
      String? orderId = result.orderId;
      print('Order ID: $orderId');
    });

    _midtrans = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: dot_env.dotenv.env['Mid-client-kvzL0oZFFud0KuyZ'] ?? "",
        merchantBaseUrl:
            dot_env.dotenv.env['Mid-server-HOemaqpBGkLlhK256O8Mh94j'] ?? "",
      ),
    );
    _midtrans?.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );

    @override
    void dispose() {}
  }

  @override
  void onInit() {
    // addToItems();
    isTransactionCreated = false;
    loadCartItemsFromStorage();
    addmoreinfo();
    initSDK();
    super.onInit();
  }

  @override
  void onReady() {
    loadCartItemsFromStorage();
    addmoreinfo();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void loadCartItemsFromStorage() {
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

  Future<Map<String, dynamic>> getPaymentStatus(String orderId) async {
    final url = 'https://api.midtrans.com/v2/$orderId/status';

    String serverKey = "Mid-server-IImGgjrLtnePkOvxnLKMQS6X";
    String authString = base64Encode(utf8.encode("$serverKey"));

    print('ini auth');
    print(authString);
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Basic $authString',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print('Berhasil Boskuuu');
      print(jsonResponse['status_code']);
      print(jsonResponse);
      var status = jsonResponse['status_code'];
      var statusm = jsonResponse['status_message'];

      if (status == 200 || status == '200' || statusm == 'Success') {
        timer?.cancel();
        QuickAlert.show(
            context: Get.context!,
            type: QuickAlertType.success,
            title: "Berhasil",
            text: 'Transaksi Anda berhasil',
            onConfirmBtnTap: () {
              if (!isTransactionCreated) {
                createTransaksi(
                    cartItemsList.value,
                    totalPrice.toString(),
                    myDress.nama,
                    myDress.email,
                    myDress.number,
                    myDress.adress,
                    myDress.city,
                    myDress.ongkir);
              }
              isTransactionCreated =
                  true; // Set the flag to indicate transaction creation
              _storage.remove('cartItems');
              Get.offAllNamed(Routes.RIWAYAT_TRANSAKSI);
            });
        return jsonResponse;
      }
      // } else {
      //   // getPaymentStatus(idOrder.toString());
      // }
      return jsonResponse;
    } else {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.success,
          title: "Gagal Melakukan Transaksi",
          text: 'Ada Masalah Terhadap Transaksi Anda',
          onConfirmBtnTap: () {
            Get.toNamed(Routes.CART);
          });
      print('Gagall bosku');
    }
    throw Exception('Failed to retrieve payment status');
  }

  void startFetching() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(const Duration(seconds: 3),
          (_) => getPaymentStatus(idOrder.toString()));
    }
  }
}
