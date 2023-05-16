import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';
import 'package:sahabatmt/app/routes/app_pages.dart';

import '../../../data/models/cart.dart';
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
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.HOME);
            // your custom back button action here
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: appbarviews(
          title: "Shopping Cart",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Cart subtotal (${cartController.getTotalItemCount().toInt()} items): "),
                            Text(
                                "${cartController.formatPrice(cartController.totalPrice.toDouble())},-",
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
                          // Get.dialog(AddressDialog());
                          // List<Cart?> cartItems =
                          //     cartController.cartItemsList.value;
                          // List<Cart> nonNullableCartItems =
                          //     cartItems.whereType<Cart>().toList();
                          // cartController.setProduk(nonNullableCartItems);
                          controller.savethecurrentItemsToStorage;
                          Get.toNamed(Routes.SHIPPING_ADDRESS);
                        },
                        child: Text("PROCEED TO CHECKOUT"),
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    Column(
                      children: [
                        Obx(
                          () {
                            final cartItemsList =
                                controller.cartItemsList.value;
                            if (cartItemsList.isEmpty) {
                              return Center(
                                child: Text('Your cart is empty'),
                              );
                            } else {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount:
                                      controller.cartItemsList.value.length,
                                  itemBuilder: (context, index) {
                                    final item =
                                        controller.cartItemsList.value[index];
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: CardShopping(
                                        body: item.produk?.nama ?? '',
                                        stock: true,
                                        price: cartController.formatPrice(
                                            item.produk?.harga?.toDouble() ??
                                                0),
                                        img: item.produk?.gambar,
                                        deleteOnPress: () {
                                          controller.removeFromCart(item);
                                        },
                                        kuantitas: item.quantity ?? 1,
                                        update: (value) {
                                          controller.updateCartItemQuantity(
                                              item, value);
                                        },
                                        list: controller.dropdownValues,
                                        selectedValue: cartItemsList
                                            .value[index].quantity!,
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
