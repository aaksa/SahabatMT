import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';
import 'package:sahabatmt/app/modules/widgets/card-horizontal.dart';

import 'package:sahabatmt/app/data/models/Rekuest.dart';

import '../../bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../../widgets/card-horizontal-2.dart';
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
          title: "Request Status",
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.rekuestList.isEmpty
            ? const Center(
                child: Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/business1.png'),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text('Anda Belum Menawarkan AC Sama Sekali')
                  ],
                ),
              ))
            : RefreshIndicator(
                onRefresh: () {
                  return Future(() async {
                    controller.fetchRekuests();
                  });
                },
                child: Obx(
                  () => SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          for (var rekuest in controller.rekuestList)
                            CardHorizontal2(rekuest: rekuest),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}
