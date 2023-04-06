import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/card-horizontal.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
