import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../../widgets/card-shopping.dart';
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
                          "Cart subtotal (${cartController.shoppingCards.length} items): "),
                      Text("Rp.${cartController.basketValue}",
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
                  onPressed: () {},
                  child: Text("PROCEED TO CHECKOUT"),
                ),
              ),
              SizedBox(height: 16),
              Divider(),
              Column(
                children: [
                  for (var i = 0; i < cartController.shoppingCards.length; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CardShopping(
                        body: cartController.shoppingCards[i]["body"],
                        stock: cartController.shoppingCards[i]["stock"],
                        price: cartController.shoppingCards[i]["price"],
                        img: cartController.shoppingCards[i]["img"],
                        deleteOnPress: () {
                          cartController.removeCard(i);
                        },
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
