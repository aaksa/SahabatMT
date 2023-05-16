import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/appbarviews.dart';
import '../../widgets/card-horizontal-3.dart';
import '../../widgets/card-horizontal.dart';
import '../controllers/latestlayanan_controller.dart';

class LatestlayananView extends GetView<LatestlayananController> {
  const LatestlayananView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        backgroundColor: kBackgroundColor1,
        title: appbarviews(title: "Layanan Terbaru"),
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
                  // kondisi: latestData[index].kondisi ?? "Error",
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
