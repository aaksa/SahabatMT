// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../components/payment_webview.dart';
// import '../controllers/payment_controller.dart';
//
// class PaymentView extends StatelessWidget {
//   final PaymentController paymentController = Get.put(PaymentController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await paymentController.payProduk();
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PaymentWebView(
//                   url: paymentController.snapUrl.value,
//                 ),
//               ),
//             );
//           },
//           child: Text('Pay'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../data/models/order.dart';
import '../../../routes/app_pages.dart';
import '../components/payment_webview.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends StatefulWidget {
  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  // final myOrder = Get.arguments as Order;
  final PaymentController paymentController = Get.put(PaymentController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      paymentController.payProduk(paymentController.orderanbosku).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentWebView(
              url: paymentController.snapUrl.value,
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.HOME);
            // your custom back button action here
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Payment'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
