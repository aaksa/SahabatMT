// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sahabatmt/app/data/models/order.dart';
// import 'package:sahabatmt/app/modules/cart/controllers/cart_controller.dart';
//
// import '../../../routes/app_pages.dart';
//
// class AddressDialog extends StatelessWidget {
//   final CartController cartController = Get.put(CartController());
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Masukkan Nomor Hp dan Alamat'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: phoneController,
//             keyboardType: TextInputType.phone,
//             decoration: InputDecoration(
//               labelText: 'Nomor Hp',
//             ),
//           ),
//           TextField(
//             controller: addressController,
//             decoration: InputDecoration(
//               labelText: 'Alamat',
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Get.back(),
//           child: Text('Batalkan'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // TODO: Implement save functionality
//             // Get.back();
//             cartController.orderan.address = addressController.value.toString();
//             cartController.orderan.phone = phoneController.value.toString();
//             Get.toNamed(Routes.PAYMENT, arguments: cartController.orderan);
//           },
//           child: Text('Checkout'),
//         ),
//       ],
//     );
//   }
// }
