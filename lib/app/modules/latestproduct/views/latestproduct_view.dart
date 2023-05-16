import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/data/models/produk.dart';
import 'package:sahabatmt/app/modules/widgets/card-horizontal.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/appbarviews.dart';
import '../../widgets/card-horizontal-3.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          final latestData = controller.marketData.toList().reversed.toList();
          return ListView.builder(
            itemCount: latestData.length,
            itemBuilder: (context, index) {
              return CardHorizontal3(
                  title: latestData[index].nama ?? 'Error',
                  img: latestData[index].gambar ?? 'Error',
                  harga: formatPrice(latestData[index].harga?.toDouble() ?? 0)
                          .toString() ??
                      "Error",
                  kondisi: 'Kondisi : ${latestData[index].kondisi}',
                  // cta: latestData[index].harga.toString() ?? 'Error',
                  cta: 'Lihat Produk',
                  tap: () {
                    Get.toNamed(Routes.PRODUCTDETAIL,
                        arguments: latestData[index]);
                  });
            },
          );
        }),
      ),
    );
  }
}
