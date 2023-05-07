import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/data/models/produk.dart';
import 'package:sahabatmt/app/modules/widgets/card-horizontal.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/appbarviews.dart';
import '../controllers/latestproduct_controller.dart';

class LatestproductView extends GetView<LatestproductController> {
  const LatestproductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        title: appbarviews(title: "Produk Terbaru"),
      ),
      body: Obx(() {
        final latestData = controller.marketData.take(4).toList();
        return ListView.builder(
          itemCount: latestData.length,
          itemBuilder: (context, index) {
            return CardHorizontal(
                title: latestData[index].nama ?? 'Error',
                img: latestData[index].gambar ?? 'Error',
                cta: latestData[index].harga.toString() ?? 'Error',
                tap: () {
                  Get.toNamed(Routes.PRODUCTDETAIL,
                      arguments: latestData[index]);
                });
          },
        );
      }),
    );
  }
}
