import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';
import 'package:sahabatmt/app/modules/widgets/card-horizontal.dart';

import '../../bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        title: appbarviews(
          title: "Wishlist",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              CardHorizontal(),
              CardHorizontal(),
              CardHorizontal(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}
