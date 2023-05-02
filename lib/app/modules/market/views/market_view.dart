import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:sahabatmt/app/modules/widgets/card-small.dart';
import 'package:sahabatmt/app/modules/widgets/cart_medium.dart';

import 'package:sahabatmt/app/data/models/produk.dart';

import '../../widgets/appbarview.dart';
import '../../widgets/iconbutton.dart';
import '../../widgets/searchbar.dart';
import '../controllers/market_controller.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor2,
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        automaticallyImplyLeading: false,
        title: appbarview(title: "Market"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Searchbar(),
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Text(
                "Category",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Sans',
                    fontWeight: FontWeight.w600),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Obx(() => Row(
                      children: [
                        ElevatedButton(
                          onPressed: controller.isButton1Active.value
                              ? null // If button 1 is already active, disable it
                              : () {
                                  // Otherwise, activate button 1 and deactivate button 2
                                  controller.fetchData();
                                  controller.isButton1Active.value = true;
                                  controller.isButton2Active.value = false;
                                },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.isButton1Active.value
                                  ? kPrimaryColor
                                  : kSecondaryColor,
                              disabledBackgroundColor: kPrimaryLightColor),
                          child: Text('Barang'),
                        ),
                        ElevatedButton(
                          onPressed: controller.isButton2Active.value
                              ? null // If button 2 is already active, disable it
                              : () {
                                  // Otherwise, activate button 2 and deactivate button 1
                                  controller.fetchData2();
                                  controller.isButton1Active.value = false;
                                  controller.isButton2Active.value = true;
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.isButton2Active.value
                                ? kPrimaryColor
                                : kSecondaryColor,
                            disabledBackgroundColor: kPrimaryLightColor,
                          ),
                          child: Text('Jasa'),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 30,
              ),
              child: Row(
                children: [
                  Text(
                    "Produk Terbaru",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Sans',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Obx(() => Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.marketData.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.95,
                            ),
                            itemBuilder: (context, index) {
                              Produk data = controller.marketData[index];
                              return CardMedium(
                                title: data.nama ?? '',
                                img: data.gambar!,
                                price: data.harga?.toString() ?? '',
                                produk: data,
                              );
                            },
                          ),
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}
