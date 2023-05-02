import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../../widgets/card-shopping.dart';
import '../components/address_dialog.dart';
import '../controllers/cart_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetView<CartController> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        backgroundColor: kBackgroundColor1,
        title: appbarviews(
          title: "Shopping Cart",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Cart subtotal (${cartController.itemCount} items): "),
                      Text("Rp.${cartController.totalPrice}",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  )),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(kPrimaryLightColor)),
                  onPressed: () {
                    print(controller.orderan.toJson());
                    Get.dialog(AddressDialog());
                  },
                  child: Text("PROCEED TO CHECKOUT"),
                ),
              ),
              SizedBox(height: 16),
              Divider(),
              Column(
                children: [
                  Obx(() {
                    if (cartController.product.nama == '' ||
                        cartController.product.nama == null ||
                        cartController.product.nama == 'none' ||
                        cartController.product.nama == ' ') {
                      return Center();
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CardShopping(
                          body: cartController.products.nama ?? '',
                          stock: true,
                          price: cartController.products.harga.toString(),
                          img: cartController.products.gambar,
                          deleteOnPress: () {
                            cartController.removeFromCart();
                          },
                          kuantitas: cartController.products.kuantitas ?? 1,
                          update: (value) {
                            cartController.updatepesanan(value);
                          },
                        ),
                      );
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
