import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:sahabatmt/app/modules/widgets/card-small.dart';
import 'package:sahabatmt/app/modules/widgets/cart_medium.dart';

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Searchbar(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 30,
              ),
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
                child: Row(
                  children: [
                    IconButton1(
                      icon: Icon(Icons.dashboard_outlined),
                      title: 'Barang',
                    ),
                    IconButton1(
                      icon: Icon(Icons.local_shipping_outlined),
                      title: 'Jasa',
                    ),
                    IconButton1(
                      icon: Icon(Icons.crop_square_rounded),
                      title: 'All',
                    ),
                  ],
                ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10, // replace with your actual item count
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of columns in the grid
                    crossAxisSpacing: 10, // spacing between columns
                    mainAxisSpacing: 10, // spacing between rows
                    childAspectRatio: 0.85, // width/height ratio of each item
                  ),
                  itemBuilder: (context, index) {
                    // replace this container with your actual grid item widget
                    return Container(
                      child: CardMedium(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}
