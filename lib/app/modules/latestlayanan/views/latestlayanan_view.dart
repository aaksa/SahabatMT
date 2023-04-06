import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';

import '../../widgets/appbarviews.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              CardHorizontal(),
            ],
          ),
        ),
      ),
    );
  }
}
